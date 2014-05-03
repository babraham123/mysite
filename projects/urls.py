from django.conf.urls import patterns, include, url

urlpatterns = patterns('projects.views',
    url(r'^$', 'projlist'),
    url(r'^(?P<proj_id>\d+)/$', 'projpage'),
)
