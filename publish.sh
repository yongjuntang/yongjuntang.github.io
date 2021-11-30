#!/bin/sh
date=$(date "+%Y-%m-%d %H:%M:%S")
alias proxy="ALL_PROXY=socks5://127.0.0.1:1086"
proxy /usr/bin/git pull
echo $?
if $? == 0 ; then
    export ALL_PROXY=socks5://127.0.0.1:1086
fi

hugo -D && /usr/bin/git add . && /usr/bin/git commit -m "$date" && /usr/bin/git pull && echo "0\n" && /usr/bin/git push && echo "1\n"&& git subtree push --prefix public origin gh-pages ; echo "ok"
