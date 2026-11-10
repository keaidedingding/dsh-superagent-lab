#!/bin/sh
# Compare the complete output, including the line ending.
set -eu
task_tmp=$(mktemp -d)
trap 'rm -rf "$task_tmp"' EXIT
assert_greeting() {
  expected=$1
  shift
  sh tools/greet.sh "$@" > "$task_tmp/actual"
  printf '%s\n' "$expected" > "$task_tmp/expected"
  if ! cmp -s "$task_tmp/expected" "$task_tmp/actual"; then
    echo "FAIL: greeting output differs" >&2
    diff -u "$task_tmp/expected" "$task_tmp/actual" >&2 || true
    exit 1
  fi
}
assert_greeting '你好，测试员，今天也要开心哦' '测试员'
assert_greeting '你好，朋友，今天也要开心哦'
assert_greeting '你好，朋友，今天也要开心哦' ''
assert_greeting '你好，A B，今天也要开心哦' 'A B'
echo 'ok: all greeting outputs match exactly'
