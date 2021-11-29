#!/bin/sh
date=$(date "+%Y-%m-%d %H:%M:%S")
hugo -D && /usr/bin/git add . && /usr/bin/git commit -m "$date" && /usr/bin/git push  echo "ok"
