#!/bin/bash

function update_readme(){
if test -f `pwd`/README.md ;then

test -f `pwd`/all && count_all="$(cat `pwd`/all 2>/dev/null | tr '\r\n' '\n' | sed '/^#/d;/^[[:space:]]*$/d' | wc -l)" || count_all="未知"

cat << key > `pwd`/README.md
## 去广告订阅自动更新
## [English](./README_en.md)

## 统计 (`date +'%F %T'`)
\`\`\`
累积拦截域名: ${count_all}
\`\`\`
## 访问量 : ![visitors](https://visitor-badge.glitch.me/badge?page_id=lingeringsound.10007_auto&left_color=green&right_color=red)


## PC 分支 仅做测试
### 将\`127.0.0.1\`替换成adguard的\`94.140.14.33\`，企图规避一些问题，例如反复请求引起的耗电。

## SwitchHosts
### 您可以选择 [SwitchHosts](https://github.com/oldj/SwitchHosts/releases) 对hosts进行管理。

## 订阅
### 国内请用 **镜像链接**  

| **名称** | **链接** | **镜像链接** | **Github订阅加速链接** |
| :-- | :-- | :-- | :-- |
| **PC规则** | [订阅链接](https://raw.githubusercontent.com/lingeringsound/10007_auto/PC_For_Test/all) | [Gitcode镜像](https://gitcode.net/weixin_45617236/10007_auto/-/raw/PC_For_Test/all) | [加速链接](https://raw.gitmirror.com/lingeringsound/10007_auto/PC_For_Test/all) |

## **[捐赠地址](https://github.com/lingeringsound/10007)**
key
cat << key > `pwd`/README_en.md
## REmove Ads Host
## [中文](./README.md)

## count
\`\`\`
All of rules: ${count_all}
\`\`\`

## SwitchHosts
### maybe you will need [SwitchHosts](https://github.com/oldj/SwitchHosts/releases) to manager hosts.

| **name** | **links** |
| :-- | :-- |
| **PC rules** | [Subscription link](https://raw.githubusercontent.com/lingeringsound/10007_auto/PC_For_Test/all) |

## **[Donate](https://github.com/lingeringsound/10007)**

key
fi
}

function echo_thank(){
cat << "key" >> `pwd`/README.md

## 引用和致谢
| **Hosts引用链接** | 感谢各位大佬 |
| :-- | :-- |
| [大圣净化](https://github.com/jdlingyu/ad-wars) | ❤感谢！❤ |
| [yhost](https://github.com/VeleSila/yhosts) | ❤感谢！❤ |
| [Steven Black](https://github.com/StevenBlack/hosts) | ❤感谢！❤ |
| [oisd](https://oisd.nl/howto) | ❤感谢！❤ |
| [1024](https://github.com/Goooler/1024_hosts) | ❤感谢！❤ |
| [adhost](https://github.com/E7KMbb/AD-hosts) | ❤感谢！❤ |

key
cat << "key" >> `pwd`/README_en.md

## 引用和致谢
| **Hosts引用链接** | 感谢各位大佬 |
| :-- | :-- |
| [大圣净化](https://github.com/jdlingyu/ad-wars) | ❤感谢！❤ |
| [yhost](https://github.com/VeleSila/yhosts) | ❤感谢！❤ |
| [Steven Black](https://github.com/StevenBlack/hosts) | ❤感谢！❤ |
| [oisd](https://oisd.nl/howto) | ❤感谢！❤ |
| [1024](https://github.com/Goooler/1024_hosts) | ❤感谢！❤ |
| [adhost](https://github.com/E7KMbb/AD-hosts) | ❤感谢！❤ |

key
}


update_readme
echo_thank

