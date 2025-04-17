#!/bin/bash

#手动填入job数量及扩胞倍数
job_number=8
dim="2 2 2"

phonopy -d --dim="$dim" -c POSCAR-unitcell
pwd

for i in $(seq 1 $job_number)

do

dir=$(printf "job-%03d" $i)
mkdir $dir

cp INCAR POTCAR KPOINTS $dir
cp POSCAR-$(printf "%03d" $i) $dir/POSCAR

cd $dir
mpirun -np 36 vasp_std | tee runlog

cd ..

done

