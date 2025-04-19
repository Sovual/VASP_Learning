#!/bin/bash

#建立QHA计算文件夹
for i in $(seq 0.95 0.005 1.05)
#对i赋值0.95到1.05之间，每隔0.005取值。
do
mkdir $i
cp KPOINTS INCAR POTCAR POSCAR-unitcell opt_loop.sh ./$i

cd ./$i
sed '2c '$i'' POSCAR-unitcell > temp
mv temp POSCAR
bash opt_loop.sh

cd ..
done
