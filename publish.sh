#!/bin/sh
date=$(date "+%Y-%m-%d %H:%M:%S")
ALL_PROXY=socks5://127.0.0.1:1086 /usr/bin/git pull 1>/dev/null 2>&1
if test $? = 0 ; then
    export ALL_PROXY=socks5://127.0.0.1:1086
fi

/usr/bin/git pull && echo "git pull ok\n" && hugo -D && echo "compile ok\n" && /usr/bin/git add . && echo "git add ok\n" && /usr/bin/git commit -m "$date" && echo "git commit ok\n"   && /usr/bin/git push && echo "git push ok\n" && git subtree pull --prefix public origin gh-pages && echo "git subtree push ok\n"&& git subtree push --prefix public origin gh-pages && echo "git subtree push ok" 
