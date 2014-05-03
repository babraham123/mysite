from django import forms

class ContactForm(forms.Form):
    subject = forms.CharField(max_length=100, help_text='100 characters max.')
    message = forms.CharField(widget=forms.Textarea)
    sender = forms.EmailField(help_text='Must be a valid address.')
    # attachment = forms.FileField(required=False)
    cc_myself = forms.BooleanField(required=False)

