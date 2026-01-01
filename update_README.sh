#!/bin/bash

function update_readme_Feature(){
if test -f `pwd`/README.md ;then

test -f `pwd`/reward && count_reward="$(cat `pwd`/reward 2>/dev/null | sed '/^#/d;/^[[:space:]]*$/d' | wc -l)" || count_reward="未知"
test -f `pwd`/all && count_all="$(cat `pwd`/all 2>/dev/null | sed '/^#/d;/^[[:space:]]*$/d' | wc -l)" || count_all="未知"

cat << key > `pwd`/README.md
## 去广告订阅自动更新
## [English](./README_en.md)

## 统计
\`\`\`
完整版累积拦截域名: ${count_all}
保留广告奖励累积拦截域名: ${count_reward}
\`\`\`

## Feature 分支
### 将`127.0.0.1`替换成adguard的`94.140.14.33`，企图规避一些问题，例如反复请求引起的耗电。

## Adaway
### 请在Adaway中选择**重定向(Apply redirected hosts)**

## 订阅

| **名称** | **链接** | **镜像链接** |
| :-- | :-- | :-- |
| **完整版** | [订阅链接](https://raw.githubusercontent.com/lingeringsound/10007_auto/Feature/all) | [Gitcode镜像](https://gitcode.net/weixin_45617236/10007_auto/-/raw/Feature/all) |
| **保留广告奖励** | [订阅链接](https://raw.githubusercontent.com/lingeringsound/10007_auto/Feature/reward) | [Gitcode镜像](https://gitcode.net/weixin_45617236/10007_auto/-/raw/Feature/reward) |

## **[捐赠地址](https://github.com/lingeringsound/10007)**
key
cat << key > `pwd`/README_en.md
## REmove Ads Host
## [中文](./README.md)

## count
\`\`\`
all: ${count_all}
reward: ${count_reward}
\`\`\`

| **name** | **links** |
| :-- | :-- |
| **all** | [Subscription link](https://raw.githubusercontent.com/lingeringsound/10007_auto/Feature/all) |
| **reward** | [Subscription link](https://raw.githubusercontent.com/lingeringsound/10007_auto/Feature/reward) |

## **[Donate](https://github.com/lingeringsound/10007)**

key
fi
}

function update_readme_master(){
if test -f `pwd`/README.md ;then

test -f `pwd`/reward && count_reward="$(cat `pwd`/reward 2>/dev/null | sed '/^#/d;/^[[:space:]]*$/d' | wc -l)" || count_reward="未知"
test -f `pwd`/all && count_all="$(cat `pwd`/all 2>/dev/null | sed '/^#/d;/^[[:space:]]*$/d' | wc -l)" || count_all="未知"

cat << key > `pwd`/README.md
## 去广告订阅自动更新
## [English](./README_en.md)

## 统计 (`date +'%F %T'`)
\`\`\`
完整版累积拦截域名: ${count_all}
保留广告奖励累积拦截域名: ${count_reward}
\`\`\`

## 订阅
### 国内请用 **镜像链接**  

| **名称** | **链接** | **镜像链接** |
| :-- | :-- | :-- |
| **完整版** | [订阅链接](https://raw.githubusercontent.com/lingeringsound/10007_auto/master/all) | [Gitcode镜像](https://gitcode.net/weixin_45617236/10007_auto/-/raw/master/all) |
| **保留广告奖励** | [订阅链接](https://raw.githubusercontent.com/lingeringsound/10007_auto/master/reward) | [Gitcode镜像](https://gitcode.net/weixin_45617236/10007_auto/-/raw/master/reward) |
| **Adblock规则** | [订阅链接](https://raw.githubusercontent.com/lingeringsound/10007_auto/master/adb.txt) | [Gitcode镜像](https://gitcode.net/weixin_45617236/10007_auto/-/raw/master/adb.txt) |


## **[捐赠地址](https://github.com/lingeringsound/10007)**

key

cat << key > `pwd`/README_en.md
## REmove Ads Host
## [中文](./README.md)

## count
\`\`\`
all: ${count_all}
reward: ${count_reward}
\`\`\`

| **name** | **links** |
| :-- | :-- |
| **all** | [Subscription link](https://raw.githubusercontent.com/lingeringsound/10007_auto/master/all) |
| **reward** | [Subscription link](https://raw.githubusercontent.com/lingeringsound/10007_auto/master/reward) |
| **Adblock** | [Subscription link](https://raw.githubusercontent.com/lingeringsound/10007_auto/master/adb.txt) |

## **[Donate](https://github.com/lingeringsound/10007)**
key
fi
}

function update_readme_developer(){
if test -f `pwd`/README.md ;then

test -f `pwd`/reward && count_reward="$(cat `pwd`/reward 2>/dev/null | sed '/^#/d;/^[[:space:]]*$/d' | wc -l)" || count_reward="未知"
test -f `pwd`/all && count_all="$(cat `pwd`/all 2>/dev/null | sed '/^#/d;/^[[:space:]]*$/d' | wc -l)" || count_all="未知"

cat << key > `pwd`/README.md
## 去广告订阅自动更新
## [English](./README_en.md)

## 统计
\`\`\`
完整版累积拦截域名: $count_all
保留广告奖励累积拦截域名: $count_reward
\`\`\`

| **名称** | **链接** | **镜像链接** |
| :-- | :-- | :-- |
| **完整版** | [订阅链接](https://raw.githubusercontent.com/lingeringsound/10007_auto/developer/all) | [Gitcode镜像](https://gitcode.net/weixin_45617236/10007_auto/-/raw/developer/all) |
| **保留广告奖励** | [订阅链接](https://raw.githubusercontent.com/lingeringsound/10007_auto/developer/reward) | [Gitcode镜像](https://gitcode.net/weixin_45617236/10007_auto/-/raw/developer/all) |
| **Adblock规则** | [订阅链接](https://raw.githubusercontent.com/lingeringsound/10007_auto/developer/adb.txt) | [Gitcode镜像](https://gitcode.net/weixin_45617236/10007_auto/-/raw/developer/adb.txt) |


## **[捐赠地址](https://github.com/lingeringsound/10007)**
key

cat << key > `pwd`/README_en.md
## REmove Ads Host
## [中文](./README.md)

## count
\`\`\`
all: ${count_all}
reward: ${count_reward}
\`\`\`

| **name** | **links** |
| :-- | :-- |
| **all** | [Subscription link](https://raw.githubusercontent.com/lingeringsound/10007_auto/developer/all) |
| **reward** | [Subscription link](https://raw.githubusercontent.com/lingeringsound/10007_auto/developer/reward) |
| **Adblock** | [Subscription link](https://raw.githubusercontent.com/lingeringsound/10007_auto/developer/adb.txt) |

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

#update_readme_master
#update_readme_Feature
update_readme_developer
echo_thank
