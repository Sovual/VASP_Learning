#!/bin/bash
mkdir QHA
#建立QHA计算文件夹
for i in $(seq 0.950 0.005 1.05)
#对i赋值0.95到1.05之间，每隔0.005取值。
do

#mkdir $i
cp INCAR KPOINTS POTCAR KPATH.phonopy ./$i
#cp KPATH.phonopy ./$i

cd ./$i

#sed '2c '$i'' POSCAR > POS
phonopy -d --dim 3 3 3 -c POSCAR-unitcell
mv SPOSCAR POSCAR
#修改POSCAR中的缩放系数，并覆盖POSCAR
pwd

mpirun -np 56 vasp_std |tee runlog
#执行vasp计算
pwd

phonopy --fc  vasprun.xml
#获得力常数

phonopy -c POSCAR-unitcell  -s  -p KPATH.phonopy
#获得声子色散和声子态密度
phonopy -t KPATH.phonopy |tee  thermo.dat
#获得热学性质
cp thermal_properties.yaml ../QHA/thermal_properties-$i.yaml
#转移文件以便后续计算


V=$(awk '
        NR==2 {s=$1}
	NR==3 {split($0,a)}
	NR==4 {split($0,b)}
	NR==5 {split($0,c)}
	END {
		vol = a[1]*(b[2]*c[3] - b[3]*c[2]) - a[2]*(b[1]*c[3] - b[3]*c[1]) + a[3]*(b[1]*c[2] - b[2]*c[1])
		vol = vol * s^3
		printf "%.6f\n", (vol < 0 ? -vol : vol)
	}
' CONTCAR)
#获得当前缩放系数下体积
E=$(grep "TOTEN" OUTCAR | tail -1| awk '{printf "%12.6f \n", $5}')
#获得当前缩放系数下能量
echo $V $E >> ../QHA/v-e.dat

cd ..
done

cd ./QHA/
phonopy-qha v-e.dat thermal_properties*.yaml |tee thermo.dat
#执行QHA计算

