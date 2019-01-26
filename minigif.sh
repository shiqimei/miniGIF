#!/bin/bash

source ./utils/string.sh
source ./utils/locales.sh

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

# Fetch Environment Information && Global Varibales
isLocaleCN=`getLocale`

echo $isLocaleCN

if [ -z "$1" ];then
    echo "Usage:" $0 "<gif-to-be-compressed>.gif"
    exit
fi

if [ ! -f "$1" ];then
    echo "Do not find this gif file. Check again!"
    exit
fi

# check if this file is *.gif
file=`echo $1`
extension=`echo "${file##*.}"`
if [ str"$extension" = str"md" ];then
    echo "是md文件"
else
    echo "不是md文件"
fi
