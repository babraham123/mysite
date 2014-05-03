from blogs.models import Post
from django.contrib import admin

class PostAdmin(admin.ModelAdmin):
    fields = ['title','body','created']

admin.site.register(Post, PostAdmin)

