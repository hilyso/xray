## xray 容器快速部署

  - 不区分服务端还是客户端, 以什么方式运行取决于配置文件  

## 容器构建

  - `docker built -t xray:v24.12.18 .`  


## 使用方法

  `docker run -d --name xray-server -p 443:443 -v /path/to/your/server.json:/etc/xray/config.json xray:v24.12.18`  
  `docker run -d --name xray-client -p 443:443 -v /path/to/your/client.json:/etc/xray/config.json xray:v24.12.18`  

