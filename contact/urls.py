from django.conf.urls import patterns, include, url

urlpatterns = patterns('contact.views',
    url(r'^$', 'contact'),
    url(r'^thanks/', 'thanks'),
)
