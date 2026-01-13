<p align="center">
  <img height="150" width="150" alt="logo" src="https://docs-open.haorongtech.cn/images/logo.png">
</p>

<h1 align="center" style="margin: 20px 0; font-weight: bold;">
  浩荣商城 · Haorong Mall
</h1>

<p align="center">
  <a href="https://gitee.com/haorongtech/haorong-mall/stargazers">
    <img src="https://gitee.com/haorongtech/haorong-mall/badge/star.svg?theme=dark">
  </a>
  <a href="https://gitee.com/haorongtech/haorong-mall">
    <img src="https://img.shields.io/badge/version-v3.1.0-blue.svg">
  </a>
  <a href="https://gitee.com/haorongtech/haorong-mall/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/mashape/apistatus.svg">
  </a>
</p>

---

## 🚀 项目介绍

> **一个支持「单体 & 微服务自由切换」的全栈商城系统，覆盖从学习实战到中小型商业落地的完整解决方案。**

**浩荣商城（Haorong Mall，原环兴商城）**  
是一套基于 **Java 17 + Spring Boot 3 + Spring Cloud Alibaba + Dubbo + Sa-Token**  
构建的现代化电商系统。

项目在设计之初即考虑 **真实业务场景**，不仅支持完整的商城业务流程，同时在架构层面提供  
**单体模式 / 微服务模式** 双形态运行方式，可根据团队规模与业务阶段灵活选择。

前端采用 **Vue 3 + TypeScript + UniApp** 技术栈，实现后台、H5、小程序等多端统一开发，  
在保证扩展性的同时，显著降低维护成本。

---

## 🎯 适用人群

- 想系统学习 **Spring Boot 3 / Spring Cloud 微服务实战** 的开发者  
- 需要可二次开发商城系统的 **个人开发者 / 创业团队**  
- 用于 **毕业设计、项目实战、企业内部系统** 的技术团队  

---

## 项目组成
本项目采用 前后端分离 + 微服务架构，覆盖商城系统完整技术栈。

| 项目                                                              | 简介                                 |
|-----------------------------------------------------------------|------------------------------------|
| **[Java后端服务](https://gitee.com/haorongtech/haorong-mall)**      | 基于 Spring Boot 3 / Spring Cloud 的微服务架构，包含用户、商品、订单、支付、营销等核心服务 |
| **[商城管理端](https://gitee.com/haorongtech/haorong-mall-ui)**      | 基于 Vben Admin 构建的 **商城后台管理前端项目**，用于商品、订单、用户、权限等管理                      |
| **[移动端商城](https://gitee.com/haorongtech/huanxing-mall-uniapp)** | 基于 UniApp + Wot UI 的移动端商城应用，支持微信小程序 / H5 / App 多端运行                     |

## 🚀 快速开始

### 文档地址
- https://docs-open.haorongtech.cn

### 环境要求

- JDK 17+
- MySQL 8.x
- Redis
- Maven 3.6+

### 单体模式启动（最简单）
1️⃣ 克隆项目
```bash
git clone https://gitee.com/haorongtech/haorong-mall.git
```
2️⃣ 初始化数据库

执行 db 目录下的 **haorong_boot.sql** 初始化脚本，创建数据库与表结构

3️⃣ 配置应用

修改 haorong-boot/src/main/resources/application-dev.yml 中的数据库及其他配置信息

4️⃣ 启动服务（推荐方式）

使用 IDEA 直接运行 HaorongBootApplication 启动类

5️⃣ 启动成功后：

接口文档：http://localhost:9999/boot/doc.html

后台管理系统：按前端文档启动

💡 建议首次使用先运行单体模式，熟悉业务流程后再拆分微服务

🏗 系统架构
系统采用 标准微服务拆分设计，同时提供 单体启动模块，
兼顾复杂业务扩展与快速部署。

<p align="center"> <img alt="architecture" src="https://docs-open.haorongtech.cn/images/hxcloud.png"> </p>
🧩 模块结构说明


```
📦 haorong
├─ 📦 haorong-auth                  # 授权服务 [端口: 5227]
├─ 📦 haorong-boot                  # 单体启动模块 [端口:9999]
├─ 📦 haorong-common                # 系统公共模块
│  ├─ 📁 haorong-common-core        # 公共核心包
│  ├─ 📁 haorong-common-dubbo       # Dubbo 扩展封装
│  ├─ 📁 haorong-common-job         # XXL-Job 封装
│  ├─ 📁 haorong-common-log         # 日志模块封装
│  ├─ 📁 haorong-common-logistics   # 快递物流相关封装
│  ├─ 📁 haorong-common-mybatis     # MyBatis 扩展封装
│  ├─ 📁 haorong-common-redis        # redis缓存工具模块
│  ├─ 📁 haorong-common-seata       # 分布式事务模块
│  ├─ 📁 haorong-common-security    # 安全认证封装（含 Sa-Token）
│  ├─ 📁 haorong-common-sentinel    # sentinel扩展封装
│  ├─ 📁 haorong-common-sms         # 短信模块封装
│  ├─ 📁 haorong-common-storage     # 文件存储封装（本地 / 阿里云 / 腾讯云等）
│  └─ 📁 haorong-common-swagger     # swagger文档模块
├─ 📦 haorong-gateway               # 网关服务 [端口: 9999]
├─ 📦 haorong-miniapp               # 小程序服务
│  ├─ 📁 haorong-miniapp-api        # 小程序 API 公共模块
│  └─ 📁 haorong-miniapp-biz        # 小程序业务处理模块
├─ 📦 haorong-order                 # 订单模块
│  ├─ 📁 haorong-order-api          # 订单 API 公共模块
│  └─ 📁 haorong-order-biz          # 订单业务处理模块
├─ 📦 haorong-pay                   # 支付模块
│  ├─ 📁 haorong-pay-api            # 支付 API 公共模块
│  └─ 📁 haorong-pay-biz            # 支付业务处理模块
├─ 📦 haorong-product               # 商品模块
│  ├─ 📁 haorong-product-api        # 商品 API 公共模块
│  └─ 📁 haorong-product-biz        # 商品业务处理模块
├─ 📦 haorong-promotion             # 营销模块
│  ├─ 📁 haorong-promotion-api      # 营销 API 公共模块
│  └─ 📁 haorong-promotion-biz      # 营销业务处理模块
├─ 📦 haorong-upms                  # 用户权限管理模块（后台）
│  ├─ 📁 haorong-upms-api           # 用户权限 API 公共模块
│  └─ 📁 haorong-upms-biz           # 用户权限业务处理模块
├─ 📦 haorong-user                  # 商城用户模块（C端用户）
│  ├─ 📁 haorong-user-api           # 商城用户 API 公共模块
│  └─ 📁 haorong-user-biz           # 商城用户业务处理模块
├─ 📦 haorong-visual                # 系统可视化与运维模块
│  ├─ 📁 haorong-generator          # 代码生成器模块
│  └─ 📁 haorong-monitor            # Spring Boot Admin 服务监控 [端口: 7001]

```
📦 业务模块能力

| 服务名           | 功能说明          |
|------------------|---------------|
| **网关服务**     | 统一入口，路由转发，权限拦截等 |
| **认证服务**     | 登录、注册、Token 鉴权等 |
| **用户服务**     | 用户中心、收货地址、账户信息等 |
| **商品服务**     | 商品 SPU/SKU 管理、分类等 |
| **订单服务**     | 下单、支付、发货、退款 |
| **支付服务**     | 微信、支付宝|
| **营销服务**     | 优惠券           |


🔧 后端技术栈

| 技术组件               | 说明                                                                                       |
|------------------------|--------------------------------------------------------------------------------------------|
| **Spring Boot 3** | 现代化 Java 应用开发框架，提供自动配置和快速启动 |
| **Spring Cloud Alibaba** | 基于 Spring Cloud 的阿里巴巴微服务组件集合，集成服务注册与发现（Nacos）、配置管理、负载均衡、链路追踪，同时支持 RocketMQ 消息队列、Seata 分布式事务等丰富功能，全面增强微服务生态能力。 |
| **Apache Dubbo 3**     | 高性能 RPC 框架，支持多协议、多注册中心和 Triple 协议，实现服务间高效通信                         |
| **Nacos**              | 服务注册与配置中心，支持服务发现与动态配置管理，兼容 Dubbo 和 Spring Cloud                      |
| **MyBatis & MyBatis-Plus** | 数据访问层框架，MyBatis 实现 ORM 映射，Plus 提供分页、Lambda 表达式、自动 CRUD 等功能增强          |
| **Druid**              | 高性能数据库连接池，支持 SQL 监控、防火墙、慢查询日志等                                       |
| **Redis & Redisson**   | Redis 用作缓存、分布式锁、限流等，Redisson 提供分布式锁及高级客户端支持                         |
| **RocketMQ**           | 分布式消息中间件，支持高吞吐、低延迟、顺序消息和事务消息等，服务间异步解耦和事件驱动             |
| **Seata**              | 分布式事务框架，保障多服务、多数据源操作一致性，集成于 Spring Cloud Alibaba                      |
| **Sentinel**           | 流量防卫利器，支持服务限流、熔断降级、系统负载保护和动态规则配置                               |
| **XXL-JOB**            | 轻量级分布式任务调度平台，支持定时任务管理和执行                                           |
| **Sa-Token**           | 简洁轻量的权限认证框架，支持单点登录、权限校验、会话管理等                                   |
| **Spring Boot Admin**  | 应用监控管理平台，提供实时健康检查、日志查看、线程监控等                                   |
| **Knife4j**            | Swagger UI 增强工具，用于自动生成在线接口文档，支持接口分组和权限注解                          |

---


🖥 前端技术栈

| 平台    | 技术                                |
| ----- | --------------------------------- |
| 管理后台  | Vue 3 + Vite + Pinia + TypeScript |
| 移动端商城 | UniApp + Vue 3 + TS + Wot-UI      |
| 移动端商户 | UniApp（商业版）                       |
| PC 商城 | Vue 3 + Element Plus（规划中）         |


## 🔓 开源版 & 商业版说明

### 开源版（本仓库）

本仓库为 **基础功能完整、可独立部署** 的开源版本，适合学习、二次开发及中小项目使用，主要包含：

- 基础商品、订单、用户、支付能力  
- 标准商城下单与支付流程  
- 后台管理系统（基础功能）  
- 单体 / 微服务双模式运行  
- 完整源码，可自由修改与扩展  

> 开源版更偏向 **技术学习与基础业务验证**，不包含复杂营销与商业化能力。

---

### 商业版（增强版）

商业版在开源版基础上，提供 **更完整、更贴近真实商业场景** 的功能体系，适用于  
**多商户、多店铺、平台招商、实际商业运营** 等场景。

#### 🏬 多形态商城支持

- **单店铺版本**：适合品牌自营、私域商城  
- **多店铺版本**：支持多商家入驻、平台化运营  

#### 🎯 丰富营销与业务能力

- 拼团、秒杀、积分体系  
- 会员等级、会员价、成长值  
- 优惠券、满减、营销活动组合  
- 分销体系（二级分销、佣金结算）  

#### 💰 支付与结算能力

- 服务商支付模式  
- 分账能力（多方分账）  
- 余额支付 / 微信支付 / 支付宝  
- 统一支付与合并支付支持  


## 🏬 商业版演示
后台管理：https://admin-pro.haorongtech.cn

用户端体验：H5 / 小程序 / Android


扫码体验 **H5 端**：  
<img src="https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/0140bb73-520f-44e3-b8b2-dda5cd571eca.png" alt="用户端H5二维码" height="200" width="200" />

扫码体验 **小程序端**：  
<img src="https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/ae383f41-5c47-48e1-9fa3-e1962c44952c.jpg" alt="小程序码" height="200" width="200" />

扫码体验 **安卓端**：  
<img src="https://minio.haorongtech.cn/haorong/1590229800633634816/file/48a5401c-24d2-4fd2-9318-8a9636259c6a.png" alt="安卓APK" height="200" width="200" />

> 安卓安装包： https://minio.haorongtech.cn/haorong/1590229800633634816/file/__UNI__2A0AEFA__20251226230249.apk

📚 文档与支持
📘 项目文档：https://docs-open.haorongtech.cn

🐞 问题反馈：Gitee Issues

⭐ 欢迎 Star 支持项目发展

📄 License
本项目遵循 MIT License
允许自由使用、修改与分发，请保留原始版权声明。

❤️ 联系作者与支持

- 微信技术交流 & 问题反馈：`HuanxingMall`
- 商业咨询 & 合作洽谈：`HuanxingMall`
- 加入浩荣商城开源交流群：扫码拉你入群


- <img src="https://www.haorongtech.cn/assets/wx-ByXZPIh7.png" alt="微信" height="200" width="200" />