from django.shortcuts import render

# Create your views here.
def jean(request):
    return render(request, 'jean/index.html')