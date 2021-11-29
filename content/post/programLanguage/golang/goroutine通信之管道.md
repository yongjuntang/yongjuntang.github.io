---
title: "Goroutine通信之管道"
date: 2021-11-29T15:58:11+08:00
draft: true
---

> goroutine间通信是通过channel来实现的

* 定义：var ch chan 变量类型
* 初始化： ch = make(chan 变量类型  [,chansize])

```go

var ch chan int
var ch2 chan string
var ch3 chan []byte
var ch4 chan [][]byte

ch = make(chan int)
ch = make(chan int,10)
ch2 = make(chan string)
ch4 = make(chan [][]byte,3) //3个[]byte切片

也可以把定义和初始化合起来
var ch  = make(chan int,2)

```

* 指定管道的方向

    - 写入管道：ch <- 10 : 将10写入管道变量ch

    - 读取管道：<- ch :将数据从管道变量ch中读取

        >  记忆要点：因为go里只有"<-",没有"->",所以只要记住<-在关键字chan的哪边，就可以确定读取还是写入管道
        >
        > * <-在chan左边：读取管道
        > * <-在chan右边：写入管道

    例如：

    ```go
    var ch = make(chan int) //没有指定方向，既可以写入也可以读取
    go func (c <-chan int){//读取管道
        //c<-10  //报错，c是读取管道，不能写数据
        a := <- c //读取数据
        fmt.Println(a)
    }(ch)
    
    a<-2 //写入数据
    time.Sleep(1*time.Second) //等待子goroutine执行完,否则有可能主程序退出了，goroutine还没执行
    //注意：go语言提供了waitgroup功能，用waitgroup更合适，此处为了简化代码使用sleep
    
    ```

* 管道的属性

   1. 没有指定长度的channel默认是阻塞的，必须有读的，有写的才能完成数据传递。

      ```go
      ch := make(chan int)
      go func (c chan int) {
          a := <- c //执行到这里的时候，被阻塞
          fmt.Println(a)
      }(ch)
      
      cj <- 3
      time.Sleep(1*time.Second) //等待子goroutine执行完,否则有可能主程序退出了，goroutine还没执行
      
      ```

   2. 如果指定了长度，那么在写满之前，写入操作不会被阻塞，读取只有在没有数据时阻塞，只要有数据就可以读取，显然，指定长度对**写入**有影响，对读取无影响。

      ```go
      ch := make(chan int,1)
      go func (c chan int) {
          a := <-c
          fmt.Println(a)
      }(ch)
      ch <- 1
      fmt.Println(2)//因为ch <-1没有阻塞，所以里面执行了打印操作，之后才执行goroutine
      time.Sleep(1*time.Second) //等待子goroutine执行完,否则有可能主程序退出了，goroutine还没执行
      
      /*结果
      2
      1
      */
      
      ```

      
