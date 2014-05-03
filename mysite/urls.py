from django.conf.urls import patterns, include, url
from django.views.generic.base import *
#from django.views.generic.simple import *

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$',  TemplateView.as_view(template_name='index3.html')),
    url(r'^project/', include('projects.urls', namespace="projects")),
    url(r'^contact/', include('contact.urls', namespace="contact")),
    url(r'^blog/', include('blogs.urls', namespace="blogs")),
    url(r'^lab/', include('labs.urls', namespace="labs")),
    # Examples:
    # url(r'^$', 'mysite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
)
