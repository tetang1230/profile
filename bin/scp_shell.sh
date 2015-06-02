#!/bin/bash
curDir=`pwd`
destPrefix="root@192.168.190.2:/opt/web/lehe.com/midian"

#当前script所在文件绝对路径
script=$curDir"/"$1;
scriptDir=`dirname $script`
#截取字符串
#截取'mls' 第一次出现后面的字符串
#t=${script#*mls}
destDir=${scriptDir#*pandora/}
#echo $destPrefix"/"$destDir

if [ -f "$1" ]; then
scp $1 $destPrefix"/"$destDir
fi

if [ -d "$1" ]; then
scp -r $1 $destPrefix"/"$destDir
fi
