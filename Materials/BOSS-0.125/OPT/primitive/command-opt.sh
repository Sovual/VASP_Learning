#!/bin/bash

#建立QHA计算文件夹
for i in $(seq 0.96 0.005 1.04)
#对i赋值0.95到1.05之间，每隔0.005取值。
do
mkdir $i
cp KPOINTS INCAR POTCAR POSCAR-unitcell opt_loop.sh ./$i
#cp INCAR-OPT ./$i/INCAR
cd ./$i
sed '2c '$i'' POSCAR-unitcell > temp
mv temp POSCAR
bash opt_loop.sh
#mv CONTCAR POSCAR
#rm POSCAR
cd ..
done


#执行QHA计算
