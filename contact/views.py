from django.shortcuts import render, render_to_response
from django.http import HttpResponseRedirect
from contact.models import ContactForm
from django.core.context_processors import csrf

def contact(request):
    if request.method == 'POST': # If the form has been submitted...
        form = ContactForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            subject = form.cleaned_data['subject']
            message = form.cleaned_data['message']
            sender = form.cleaned_data['sender']
            cc_myself = form.cleaned_data['cc_myself']
            
            recipients = ['babraham42@gmail.com']
            if cc_myself:
                recipients.append(sender)
            from django.core.mail import send_mail
            subject = subject + " [" + sender + "]"
            send_mail(subject, message, sender, recipients)

            return HttpResponseRedirect('/contact/thanks/') # Redirect after POST
    else:
        form = ContactForm() # An unbound form

    #context = RequestContext(request, {'form':form})
    context = {'form':form}
    context.update(csrf(request))
    return render_to_response('contacts.html', context)

def thanks(request):
    return render_to_response('thanks.html')

