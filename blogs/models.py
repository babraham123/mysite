from django.db import models

class Post(models.Model):
    title = models.CharField(max_length=100)
    body = models.TextField()
    created = models.DateField('date created')
    def __unicode__(self):
        return self.title
