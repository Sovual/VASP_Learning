# VASP

### 软件安装

[B站](https://www.bilibili.com/video/BV1uRPKeNE4i/?spm_id_from=333.1387.homepage.video_card.click&vd_source=40a48245864eb8114b1d1e6e1c6113e7)

### 软件问题

[运算量太大无法运行(174)的解决办法](https://blog.csdn.net/lwl_666/article/details/82699759)


### 结构优化opt

[B站合集](https://www.bilibili.com/opus/1006527467019567136)
[INCAR参数设置](https://mp.weixin.qq.com/s?__biz=MzkwNTM5MTI2NA==&mid=2247483665&idx=1&sn=7bf4a90aae37dec15bbd3e6afe881f87&chksm=c0f93cdef78eb5c8a2b46da38a2dc1bf141fb03caf88c34250832823812fc91d309f2aa5ad6a&scene=21#wechat_redirect)

EDFFIG无法收敛且一直报错时，可以试试加上`NELMIN = 5`，`NELM = 150`，也可以把`IBRION`设置为`1`改为阻尼法

### 分子动力学

[B站视频](https://www.bilibili.com/video/BV1R4txetEGX/?vd_source=40a48245864eb8114b1d1e6e1c6113e7)






# phonopy

### 声子谱绘制

[vasp + phonopy 绘制声子谱](https://zhuanlan.zhihu.com/p/481680637)

### 非解析项修正（伯恩修正）

[伯恩修正](https://blog.csdn.net/icehoqion/article/details/130182336)，也可在[官方手册](https://phonopy.github.io/phonopy/vasp.html)中的"Interfaces to calculators -> VASP & phonopy"中搜索born找到

### 声子群速度绘图

[声子群速度](https://blog.csdn.net/icehoqion/article/details/131843370)

### 热膨胀系数

[热膨胀系数和格林奈森常数等](https://blog.csdn.net/icehoqion/article/details/131506119)





# ShengBTE
### 安装

[spglib](https://www.bilibili.com/opus/830089132724191235)

[ShengBTE](https://blog.csdn.net/icehoqion/article/details/125183366)
要注意的太多了，按下面的来
```
export FFLAGS=-traceback -debug -O2 -static-intel -qopenmp
export LDFLAGS=-L/home/lynx/Software/ShengBTE/spglib/lib -lsymspg #路径记得改
export MPIFC=mpiifx
MKL=$(MKLROOT)/lib/intel64/libmkl_lapack95_lp64.a -Wl,--start-group \
$(MKLROOT)/lib/intel64/libmkl_intel_lp64.a           \
$(MKLROOT)/lib/intel64/libmkl_sequential.a           \
$(MKLROOT)/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm
export LAPACK=$(MKL)
export LIBS=$(LAPACK)
```

[Thirdoder](https://zhuanlan.zhihu.com/p/682630507)
注意两个路径应该是spglib里面的include和lib





# Vesta

### 基本用法和原子掺杂

[B站视频](https://www.bilibili.com/video/BV1nh411G7Kf/?spm_id_from=333.337.search-card.all.click&vd_source=40a48245864eb8114b1d1e6e1c6113e7)





# 声子相关

[声子基础知识，知乎专栏](https://zhuanlan.zhihu.com/p/658851809)