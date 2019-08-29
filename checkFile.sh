#!/bin/bash

# 需要检查的文件

# checkFiles=$(git diff --name-only HEAD~ HEAD)

extensions=".js|.vue"

matchFileCount=$(git diff --name-only HEAD~ HEAD | grep -Ec "$extensions")

if [ "$matchFileCount" -eq 0 ] 
then
  echo '没有匹配到'
else 
  echo '匹配到了'
fi        