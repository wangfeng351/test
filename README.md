# Flutter基础脚手架搭建
### 1. 大体目录层级介绍

    ├─ android
    ├─ ios
    ├─ assets  静态资源
    │	├─ images  图片资源
    │	└─ video   视频资源
    ├─ lib
    │	├─ common_widgets  全局公用组件
    │	├─ constant        定义常量类
    │	├─ http            定义封装接口请求方法
    │	├─ main.dart       程序主入口
    │	└─ module          模块分类
    │	    ├─ chat            聊天模块
    │           ├─ model           实体类
    │           ├─ pages           模块页面
    │           ├─ repository      操作本地数据库
    │           ├─ service         处理请求接口方法
    │           ├─ widgets         该模块组件
    │	├─ routes          路由封装配置
    │	├─ locale          国际化配置
    │	├─ theme           主题配置
    │___├─ utils           全局工具类
        └─views            错误/404页面等
        全局页面


