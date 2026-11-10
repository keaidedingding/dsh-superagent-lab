#!/bin/sh
# 冒烟测试：greet.sh 必须打印含问候语的单行文本
set -e
out=$(sh tools/greet.sh 测试员)
echo "output: $out"
case "$out" in
  *"你好，测试员，今天也要开心"*) echo "ok: greeting present" ;;
  *) echo "fail: greeting missing"; exit 1 ;;
esac
