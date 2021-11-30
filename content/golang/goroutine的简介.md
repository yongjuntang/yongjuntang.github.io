---
title: "Goroutine简介"
date: 2021-11-29T15:58:11+08:00
draft: true
categories: ["golang"]
---

## goroutine简介

goroute是一种轻量级线程，因为调度不在内核态，而在用户态，发生调度时，不需要切换整个线程上下文，所以性能极高，而且一台普通机器可以轻易达到成千上万个goroutine。

## goroutine语法

go 函数

例如：

```go
func T(int a, int b) {
    fmt.Println(a+b)
}

go T() //T被放入异步队列,遇到执行点开始执行（不是立马执行)
```
