vimide
Author:ymc023   Email:ymc023@163.com

### 前言
____

##### 通过配置vim，使vim带有python,go补全,代码检查，标签跳转，目录结构展示，自动缩进，代码格式化等 <br>

### 安装
 
>1. 安装python3,vim (注意,python >3.6,vim >8) <br>
>2. 安装git <br>
>3. clone配置文件： git clone https://github.com/ymc023/vimide.git <br>
>4. cd vimide && bash install.sh <br>
>5. 等待脚本自动安装插件完成! <br>


### 注意
+ 当系统为centos7时：
+ python3，需要使用 --enable-shared ---with-ssl-default-suites=openssl 进行编译
+ vim8，需要使用 --enable-python3interp=yes --with-python-config-dir=  进行编译
+ vim --version |grep python 可查看是否支持python,如果，显示为+python3/dyn
    则需要重新编译python和vim
+ 安装YouCompleteMe，如果你的Gcc版本太低，提示要安装devtoolset-8,则先安装devtoolset-8
+ 然后执行下面步骤后,重新编译YouCompleteMe
```
 scl enable devtoolset-8 -- bash
 source /opt/rh/devtoolset-8/enable
 export CC=/opt/rh/devtoolset-8/root/usr/bin/gcc
 export CPP=/opt/rh/devtoolset-8/root/usr/bin/cpp
 export CXX=/opt/rh/devtoolset-8/root/usr/bin/c++
 gcc --version

```
+ ubuntu 20.04.1 已测试，可略过python3,vim8安装，直接使用gcc 9.3.0编译YouCompleteMe
    install.py --go-completer --clang-completer





