# Biiiiiiiiiiig Impact!

## 目录说明
    .
    ├── Cakefile                ..... Cakefile，基于CoffeeScript的Makefile，运行cake可以查看可用任务
    ├── README.md               ..... README，就是此文件
    ├── application.html        ..... 程序的主入口
    ├── build                   ..... 编译目录，存放线上真正运行的代码
    │   ├── css                 ..... 由less编译来的css文件
    │   │   └── main.css        ..... 所有的css压缩成一个main.css文件
    │   └── js                  ..... 由Coffee-Script编译来的js文件
    │       ├── main.js         ..... 主要逻辑压缩成一个main.js文件
    │       └── templates.js    ..... 存放的是jade编译来的模板
    ├── node\_modules           ..... npm的module目录
    ├── package.json            ..... npm的包说明文件，可以用npm install安装相关依赖
    ├── src                     ..... 开发的源代码所在
    │   ├── coffee              ..... CoffeeScript目录
    │   ├── jade                ..... Jade目录，每个.jade文件都会生成一个对应的js函数
    │   └── less                ..... Less目录
    └── vendor                  ..... 引用的第三方库
        ├── js                  ..... 包括underscore,backbone,jade-runtime
        └── less                ..... bootstrap

## Cakefile Tasks说明

* test 手动单次运行测试
* compile:less 手动单次编译less
* compile:coffee 手动单次编译coffee-script
* compile:jade 手动单次编译jade
* compile 手动单次编译整个项目
* **watch 开发用，自动重新编译、运行测试**

