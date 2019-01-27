#!/bin/bash

source ./utils/string.sh
source ./utils/locales.sh
source ./utils/ENV.sh

# The MIT License (MIT)

# Copyright (c) 2019 lolimay <lolimay@lolimay.cn>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


# Install Dependencies
is_gifsicle_installed=`which gifsicle`
is_convert_installed=`which convert`

if [ -z "$is_gifsicle_installed" ];then
    localize '\033[32m[信息] 依赖 gifsicle 未安装，开始尝试为你自动安装...\033[0m' 'Usage: '$0' <gif-to-be-compressed>.gif'
    sudo apt install gifsicle -y
fi

if [ -z "$is_convert_installed" ];then
    localize '\033[32m[信息] 依赖 imagemagick 未安装，开始尝试为你自动安装...\033[0m' 'Usage: '$0' <gif-to-be-compressed>.gif'
    sudo apt install imagemagick -y
fi


if [ -z "$1" ];then
    localize '\033[31m[错误] 未指定需要压缩的GIF文件 \033[0m' 'Usage: '$0' <gif-to-be-compressed>.gif'
    exit
fi

if [ ! -f "$1" ];then
    localize '\033[31m[错误] 指定的GIF文件不存在 \033[0m' 'Usage: '$0' <gif-to-be-compressed>.gif'
    exit 1
fi

# get input file name and extension name
input_full_filename=`echo $1`
input_filename=`echo "${input_full_filename%.*}"`
input_extension=`echo "${input_full_filename##*.}"`
output_full_filename=`echo "${input_filename}_compressed.gif"`
output_filename=`echo "${output_full_filename%.*}"`
output_extension=`echo "${output_full_filename##*.}"`

# check if this file is *.gif
if [ ! "$input_extension" == "gif" ];then
    localize '\033[31m[错误] \033[0m指定的文件不是GIF文件 ' 'unfinished'
    exit 1
fi

# get original gif image size
original_size=`stat -c "%s" $1`
original_size_kb=`echo "scale=2; $original_size/1024" | bc`
original_size_mb=`echo "scale=2; $original_size/1048576" | bc`
original_size_mb_flag=`awk 'BEGIN{ print '$original_size_kb'>=1024 }'`
original_colorspace=`identify $1 | awk '{print $7}' | sed -n '1p' | tr -cd "[0-9]"`

localize '\033[32m[信息] \033[0m文件名: \033[32m'$1'\033[0m' 'Usage: '$0' <gif-to-be-compressed>.gif'

if [ "$original_size_mb_flag" -eq 1 ];then
    localize '\033[32m[信息] \033[0m文件大小: \033[32m'$original_size_mb' MB\033[32m\033[0m' ''
else
    localize '\033[32m[信息] \033[0m文件大小: \033[32m'$original_size_kb' KB\033[32m\033[0m' 'Usage: '$0' <gif-to-be-compressed>.gif'
fi

localize '\033[32m[信息] \033[0m颜色位数: \033[32m'$original_colorspace' 位\033[32m\033[32m\033[0m' 'Usage: '$0' <gif-to-be-compressed>.gif'


# get colorspace
localize '\033[32m[信息]\033[0m 请输入压缩后的颜色位数(默认\033[4;35m128\033[0m):'
localize_n '\033[36m[输入]\033[0m\t\b'
read output_colorspace

if [ -z "$output_colorspace" ];then
    output_colorspace="128"
    echo -en "\e[1A"
    localize '\033[36m[输入]\033[0m 使用默认值\033[35m128\033[0m'
fi

while [ "$output_colorspace" -gt "$original_colorspace" ]
do
    localize '\033[31m[错误]\033[0m 输入值不能大于当前值'
    localize_n '\033[32m[信息]\033[0m 请重新输入输出颜色位数(默认\033[4;35m128\033[0m):'
    localize_n '\033[36m[输入]\033[0m\t\b'
    read output_colorspace
done

# get compress level
localize '\033[32m[信息]\033[0m 请输入压缩级别[1|2|3|4|5|6|7] (默认\033[4;35m4\033[0m):'
localize_n '\033[36m[输入]\033[0m\t\b'
read compress_level

if [ -z "$compress_level" ];then
    compress_level="4"
    echo -en "\e[1A"
    localize '\033[36m[输入]\033[0m 使用默认值\033[35m4\033[0m'
fi

while [[ $compress_level -gt 7 || $compress_level -lt 1 ]]
do
    localize '\033[31m[错误]\033[0m 输入值不合法'
    localize '\033[32m[信息]\033[0m 请输入一个 1~7 之间的数(默认\033[4;35m4\033[0m):'
    localize_n '\033[36m[输入]\033[0m\t\b'
    read compress_level
done

localize '\033[32m[信息]\033[0m 正在压缩中，请稍后...'

# Compression #phase1

if [ ! "$output_colorspace" -eq "$original_colorspace" ];then
    gifsicle -O3 $1 --colors $output_colorspace -o $output_full_filename > /dev/null 2>&1
else
    mv $1 $output_full_filename
fi

echo "### DEBUG #### colorspace="$output_colorspace "level="$compress_level
# Compression $phase2
case $compress_level in
    1)
        mv $output_full_filename $output_filename"_"$output_colorspace"_1.gif"
        output_full_filename=`echo $output_filename"_"$output_colorspace"_1.gif"`
        convert $output_full_filename -fuzz 3% -layers Optimize $output_full_filename > /dev/null 2>&1
        ;;
    2)
        mv $output_full_filename $output_filename"_"$output_colorspace"_2.gif"
        output_full_filename=`echo $output_filename"_"$output_colorspace"_2.gif"`
        convert $output_full_filename -fuzz 6% -layers Optimize $output_full_filename > /dev/null 2>&1
        ;;
    3)
        mv $output_full_filename $output_filename"_"$output_colorspace"_3.gif"
        output_full_filename=`echo $output_filename"_"$output_colorspace"_3.gif"`
        convert $output_full_filename -fuzz 9% -layers Optimize $output_full_filename > /dev/null 2>&1
        ;;
    4)
        mv $output_full_filename $output_filename"_"$output_colorspace"_4.gif"
        output_full_filename=`echo $output_filename"_"$output_colorspace"_4.gif"`
        convert $output_full_filename -fuzz 12% -layers Optimize $output_full_filename > /dev/null 2>&1
        ;;
    5)
        mv $output_full_filename $output_filename"_"$output_colorspace"_5.gif"
        output_full_filename=`echo $output_filename"_"$output_colorspace"_5.gif"`
        convert $output_full_filename -fuzz 15% -layers Optimize $output_full_filename > /dev/null 2>&1
        ;;
    6)
        mv $output_full_filename $output_filename"_"$output_colorspace"_6.gif"
        output_full_filename=`echo $output_filename"_"$output_colorspace"_6.gif"`
        convert $output_full_filename -fuzz 18% -layers Optimize $output_full_filename > /dev/null 2>&1
        ;;
    7)
        mv $output_full_filename $output_filename"_"$output_colorspace"_7.gif"
        output_full_filename=`echo $output_filename"_"$output_colorspace"_7.gif"`
        convert $output_full_filename -fuzz 21% -layers Optimize $output_full_filename > /dev/null 2>&1
        ;;
esac

localize '\033[32m[信息] \033[0m输出文件名: \033[32m'$output_full_filename'\033[0m' 'unfinished'
# get output gif image size
output_size=`stat -c "%s" $output_full_filename`
output_size_kb=`echo "scale=2; $output_size/1024" | bc`
output_size_mb=`echo "scale=2; $output_size/1048576" | bc`
output_size_mb_flag=`awk 'BEGIN{ print '$output_size_kb'>=1024 }'`
compresions_rate=`echo "scale=2; 100*$output_size/$original_size" | bc`

if [ "$original_size_mb_flag" -eq 1 ];then
    localize '\033[32m[信息] \033[0m输出大小: \033[32m'$output_size_mb' MB\033[32m\033[0m' 'Usage: '$0' <gif-to-be-compressed>.gif'
else
    localize '\033[32m[信息] \033[0m输出大小: \033[32m'$output_size_kb' KB\033[32m\033[0m' 'Usage: '$0' <gif-to-be-compressed>.gif'
fi

localize '\033[32m[信息] \033[0m输出颜色位数: \033[32m'$output_colorspace' 位\033[32m\033[32m\033[0m' 'Usage: '$0' <gif-to-be-compressed>.gif'
localize '\033[32m[信息] \033[0m压缩率: \033[32m'$compresions_rate' %\033[32m\033[0m' 'Usage: '$0' <gif-to-be-compressed>.gif'