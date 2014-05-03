from django.shortcuts import render, render_to_response
from django.http import HttpResponse, HttpResponseRedirect, Http404
from ipware.ip import get_real_ip
from labs.models import Table, KeyForm
from django.views.decorators.csrf import csrf_exempt

def publicip(request):
    return HttpResponse(get_ip(request))

def test(request):
    arduino_ip = '68.173.83.103'
    context = {'ip':arduino_ip}
    return render(request, 'websocket_test.html', context)

def initialize(request):
    arduino_ip = get_ip(request)
    # grab from the query string
    arduino_key = request.GET.get('key')
    arduino_port = int(request.GET.get('port', '8383'))
    
    # keys must be unique
    tables = Table.objects.all().filter(key=arduino_key)
    if not tables or len(tables) != 1:
        return HttpResponse('Error: table not found')

    # update the model
    table = tables[0]
    table.ip = arduino_ip
    table.port = arduino_port
    table.save()
    return HttpResponse('Status: OK')

@csrf_exempt
def landing(request):
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
