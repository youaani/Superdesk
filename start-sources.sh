ALLYPATH=../
ALLYCOM=${ALLYPATH}components/
PYTHONPATH=${PYTHONPATH}:${ALLYCOM}ally-api
PYTHONPATH=${PYTHONPATH}:${ALLYCOM}ally-core
PYTHONPATH=${PYTHONPATH}:${ALLYCOM}ally-core-http
PYTHONPATH=${PYTHONPATH}:${ALLYCOM}ally-core-plugin
PYTHONPATH=${PYTHONPATH}:${ALLYCOM}ally-core-sqlalchemy
PYTHONPATH=${PYTHONPATH}:${ALLYCOM}ally-http
PYTHONPATH=${PYTHONPATH}:${ALLYCOM}ally-http-asyncore-server
PYTHONPATH=${PYTHONPATH}:${ALLYCOM}ally-http-mongrel2-server
PYTHONPATH=${PYTHONPATH}:${ALLYCOM}ally-utilities
PYTHONPATH=${PYTHONPATH}:${ALLYCOM}service-cdm
PYTHONPATH=${PYTHONPATH}:${ALLYCOM}service-security

ALLYPLUG=${ALLYPATH}plugins/
PYTHONPATH=${PYTHONPATH}:${ALLYPLUG}administration
PYTHONPATH=${PYTHONPATH}:${ALLYPLUG}distribution
PYTHONPATH=${PYTHONPATH}:${ALLYPLUG}gui-action
PYTHONPATH=${PYTHONPATH}:${ALLYPLUG}gui-core
PYTHONPATH=${PYTHONPATH}:${ALLYPLUG}gui-security
PYTHONPATH=${PYTHONPATH}:${ALLYPLUG}internationalization
PYTHONPATH=${PYTHONPATH}:${ALLYPLUG}security
PYTHONPATH=${PYTHONPATH}:${ALLYPLUG}security-http-acl
PYTHONPATH=${PYTHONPATH}:${ALLYPLUG}security-rbac
PYTHONPATH=${PYTHONPATH}:${ALLYPLUG}support-acl
PYTHONPATH=${PYTHONPATH}:${ALLYPLUG}support-sqlalchemy

FULLPATH=
SUPERPLUG=${FULLPATH}plugins/
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}livedesk
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}livedesk-embed
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}media-archive
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}media-archive-audio
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}media-archive-image
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}media-archive-video
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}superdesk
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}superdesk-collaborator
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}superdesk-country
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}superdesk-language
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}superdesk-person
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}superdesk-person-icon
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}superdesk-post
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}superdesk-security
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}superdesk-source
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}superdesk-user
PYTHONPATH=${PYTHONPATH}:${SUPERPLUG}url-info

#echo $PYTHONPATH
export PYTHONPATH=$PYTHONPATH
rm -f distribution/workspace/shared/superdesk.db
python3.2 distribution/application.py
#python3.2 distribution/application.py -dump
