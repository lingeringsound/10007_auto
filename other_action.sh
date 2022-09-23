#!/bin/bash
# 下载去广告hosts合并并去重

t=host       hn=hosts       an=adguard
# f=host-full  hf=hosts-full  af=adguard-full

# 转换为 adguard 格式函数
adguard() {
  sed "1d;s/^/||/g;s/$/^/g" $1
}

# 去除误杀函数
manslaughter(){
  sed -i "/tencent\|c\.pc\|xmcdn\|googletagservices\|zhwnlapi\|samizdat/d" $1
}

# 海阔影视 hosts 导入成功
curl -s https://gitee.com/qiusunshine233/hikerView/raw/master/ad_v1.txt > $t
sed -i 's/\&\&/\n/g' $t
curl -s https://gitee.com/qiusunshine233/hikerView/raw/master/ad_v2.txt >> $t
sed -i '/\(\/\|@\|\*\|^\.\|\:\)/d;s/^/127.0.0.1 /g' $t && echo "海阔影视 hosts 导入成功"

while read i;do curl -s "$i">>$t&&echo "下载成功"||echo "$i 下载失败";done<<EOF
https://raw.githubusercontent.com/E7KMbb/AD-hosts/master/system/etc/hosts
https://raw.githubusercontent.com/VeleSila/yhosts/master/hosts
https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts
https://raw.githubusercontent.com/Goooler/1024_hosts/master/hosts
https://raw.githubusercontent.com/rentianyu/Ad-set-hosts/master/xiaobeita/hosts
https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts
https://raw.githubusercontent.com/ilpl/ad-hosts/master/hosts
https://gitee.com/lhzgl6587/hosts/raw/master/hosts
https://github.com/BlackJack8/iOSAdblockList/raw/master/Regular%20Hosts.txt
https://raw.githubusercontent.com/francis-zhao/quarklist/master/dist/hosts
EOF

# Github520 hosts
# curl -s https://raw.githubusercontent.com/521xueweihan/GitHub520/master/hosts | sed "/#/d;s/ \{2,\}/ /g" > gh

# 转换换行符
dos2unix *
dos2unix */*

# 保留必要 host
# 只保留 127、0 开头的行
sed -i "/^\s*\(127\|0\)/!d" $t
# 删除空白符和 # 及后
sed -i "s/\s\|#.*//g" $t
# 删除 127.0.0.1 、 0.0.0.0 、 空行、第一行
sed -i "s/^\(127.0.0.1\|0.0.0.0\)//g" $t
# 删除 . 或 * 开头的
sed -i "/^\.\|^\*/d" $t

# 手机edege浏览器Adblock Plus
curl https://edge.microsoft.com/abusiveadblocking/api/v1/blocklist | grep -oP '(?<=url":")(.*?)(?=")' >> $t

# 使用声明
statement="# $(date '+%Y-%m-%d %T')\n# 小贝塔自用，请勿商用\n# 项目地址：https://github.com/rentianyu/Ad-set-hosts\n\n"

# 获得标准去重版 host
sort -u $t -o $t
sed -i "/^127.0.0.1$/d;/^0.0.0.0$/d;/^\s*$/d" $t
manslaughter $t

# 获得标准版 hosts
(echo -e $statement && sed "s/^/127.0.0.1 /g" $t) > $hn
# (echo -e $statement && sed "s/^/127.0.0.1 /g" $t && cat gh) > $hn
# 获得标准 adguard 版规则
adguard $t > $an


# 获得拓展去重版 host
# cat $t $f | sort -u -o $f
# sed -i "/^127.0.0.1$/d;/^0.0.0.0$/d;/^\s*$/d" $f
# manslaughter $f

# 删除 . 或 * 开头的
# sed -i "/^\.\|^\*/d" $f

# 获得拓展版 hosts
# (echo -e $statement && sed "s/^/127.0.0.1 /g" $f && cat gh) > $hf
# 获得拓展 adguard 版规则
# adguard $f > $af


rm $t


# #创建一个名为 new_branch 新的空分支(不包含历史的分支)
# git checkout --orphan new_branch

# #添加所有文件到new_branch分支，对new_branch分支做一次提交
# git add -A
# git commit -am 'Add changes' 

# # 精简掉推送历史
# #删除master分支
# git branch -D master 
# #将当前所在的new_branch分支重命名为master
# git branch -m master
# #将更改强制推送到github仓库
# # git push origin master --force



# 推送到GitHub
# git add . && git commit -m " `date '+%Y-%m-%d %T'` "
