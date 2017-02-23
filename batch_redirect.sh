#!/bin/bash

home="http://www.petermao.com/"
home="http://172.16.170.205:4000/"

if [ $# -ne 1 ]; then
  echo "sh batch dir"
  echo $#
  exit -1
fi

dir=$1

tag1='''
<meta http-equiv="refresh" content="0; url='''"${home}"
tag_end='''" />'''

tag2='''
<link rel="canonical" href="'''"${home}"


for file in `ls $dir`
do
  file=`echo "$file" | awk -F'.' '{print $1}' `
  echo $tag1$file"/"$tag_end > a
  echo $tag2$file"/"$tag_end >> a
  mv a $dir/$file".html"
done
