#!/bin/bash

for i in 1 2 4 8 12 24 36 48
do
  gcc -O2 -std=c99 -DNUM_THREADS=$i -DMEM_OFF=0 -DNON_NUMA stream-pthreads.c -pthread -lpthread -lnuma -o test_no_off
  echo "No off $i"
  ./test_no_off > NO_OFF_$i
done


for i in 1 2 4 8 12 24 36 48
do
  gcc -O2 -std=c99 -DNUM_THREADS=$i -DMEM_OFF=1 -DNON_NUMA stream-pthreads.c -pthread -lpthread -lnuma  -o test_off
  echo "Off $i"
  ./test_off > OFF_$i
done

for i in 1 2 4 8 12 24 36 48
do
  gcc -O2 -std=c99 -DNUM_THREADS=$i -DMEM_OFF=0 -DSTRIDE=1 -DNON_NUMA stream-pthreads.c -pthread -lpthread -lnuma  -o test_no_off_no_stride
  echo "No off $i"
  ./test_no_off_no_stride > NO_OFF_NO_STRIDE_$i
done


for i in 1 2 4 8 12 24 36 48
do
  gcc -O2 -std=c99 -DNUM_THREADS=$i -DMEM_OFF=1 -DSTRIDE=1 -DNON_NUMA stream-pthreads.c -pthread -lpthread -lnuma  -o test_off_no_stride
  echo "Off $i"
  ./test_off_no_stride > OFF_NO_STRIDE_$i
done
