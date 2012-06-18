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
    │   │   └── main.coffee
    │   ├── jade                ..... Jade目录
    │   └── less                ..... Less目录
    │       └── main.less
    └── vendor                  ..... 引用的第三方库
        ├── js                  ..... 包括underscore,backbone,jade-runtime
        └── less                ..... bootstrap
