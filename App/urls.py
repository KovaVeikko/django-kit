from django.urls import path
from App import views
from App.api import example

urlpatterns = [
    path('api/example', example.ExampleAPI.as_view()),
    path('', views.index),
]
