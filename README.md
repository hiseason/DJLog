# DJLog

## 内存
堆栈区别 https://developer.aliyun.com/article/12006

## 网络

### GET & POST
GET
语义角度讲, get 是获取资源, post 是处理资源
安全的: 不会引起 server 端的任何状态变化
幂等的: 同一个请求执行多次和执行一次效果完全相同
可缓存的: 
POST
非安全的, 非幂等的, 不可缓存的

### HTTP 特点
1. 无连接(每次发送请求都需要重新创建连接, 释放连接, 都会发生一次三次握手, 四次挥手), 可用HTTP 持久连接方案解决, 持久连接就是打开一条 TCP 通道, 一定时间内多个 http 请求进行传递, 时间到了之后才会关闭
##### 头部字段
Connection: keep-alive
time: 20
max: 10 (发生多少个 http 连接)
##### 如何判断一个请求结束的
Content-length: 1024 (客户端判断接受到的字节数是否达到 Content-length)
chunked: 最后的一个块是空的 chunked (post 请求常常需要服务器给客户端多次响应才能传递完数据)
charles 抓包原理
中间人攻击 (中间人在中间拦截后再给 server 和 client 传递 )
 2. 无状态(多次发送请求,server 端并不知道是同一个用户), 用 session/cookie 解决
 
 ##### session &  cookie
 cookie 记录用户状态,  客户端添加 http  request header Cookie 字段向服务器请求 cookie , 服务器生成,  然后通过响应报文中添加 Set-Cookie 字段发送给客户端, 客户端进行保存
 修改和删除都是通过新 cookie 覆盖老 cookie
 cookie 有过期时间, expires=过去的一个时间点 或 maxAge = 0 可删除 cookie
 session 也是记录用户状态, 存储在服务器, Set-Cookie: sessid = 038ac...
 
 ### HTTPS
 HTTPS 图解 https://segmentfault.com/a/1190000021494676

### TCP & UDP
##### TCP
传输控制协议
特点
1. 面向连接 (数据传输开始前需要三次握手建立连接, 传输结束后需要四次挥手断开连接)
2. 可靠传输 (差错丢弃, 确认丢失,确认迟到,按序到达) 超时重传, 有差错的直接丢弃
3. 面向字节流
4. 流量控制 (滑动窗口协议)
5. 拥塞控制 (慢开始, 拥塞避免; 快恢复, 快重传)

##### UDP
用户数据报协议
特点
1. 无连接(不需要建立和释放连接)
2. 面向报文(既不合并, 也不拆分)
功能
1. 复用, 分用(每个应用都对应不同的端口号, 多个端口都可以复用同一个 UDP 数据报, 同一个 UDP 数据报也可以分发给不同端口)
2. 差错检测(UDP 首部末尾会有一个检验和位, 客户端会检验接受到的检验和位是否和发送过来的相同)

TCP UDP 区别 https://cloud.tencent.com/developer/article/1405940

### DNS 解析
 DNS 解析: 域名到 IP 地址的映射, 采用 UDP 数据报, 且明文传输
 查询方式: 递归查询 (我去给你问一下)、迭代查询 (我告诉你谁可能知道 )
 ##### DNS 劫持
 钓鱼网站劫持 client 向 DNS 服务器的请求, 给 client 发送一个错误的 ip 地址
 DNS 劫持和 HTTP 没有关系, 发生在 HTTP 建立请求之前
 **解决 DNS 劫持**
 1. httpDNS  
DNS: 使用 DNS 协议向 DNS 服务器的 53 端口进行请求
httpDNS : 使用 HTTP 协议向 DNS 服务器的 80 端口进行请求
2. 长连接
 client 和长连 server 建立通道, 长连 server 通过内网专线进行 http 请求
 
 
