#!/bin/python3.7
import numpy

tara = 0.0
ref = 100.0
ref_acc = 0.0005
print_res = 10.0
data_range = [0.01,0.1,1.0,10.0,100.0]

ref_acc_percent = ((ref_acc/ref)*100.0)

def print_range(i):
  print("%.6f" % i,end='')
  print('\t\t',end='')
  print("%.6f" % ((i*ref_acc_percent)),end='')
  print('')

for j in data_range:
  for i in numpy.arange(0.0, j, j/print_res):
    print_range(i)
