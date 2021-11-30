---
title: "git常见问题"
date: 2021-11-29T01:19:07-05:00
draft: false
categories: "git"
---

1. 如何保存用户名和密码，避免每次git push都需要用户名和密码
```
git config credential.helper store
git push #此时输入用户名和密码，用户名和密码就被保存到本地硬盘上了，之后就不需要再次输入用户名和密码了，但是用户名和密码是以明文保存的，如果有安全疑虑，还是手动输入用户名和密码更合适
```


2. 如何把之前删除并提交到远程仓库的文件或者目录恢复
```
git log --diff-filter=D --summary   #会列出之前涉及到删除文件操作的提交，并列出具体删除的文件
git checkout d14bca5951e9c~1 要恢复的文件或者目录   # d14bca5951e9c是上一步列出的删除提交的git提交编号，~1是更早一次提交,这样就可以恢复对应的文件了
```

3. 子模块的使用

    [其他教程](https://www.vogella.com/tutorials/GitSubmodules/article.html)

    
