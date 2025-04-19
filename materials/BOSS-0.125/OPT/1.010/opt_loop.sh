#!/bin/bash

# 设置最大循环次数
MAX_ITER=200
count=1

while [ $count -le $MAX_ITER ]; do
    echo "🔁 第 $count 次结构优化开始..."

    # 请修改成需要的核数
    mpirun -np 36 vasp_std | tee runlog

    if grep -q "reached required accuracy" runlog; then
        echo "✅ 已收敛：reached required accuracy"
        break
    fi

    echo "⚠️ 未收敛，准备第 $((count+1)) 次优化..."

    if [ ! -f CONTCAR ]; then
        echo "❌ 未找到 CONTCAR，无法继续"
        exit 1
    fi

    cp CONTCAR POSCAR

    echo "🧹 清理非必要文件..."
    for file in *; do
        if [[ "$file" != "INCAR" && "$file" != "KPOINTS" && "$file" != "POSCAR" && "$file" != "POTCAR" && "$file" != "CONTCAR" && "$file" != "opt_loop.sh" &&   "$file" != "runlog" ]]; then
            rm -rf "$file"
        fi
    done

    ((count++))
done

if [ $count -gt $MAX_ITER ]; then
    echo "❗ 超过最大循环次数 $MAX_ITER，仍未收敛，请检查结构或参数"
    exit 2
fi

