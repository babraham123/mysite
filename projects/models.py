from django.db import models

class Project(models.Model):
    title = models.CharField(max_length=200)
    comp_date = models.DateTimeField('date completed')
    subtitle = models.CharField(max_length=200)
    description = models.CharField(max_length=1000)
    tech_skills = models.CharField(max_length=1000)
    def __unicode__(self):
        return self.title

class Link(models.Model):
    project = models.ForeignKey(Project)
    address = models.CharField(max_length=200)
    title = models.CharField(max_length=200)
    def __unicode__(self):
        return self.title

class Picture(models.Model):
    project = models.ForeignKey(Project)
    address = models.CharField(max_length=200)
    title = models.CharField(max_length=200)
    def __unicode__(self):
        return self.address

class Video(models.Model):
    project = models.ForeignKey(Project)
    embed = models.CharField(max_length=200)
    title = models.CharField(max_length=200)
    def __unicode__(self):
        return self.title
