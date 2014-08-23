from projects.models import Project, Link, Video, Picture
from django.contrib import admin

class LinkInline(admin.TabularInline):
    model = Link
    extra = 2

class VideoInline(admin.TabularInline):
    model = Video
    extra = 2

class PictureInline(admin.TabularInline):
    model = Picture
    extra = 2

class ProjectAdmin(admin.ModelAdmin):
    fields = ['title','subtitle','comp_date','description','tech_skills']
    inlines = [LinkInline, VideoInline, PictureInline]

admin.site.register(Project, ProjectAdmin)

