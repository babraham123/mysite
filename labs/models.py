from django.db import models
from django import forms

class Table(models.Model):
    title = models.CharField(max_length=200)
    key = models.CharField(max_length=100)
    ip = models.GenericIPAddressField()
    port = models.PositiveIntegerField()
    def __unicode__(self):
        return self.title

class KeyForm(forms.Form):
    key = forms.CharField(widget=forms.PasswordInput(), max_length=100)

class Lab(models.Model):
    title = models.CharField(max_length=100)
    filename = models.CharField(max_length=100)
    description = models.CharField(max_length=1000)
    icon_address = models.CharField(max_length=100)
    created = models.DateField('date created')
    def __unicode__(self):
        return self.title