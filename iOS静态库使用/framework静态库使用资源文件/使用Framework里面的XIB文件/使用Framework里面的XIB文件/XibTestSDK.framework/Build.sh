#!/bin/sh

#  Build.sh
#  XibTestSDK
#
#  Created by zainguo on 2020/6/4.
#  Copyright © 2020 zainguo. All rights reserved.


#注意：脚本目录和xxxx.xcodeproj要在同一个目录，如果放到其他目录，请自行修改脚本。
#要build的target名
target_Name=XibTestSDK
echo "target_Name=${target_Name}"

#工程名
project_name=$target_Name
echo "project_name=${project_name}"

#打包模式 Debug/Release 默认是Release
development_mode=Debug


#当前脚本文件所在的路径 $(pwd)
SCRIPT_DIR=$(pwd)
echo "======脚本路径=${SCRIPT_DIR}======"

#工程路径
#PROJECT_DIR=${SCRIPT_DIR} 和下面写法也样
PROJECT_DIR=$SCRIPT_DIR
echo "======工程路径=${PROJECT_DIR}======"

#build之后的文件夹路径
build_DIR=$SCRIPT_DIR/Build
echo "======Build路径=${build_DIR}======"

#真机build生成的头文件的文件夹路径
DEVICE_DIR_INCLUDE=${build_DIR}/${development_mode}-iphoneos/include/${project_name}



#真机build生成的.a文件路径
DEVICE_DIR_A=${build_DIR}/${development_mode}-iphoneos/lib${project_name}.a
echo "======真机.a路径=${DEVICE_DIR_A}======"

#模拟器build生成的.a文件路径
SIMULATOR_DIR_A=${build_DIR}/${development_mode}-iphonesimulator/lib${project_name}.a
echo "======模拟器.a路径=${SIMULATOR_DIR_A}======"


#目标文件夹路径（也就SDK的文件：.a文件 和 头文件）
INSTALL_DIR=${build_DIR}/Products/${project_name}
echo "======SDK的文件夹路径=${INSTALL_DIR}======"

#目标头文件的文件夹路径
INSTALL_DIR_Headers=${build_DIR}/Products/${project_name}/Headers
echo "======头文件的文件夹路径=${INSTALL_DIR}======"

#目标.a路径
INSTALL_DIR_A=${build_DIR}/Products/${project_name}/lib${project_name}.a
echo "======目标.a路径=${INSTALL_DIR}======"


#图片资源资源
BUNDLE_DIR_INCLUDE=${build_DIR}/${development_mode}-iphoneos/${bundle_name}.bundle
echo "图片资源资源路径=${BUNDLE_DIR_INCLUDE}"

#判断build文件夹是否存在，存在则删除
#rm -rf 命令的功能:删除一个目录中的一个或多个文件或目录
if [ -d "${build_DIR}" ]
then
rm -rf "${build_DIR}"
fi


#判断目标文件夹是否存在，存在则删除该文件夹
if [ -d "${INSTALL_DIR}" ]
then
rm -rf "${INSTALL_DIR}"
fi

#创建目标文件夹
mkdir -p "${INSTALL_DIR}"



echo "======盒子已经准备好了，开始生产.a 并合成装到盒子里吧======"

#build之前clean一下
xcodebuild -target ${target_Name} -configuration ${development_mode} -sdk iphonesimulator clean

xcodebuild -target ${target_Name} -configuration ${development_mode} -sdk iphoneos clean

#模拟器build
xcodebuild -target ${target_Name} -configuration ${development_mode} -sdk iphonesimulator

#真机build
xcodebuild -target ${target_Name} -configuration ${development_mode} -sdk iphoneos


#复制头文件到目标文件夹
#使用-R参数可实现递归功能，即所有子目录中的文件与目录均拷贝
cp -R "${DEVICE_DIR_INCLUDE}" "${INSTALL_DIR_Headers}"



#将图片资源copy到目标文件夹
cp -R "${BUNDLE_DIR_INCLUDE}" "${INSTALL_DIR}"



#合成模拟器和真机.a包
lipo -create "${DEVICE_DIR_A}" "${SIMULATOR_DIR_A}" -output "${INSTALL_DIR_A}"

echo "======合成结束======"



# -f 判断文件是否存在
if [ -f "${INSTALL_DIR_A}" ]
then
echo "======验证合成包是否成功======"
lipo -info "${INSTALL_DIR_A}"
fi


