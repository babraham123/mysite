from django.conf.urls import patterns, include, url

urlpatterns = patterns('blogs.views',
    url(r'^$', 'postlist'),
    url(r'^(?P<post_id>\d+)/$', 'postpage'),
)
