---
title: "拉取我的hugo博客"
date: 2021-11-30T10:19:57+08:00
lastmod: 2021-11-30T10:19:57+08:00
draft: true
keywords: []
description: ""
tags: []
categories: []
author: ""

# You can also close(false) or open(true) something for this content.
# P.S. comment can only be closed
comment: false
toc: false
autoCollapseToc: false
postMetaInFooter: false
hiddenFromHomePage: false
# You can also define another contentCopyright. e.g. contentCopyright: "This is another copyright."
contentCopyright: false
reward: false
mathjax: false
mathjaxEnableSingleDollar: false
mathjaxEnableAutoNumber: false

# You unlisted posts you might want not want the header or footer to show
hideHeaderAndFooter: false

# You can enable or disable out-of-date content warning for individual post.
# Comment this out to use the global config.
#enableOutdatedInfoWarning: false

flowchartDiagrams:
  enable: false
  options: ""

sequenceDiagrams: 
  enable: false
  options: ""

---

1. 从github上拉取博客md文件

    ```
    ap git clone https://github.com/yongjuntang/yongjuntang.github.io.git blog #ap是代理别名			

2. 初始化子模块（hugo 主题是以子模块的形式存在)

    ```
    git submodule init
    ```

3. 更新子模块

    ```
    git submodule update
    ```

4. 启动hugo服务

    ```
    hugo serve -D
    ```

    
