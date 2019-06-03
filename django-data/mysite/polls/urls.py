#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun  3 10:48:17 2019

@author: Paolo Cozzi <cozzi@ibba.cnr.it>
"""

from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
]
