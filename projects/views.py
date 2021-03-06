from django.http import Http404
from django.shortcuts import render
from projects.models import Project

# Create your views here.
def projlist(request):
    latest_proj_list = Project.objects.all().order_by('-comp_date')[:]
    for proj in latest_proj_list:
        pics = proj.picture_set.all()
        if pics:
            proj.picture_address = pics[0]
        else:
            proj.picture_address = 'sheep.png'

    context = {'latest_proj_list':latest_proj_list}
    return render(request, 'projlist.html', context)

def projpage(request, proj_id):
    try:
        proj = Project.objects.get(pk=proj_id)
    except Project.DoesNotExist:
        raise Http404
    return render(request, 'projpage2.html', {'proj': proj})
