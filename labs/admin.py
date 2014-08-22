from labs.models import Table
from labs.models import Lab
from django.contrib import admin

myModels = [Table, Lab]
admin.site.register(myModels)

