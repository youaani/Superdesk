define([
	'jquery',
	'utils/date-format',
	'utils/find-enviroment',
	'plugins',
	'jquery/xdomainrequest',
	'i18n',
	'css'
], function($, dateFormat, findEnviroment, plugins){
		dateFormat.masks['post-date'] = _('mm/dd/yyyy HH:MM');
		dateFormat.masks['status-date'] = _('HH:MM');
		dateFormat.masks['closed-date'] = _('mm/dd/yyyy HH:MM');
		dateFormat.i18n = {
			dayNames: _("Sun,Mon,Tue,Wed,Thu,Fri,Sat,Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday").toString().split(","),
			monthNames: _("Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,January,February,March,April,May,June,July,August,September,October,November,December").toString().split(",")
		};
		return function(blog){
			$.each(plugins, function(key, value){
				value(blog.get('EmbedConfig'));
      })
      var BlogView;
      if (liveblog.theme === 'live-dashboard'){
        require(['views/live-dashboard-blog'], function(DashboardBlogViewDef){
          BlogView = DashboardBlogViewDef();
          new BlogView({ el: liveblog.el, model: blog });
        });
      } else {
        require(['views/blog'], function(BlogViewDef){
          BlogView = BlogViewDef();
          new BlogView({ el: liveblog.el, model: blog });
        });
      }
		}
});