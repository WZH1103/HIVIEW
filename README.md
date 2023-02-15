#
# Hi3516DV300开发环境配置指南（Linux）

## 一、硬件需求

- 基于Hi3516DV300芯片的视觉开发板: 产品链接:<https://item.taobao.com/item.htm?spm=a1z09.2.0.0.28712e8dNp1jn9&id=634877394628&_u=f2n2pj5q677e>

## 二、开发环境
- 本实例安装如下Linux系统，本开发包默认均以此Linux操作系统进行编译(Ubuntu22.04):
```shell
Linux version 5.15.0-60-generic (buildd@lcy02-amd64-054) (gcc (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #66-Ubuntu SMP Fri Jan 20 14:29:49 UTC 2023
```

## 三、网络环境搭建
- 自行配置网络，并安装nfs，ssh等网络组件

## 四、软件包安装
- 1、配置默认使用bash,选择 **no**
```shell
sudo dpkg-reconfigure dash 
```
- 2、安装软件包
```shell
sudo apt install make libc6:i386 lib32z1 lib32stdc++6 zlib1g-dev libncurses5-dev ncurses-term libncursesw5-dev g++ u-boot-tools texinfo texlive gawk libssl-dev openssl bc
```
3、创建/etc/ld.so.preload 文件，并执行echo "" > /etc/ld.so.preload,以解决64bit Linux server 上某些第三方库编译失败的问题。
```shell
sudo vi /etc/ld.so.preload
sudo echo "" > /etc/ld.so.preload
```

## 五、安装交叉编译工具
- 1、解压工具链
```shell
tar -xvf arm-himix200-linux.tgz
```
- 2、安装工具链
```shell
cd arm-himix200-linux/

sudo ./arm-himix200-linux.install 
```

## 六、重启系统
#
# 编译工程
## 一、环境配置
```shell
source build/3516d
```
## 二、全部工程编译，输出在bin文件夹中
```shell
make
```
## 三、编译单个工程
```shell
cd mod/app

make
```
## 四、清除编译文件
```shell
make clean
```

#
# EXAMPLE
```shell
1, BSP:   Eth/WiFi/Vpn/Upgrade/Sadp
2, MPP:   Hi3516x/Hi3519x/Hi3559x/Hi3536x
3, CODEC: H264/H265/MJPEG/AAC/PCMA/PCMU
4, RTSPS: Server/Client/Push
5, WEBS:  Http/Https/Websocket/Webrtc
6, APP:   NVR/GUI
7, REC:   fMP4
8, RTMPS: Push
9, SIPS:  UAS/GB28181
10, ONVIF: NVT/NVC
11, SRTS: SRT/UDP/RTP/SRTP
12, SVP:  YOLO/LPR
13, UVC:  H264/MJPEG
```
