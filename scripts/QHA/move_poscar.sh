#!/bin/bash

#在QHA文件下运行

for i in $(seq 0.95 0.005 1.05)
#对i赋值0.95到1.05之间，每隔0.005取值。
do

mkdir $i

cp ../OPT/$i/CONTCAR ./$i/POSCAR-unitcell

done
