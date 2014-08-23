from django.shortcuts import render, render_to_response
from django.http import HttpResponse, HttpResponseRedirect, Http404
from ipware.ip import get_real_ip
from labs.models import Table, KeyForm, Lab
from django.views.decorators.csrf import csrf_exempt
import json

def landing(request):
    labs = Lab.objects.all().order_by("title")[:]
    context = {'labs':labs}
    return render(request, 'landing.html', context)

def publicip(request):
    return HttpResponse( json.dumps({'ip':get_ip(request)}), content_type="application/json" )

@csrf_exempt
def key_input(request):
    if request.method == 'POST': # If the form has been submitted...
        form = KeyForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            table_key = form.cleaned_data['key']

            # check validity of the table key
            tables = Table.objects.all().filter(key=table_key)
            if not tables or len(tables) != 1:
                raise Http404
            
            table = tables[0]
            context = {'table':table}
            return render_to_response('websocket.html', context)
    else:
        form = KeyForm() # An unbound form

    context = {'form':form}
    return render_to_response('landing.html', context)

def get_ip(request):
    real_ip = get_real_ip(request)
    if real_ip is not None:
        return str(real_ip)
    else:
        return 'None'
