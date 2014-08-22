from labs.models import Table
from django.contrib import admin

class TableAdmin(admin.ModelAdmin):
    fields = ['title','key','ip','port']

admin.site.register(Table, TableAdmin)
