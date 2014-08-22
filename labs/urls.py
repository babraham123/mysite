from django.conf.urls import patterns, include, url

urlpatterns = patterns('labs.views',
    url(r'^$', 'landing'),
    url(r'^publicip/', 'publicip'),
)
