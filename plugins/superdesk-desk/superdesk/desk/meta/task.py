'''
Created on April 2, 2013

@package: superdesk desk
@copyright: 2013 Sourcefabric o.p.s.
@license: http://www.gnu.org/licenses/gpl-3.0.txt
@author: Martin Saturka

Contains the SQL alchemy meta for desk task API.
'''

from ..api.task import Task
from ..meta.desk import DeskMapped
from ..meta.task_status import TaskStatusMapped
from sqlalchemy.dialects.mysql.base import INTEGER
from sqlalchemy.schema import Column, ForeignKey
from sqlalchemy.types import String, Text, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.associationproxy import association_proxy
from superdesk.meta.metadata_superdesk import Base
from superdesk.user.meta.user import UserMapped
from ally.support.sqlalchemy.mapper import validate

# --------------------------------------------------------------------

TASK_TABLE_NAME = 'desk_task'

@validate(exclude=('Status',))
class TaskMapped(Base, Task):
    '''
    Provides the mapping for Task.
    '''
    __tablename__ = TASK_TABLE_NAME
    __table_args__ = dict(mysql_engine='InnoDB', mysql_charset='utf8')

    Id = Column('id', INTEGER(unsigned=True), primary_key=True)
    Parent = Column('fk_parent_id', ForeignKey(TASK_TABLE_NAME+'.id', ondelete='RESTRICT'), nullable=True)
    # can not set ondelete='CASCADE', since we need to manually preserve the nested sets structure
    # therefore we have the nullable=True as well
    Desk = Column('fk_desk_id', ForeignKey(DeskMapped.Id, ondelete='SET NULL'), nullable=True)
    User = Column('fk_user_id', ForeignKey(UserMapped.Id, ondelete='SET NULL'), nullable=True)
    Title = Column('title', String(255), unique=False, nullable=False)
    Description = Column('description', Text, nullable=True)
    StartDate = Column('start_date', DateTime, nullable=True)
    DueDate = Column('due_date', DateTime, nullable=True)
    Status = association_proxy('status', 'Key')
    # Non REST model attribute ---------------------------------------
    statusId = Column('fk_status_id', ForeignKey(TaskStatusMapped.id, ondelete='RESTRICT'), nullable=False)
    status = relationship(TaskStatusMapped, uselist=False, lazy='joined')

# --------------------------------------------------------------------

class TaskNestMapped(Base):
    '''
    Provides the mapping for nested sets for Task hierarchy.
    '''
    __tablename__ = 'desk_task_nest'
    __table_args__ = dict(mysql_engine='InnoDB', mysql_charset='utf8')

    id = Column('id', INTEGER(unsigned=True), primary_key=True)
    # can not cascade removal, since it would damage the nested sets structure
    task = Column('fk_task_id', ForeignKey(TaskMapped.Id, ondelete='SET NULL'), nullable=True)
    group = Column('group', INTEGER, nullable=False)
    upperBar = Column('upper_bar', INTEGER, nullable=False)
    lowerBar = Column('lower_bar', INTEGER, nullable=False)
