#!/bin/sh
echo -ne '\033c\033]0;TBD\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/TBD.arm64" "$@"
