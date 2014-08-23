from django.shortcuts import render, render_to_response
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.core.urlresolvers import reverse
from blogs.models import Post
from django.http import Http404

def postlist(request):
    posts = Post.objects.all().order_by("-created")
    paginator = Paginator(posts, 2)

    try:
        page = int(request.GET.get("page", '1'))
    except ValueError: 
        page = 1

    try:
        posts = paginator.page(page)
    except (InvalidPage, EmptyPage):
        posts = paginator.page(paginator.num_pages)

    return render_to_response("postlist.html", {'posts':posts})

def postpage(request, post_id):
    try:
        post = Post.objects.get(pk=post_id)
    except Post.DoesNotExist:
        raise Http404
    return render(request, 'postpage.html', {'post': post})
