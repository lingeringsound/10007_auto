#!/bin/bash
export PATH="`pwd`:${PATH}"

function setup_environment(){
mkdir -p `pwd`/result
mkdir -p `pwd`/configure
dos2unix `pwd`/* >/dev/null 2>&1
dos2unix `pwd`/*/* >/dev/null 2>&1
}


function Do_detect_hosts(){
local file="`pwd`/result/test.conf"

test -f "${file}" && rm -rf "${file}"

#预测广告厂商重复的hosts
local number1=0
local number2=31
for i in $(seq $number1 $number2)
do
#127.0.0.1 img$i.360buyimg.com
#127.0.0.1 lf$i-short.bytegoofy.com
#127.0.0.1 polaris$i-normal-hl.zijieapi.com
#127.0.0.1 polaris$i-normal-lq.zijieapi.com
#127.0.0.1 lf$i-cdn-tos.bytescm.com
#127.0.0.1 gecko$i-hl.zijieapi.com
#127.0.0.1 gecko$i-lq.zijieapi.com
#127.0.0.1 v$i-default.ixigua.com
#127.0.0.1 log$i-applog-hl.fqnovel.com
#127.0.0.1 gecko$i-hl.zijieapi.com
#127.0.0.1 gecko$i-lq.zijieapi.com
#127.0.0.1 polaris$i-normal-hl.zijieapi.com
#127.0.0.1 polaris$i-normal-lq.zijieapi.com
#127.0.0.1 api$i-normal-lq.fqnovel.com
#127.0.0.1 api$i-normal-hl.fqnovel.com
#127.0.0.1 mon$i-misc-lf.fqnovel.com
#127.0.0.1 lf$i-common-ckv-tos.pstatp.com
#127.0.0.1 valipl.cp$i.ott.cibntv.net
#127.0.0.1 vali-g1.cp$i.ott.cibntv.net
#127.0.0.1 v$i-novelapp.ixigua.com
#127.0.0.1 lf$i-common-ckv-tos.pstatp.com
#127.0.0.1 tnc3-alisc1.bytedance.com
#127.0.0.1 tnc3-bjlgy.bytedance.com

echo "
0.0.0.0 p$i-ad-sign.byteimg.com
0.0.0.0 p${i}-ad.byteimg.com
0.0.0.0 p${i}-ad.adkwai.com
0.0.0.0 p${i}-ad.adukwai.com
0.0.0.0 p${i}-ad.adbkwai.com
0.0.0.0 vs$i.bj2cm.u3.ucweb.com
0.0.0.0 vs$i.bj2cu.u3.ucweb.com
0.0.0.0 vs$i.bj2ct.u3.ucweb.com
0.0.0.0 vs${i}.bj2.u3.ucweb.com
0.0.0.0 vs$i.gzct.u3.ucweb.com
0.0.0.0 vs$i.gzcu.u3.ucweb.com
0.0.0.0 vs$i.gzcm.u3.ucweb.com
0.0.0.0 ${i}gtest.bj2cu.u3.ucweb.com
0.0.0.0 ads$i-normal-lq.zijieapi.com
0.0.0.0 ads$i-normal-lf.zijieapi.com
0.0.0.0 ads$i-normal-hl.zijieapi.com
0.0.0.0 ads$i-normal.zijieapi.com
0.0.0.0 p$i-orange.byteorge.com
0.0.0.0 p${i}-be-pack-sign.pglstatp-toutiao.com
0.0.0.0 lf$i-common-ckv-tos.pstatp.com
0.0.0.0 v$i-ad.ixigua.com
0.0.0.0 api-access.pangolin-sdk-toutiao${i}.com
0.0.0.0 api-access.pangolin-sdk-toutiao${i}-b.com
0.0.0.0 xn--pan-ei"$i"e.xn--baidu-jm6h.com
0.0.0.0 w${i}.gskwai.com
" >> "${file}"
done

#蓝奏云拦截域名
for i in s d z ;do
cat <<key >> "${file}"
0.0.0.0 lanzou$i.com
0.0.0.0 cbzhk.lanzou$i.com
0.0.0.0 wwa.lanzou$i.com
0.0.0.0 wws.lanzou$i.com
0.0.0.0 www.lanzou$i.com
0.0.0.0 wwe.lanzou$i.com
key
done
}


function wipe_value() {
	local file="${1}"
	#去除特殊符号
	echo -e "\n去除特殊符号……"
#	busybox sed -E -i -e '/([^:]):/d' \
#	-e 's/^[[:space:]]+//g' \
#	-e 's/[[:space:]]#.*//g' "${file}"
#	busybox sed -i -e 's/^\|\|/127.0.0.1 /g' \
#	-e 's/\^$//g' \
#	-e '/=/d;/\*/d;/\//d;/^\!/d;/\@/d' "${file}"
	sed -i '/^#/d;/^[[:space:]]*$/d' "${file}"
	sed -i '/\[/d;/^[[:space:]]*$/d' "${file}"
	sed -i '/\]/d;/^[[:space:]]*$/d' "${file}"
	sed -i '/<.*>/d;/^[[:space:]]*$/d' "${file}"
	sed -i '/^@/d;/^[[:space:]]*$/d' "${file}"
	sed -i 's|[[:space:]]$||g' "${file}"
	#去除特殊的0.0.0.0符号
	echo -e "\n去除特殊0.0.0.0符号……"
	sed -i 's|^0.0.0.0[[:space:]]|0.0.0.0 |g' "${file}"
	sed -i 's|^0.0.0.0	|0.0.0.0 |g' "${file}"
	sed -i 's|^0.0.0.0[[:space:]][[:space:]]|0.0.0.0 |g' "${file}"
	sed -i 's|^0.0.0.0[[:space:]][[:space:]][[:space:]]|0.0.0.0 |g' "${file}"
	sed -i 's|^0.0.0.0[[:space:]][[:space:]][[:space:]][[:space:]]|0.0.0.0 |g' "${file}"
	#去除特殊的127.0.0.1符号
	echo -e "\n去除特殊127.0.0.1符号……"
	sed -i 's|^127.0.0.1	|0.0.0.0 |g' "${file}"
	sed -i '/^127.0.0.1[[:space:]]#/d;/^[[:space:]]*$/d' "${file}"
	sed -i 's|^127.0.0.1[[:space:]][[:space:]]|0.0.0.0 |g' "${file}"
	sed -i 's|^127.0.0.1[[:space:]][[:space:]][[:space:]]|0.0.0.0 |g' "${file}"
	sed -i 's|^127.0.0.1[[:space:]][[:space:]][[:space:]][[:space:]]|0.0.0.0 |g' "${file}"
	sed -i 's|^127.0.0.1    |0.0.0.0 |g' "${file}"
	#去除"::"回环
	echo -e "\n去除回环符号……"
	sed -i 's|^::[[:space:]]|0.0.0.0 |g' "${file}"
	sed -i 's|^::[[:space:]][[:space:]]|0.0.0.0 |g' "${file}"
}

#Host去重
function mk_new_file() {
	local file=$1
	local new=$( cat "${file}"  | sort | uniq | sed '/^[[:space:]]*$/d' )
	echo -e "$new" > "${file}"
}

#下载新的hosts
function download_hosts() {
local file="${1}"
local IFS=$'\n'
local tmp_DIR="`pwd`/tmp_hosts"
mkdir -p "${tmp_DIR}"

#adhost 禁用 2022.11.20
#https://raw.githubusercontent.com/E7KMbb/AD-hosts/master/system/etc/hosts|AdHost
#oisd 失效2024.01.15
#https://hosts.oisd.nl/basic|oisd
#StevenBlack 去除订阅porn拦截
#https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts|StevenBlack
#StevenBlack 去除媒体订阅
#https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-social/hosts


local hosts_list='
https://hblock.molinero.dev/hosts|hblock
https://raw.githubusercontent.com/Goooler/1024_hosts/master/hosts|1024
https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts|StevenBlack
https://raw.githubusercontent.com/VeleSila/yhosts/master/hosts|yhost
https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts|大圣净化
https://raw.githubusercontent.com/neodevpro/neodevhost/master/host|neodev
https://o0.pages.dev/Lite/hosts.txt|1Host
'

echo -e "\n※下载hosts中……"
for i in ${hosts_list}
do 
	HostURL="$(echo "${i}" | cut -d'|' -f1)"
	Hostname="$(echo "${i}" | cut -d'|' -f2)"
	curl -k -L -o "${tmp_DIR}/$Hostname" "${HostURL}" >/dev/null 2>&1 && echo -e "※[ ${Hostname} ] 下载成功！" || echo -e "[ ${Hostname} ]下载失败！"
	test "$(echo "${Hostname}" | grep -E 'neodev|hblock|1Host')" != "" && {
	wipe_value "${tmp_DIR}/$Hostname"
	continue
	}
	hosts_original="$(cat ${tmp_DIR}/$Hostname 2>/dev/null )"
	echo -e "${hosts_original}" >> "${file}"
done
test ! -f "${file}" && echo -e "${file} 不存在！！" && exit 1
}

function grep_value_file() {
local value="${2}"
local file="${3}"
local word="${1}"
case $word in
1)
word='-iw'
;;
E)
word='-iE'
;;
*)
word='-i'
;;
esac
local targetdir="`pwd`/result"
if test -e "${file}" ;then 
	mkdir -p "${targetdir}"
	hosts_value="$( cat ${file} 2>/dev/null | grep $word ${value} ${file} | sed '/^#/d;/^[[:space:]]*$/d' )"
echo -e "${hosts_value}" > "${targetdir}/${value}.conf" && echo -e "已经输出[ ${value} ]"
fi
}

function wipe_logcat() {
local file="$1"
local list="
alog
alogs
applog
applogios
clientlog
clientlog[0-9]
clientlog[0-9][0-9]
errlog
errlogos
errlogs
eventlog
extlog
log
log[0-9]
log[0-9][0-9]
login
logs
logsdk
logservice
logupdate
logview
tobapplog
toblog
ulog
ulogs
xlog
xlogs
"
local IFS=$'\n'
if test -f "$file" ;then
	for i in $list 
		do
		echo -e "$(grep -wvi "$i" "$file")" > "$file"
	done
fi
}

function exclude_value() {
local conf="${1}"
local target="${2}"
if test -e $conf ;then 
echo -e "[$(date +%y-%m-%d-%T)] ※执行排除文件["${conf}"]下的规则……※\n"
	for i in $(cat "${conf}" 2>/dev/null | sed '/^#.*/d;/^[[:space:]]*$/d' )
		do
			busybox sed -i "/$i/d" "${target}"
	done && echo -e "[$(date +%y-%m-%d-%T)] ※已排除[${conf}]文件中的规则※\n"
fi
}

function add_custo() {
local conf_file="${1}"
local target="${2}"
if test -e "${conf_file}" ;then
	cp -rf "${conf_file}" "${target}/${conf_file##*/}.conf" && echo -e "[$(date +%y-%m-%d-%T)] ※复制["${conf_file}"]※\n" || echo -e "[$(date +%y-%m-%d-%T)] ※复制["${conf_file}"]失败！※\n"
fi
}

function combine_file() {
local target_dir="${1}"
local output="${2}"
test -e "${output}" && rm -rf "${output}"
if test -e "${target_dir}" ;then
	echo -e "[$(date +%y-%m-%d-%T)] ※合并规则中……※\n"
for i in ${target_dir}/*.conf ;do
echo -e "$(cat "$i" 2>/dev/null )" >>"${output}"
done && echo -e "[$(date +%y-%m-%d-%T)] ※完成合并规则！※\n" || echo -e "[$(date +%y-%m-%d-%T)] ※合并失败！※\n"
	if test -e "${output}" ;then
		echo -e "[$(date +%y-%m-%d-%T)] ※筛选重复项中……※\n"
cat <<key > "${output}" && echo -e "[$(date +%y-%m-%d-%T)] ※筛选重复项完成！※\n" || echo -e "[$(date +%y-%m-%d-%T)] ※筛选失败！※\n"
$(cat "${output}" | sort | uniq | sed '/^#.*/d;/^[[:space:]]*$/d' )
key
		wipe_logcat "${output}"
	fi
fi
}

function modtifly() {
local targetfile="${1}"
sed -i '/\#/d' "${targetfile}"
sed -i '/\]/d' "${targetfile}"
sed -i '/\[/d' "${targetfile}"
sed -i '/(/d' "${targetfile}"
sed -i '/)/d' "${targetfile}"
sed -i 's|127.0.0.1|0.0.0.0|g' "${targetfile}"
}

function remove_ad() {
local file="$1"
local target="$2"
local local_host_file="$3"
test -f "${target}" && rm -rf "${target}"
cat "${file}" 2>/dev/null | sed '/^#/d;/^[[:space:]]*$/d' | while read host ;do
echo -e "0.0.0.0 $host" >> "$target"
done
cat <<key >> $local_host_file
#广告奖励
$(cat "$target" 2>/dev/null )
#END
key
}

#制作Adaway白名单
function white_list_Maker_Adaway(){
local target_file="${1}"
local file="`pwd`/Adaway_white_list.prop"
cp -rf "${target_file}" "${file}"
test ! -f "${file}" && return 0
sed -i -E -e 's/\^0.0.0.0\[\[:space:\]\]//g' \
-e 's/\$$//g' \
-e 's/\\\./\./g' \
-e 's/\[.*\]/\*/g' \
-e 's/\.\*/\*/g' \
-e 's/\+/\?/g' \
-e '/\#放到iptables屏蔽的域名/,/^[[:space:]]$/d' \
-e '/^[[:space:]]*$/d' "${file}"
local original="$(cat "${file}")"
cat << key > "${file}" 
#########
#Adaway专用白名单
#禁止用在拦截黑名单或者Adguard订阅
# _  ___   ___ _____ 
#/ |/ _ \ / _ \___  |
#| | | | | | | | / / 
#| | |_| | |_| |/ /  
#|_|\___/ \___//_/   
#                    
###########
key
echo "${original}" >> "${file}"
}

#写入信息
function write_head () {
local target_file="${1}"
local original_file_content="$(cat ${target_file} 2>/dev/null | sed '/^#/d;/^[[:space:]]*$/d')"
local total_count="$(echo "${original_file_content}" | wc -l )"
cat << KEY > "${target_file}"
#@coolapk 1007
#有问题可以在文件里搜索关键词
#例如"toutiao(头条)"，"MIUI xiaomi (小米)"，"reward(奖励)"。
#在相应行的开头加个"#"号
#更新时间: $(date '+%F %T')
127.0.0.1 localhost
::1 localhost
::1 ip6-loopback
::1 ip6-localhost
#提速测试
127.0.0.2 localhost
127.0.0.3 localhost
::2 ip6-localhost
::3 ip6-localhost
127.0.1.1 hostname
127.0.1.2 hostname
127.0.1.3 hostname
#规则数量:${total_count}
#GIthub订阅主页: https://github.com/lingeringsound/10007_auto

KEY
echo "${original_file_content}" >> "${target_file}"
}

function adblock() {
echo -e "[$(date +%y-%m-%d-%T)] ※制作Adblock规则……※\n"
local old_file="${1}"
local file="${old_file%/*}/adb.txt"
echo "$(cat $old_file )" > "${file}"
if test -f "$file" ;then
	sed -i "/^#/d" "$file"
	sed -i "/^::1/d;/translate.google.com/d;/translate.googleapis.com/d;/hugeota.d.miui.com/d;/bigota.d.miui.com/d;/[[:space:]]ip6-localhost/d;/[[:space:]]hostname/d;/localhost/d" "$file"
	sed -i "s/0.0.0.0 /||/g;s|$|^|g" "$file"
	sed -i "s/^\^//g" "$file"
local file_content="$(cat "${file}")"
local filter_count="$(echo "${file_content}" | sed '/^[[:space:]]*$/d' | wc -l)"
cat << key > "${file}"
[Host 10007]
[Adblock Plus 2.0]
! Title: Host 10007
! Homepage: https://github.com/lingeringsound/10007_auto
! ZH_Homepage: https://www.gitlink.org.cn/keytoolazy/10007_auto
! Last modified: `date +'%F %T'`
! 规则数量: ${filter_count}

$(cat "`pwd`/configure/add.prop")

${file_content}
key

fi
}

function adclose() {
echo -e "[$(date +%y-%m-%d-%T)] ※制作Adclose规则……※\n"
local old_file="${1}"
local file="${old_file%/*}/10007.rule"
echo "$(cat $old_file )" > "${file}"
if test -f "$file" ;then
	sed -i "/^#/d" "$file"
	sed -i "/^::1/d;/translate.google.com/d;/translate.googleapis.com/d;/hugeota.d.miui.com/d;/bigota.d.miui.com/d;/[[:space:]]ip6-localhost/d;/[[:space:]]hostname/d;/localhost/d" "$file"
	sed -i "s/0.0.0.0 /Domain, /g" "$file"
	sed -i "s/^\^//g" "$file"
local file_content="$(cat "${file}")"
local filter_count="$(echo "${file_content}" | sed '/^[[:space:]]*$/d' | wc -l)"
cat << key > "${file}"
# Host 10007
# 主页: https://github.com/lingeringsound/10007_auto
# 中文主页: https://www.gitlink.org.cn/keytoolazy/10007_auto
# 更新日期: `date +'%F %T'`
# 规则数量: ${filter_count}

$( cat "`pwd`/configure/Adclose.rule" )

#域名规则
${file_content}
#END
key

fi
}

function mktouch_host() {
add_custo `pwd`/configure/自定义.prop `pwd`/result
add_custo `pwd`/configure/魅族.conf `pwd`/result
combine_file `pwd`/result `pwd`/all
exclude_value `pwd`/configure/排除列表.prop `pwd`/all
exclude_value `pwd`/configure/保留奖励.prop `pwd`/all
modtifly `pwd`/all
remove_ad `pwd`/configure/广告奖励.prop `pwd`/result/广告奖励.conf `pwd`/all
write_head `pwd`/all
}

function mktouch_no_host() {
add_custo `pwd`/configure/自定义.prop `pwd`/result
add_custo `pwd`/configure/魅族.conf `pwd`/result
combine_file `pwd`/result `pwd`/reward
exclude_value `pwd`/configure/排除列表.prop `pwd`/reward
exclude_value `pwd`/configure/保留奖励.prop `pwd`/reward
modtifly `pwd`/reward
write_head `pwd`/reward
}


function RUnning_SETUPS_environment(){
setup_environment
setup_environment
download_hosts `pwd`/host
mk_new_file `pwd`/host
wipe_value `pwd`/host
setup_environment
}

function RUnning_grep_values_conf(){
local hosts_file=`pwd`/host
grep_value_file '1' '1688' "${hosts_file}"
grep_value_file '1' '2345' "${hosts_file}"
grep_value_file '1' '360' "${hosts_file}"
grep_value_file '1' '360safe' "${hosts_file}"
grep_value_file '1' '365' "${hosts_file}"
grep_value_file '1' 'JUNKY' "${hosts_file}"
grep_value_file '1' 'TRAFFIC' "${hosts_file}"
grep_value_file '1' 'TRAFFIC.*JUNKY' "${hosts_file}"
grep_value_file '1' '[[:alpha:]]ad' "${hosts_file}"
grep_value_file 'E' '[[:alpha:]]?ads' "${hosts_file}"
grep_value_file '1' '[[:alpha:]]cdn' "${hosts_file}"
grep_value_file 'E' '[[:alpha:]]+sdk' "${hosts_file}"
grep_value_file '1' '[[:digit:]]ad' "${hosts_file}"
grep_value_file 'E' '[[:digit:]]?ads' "${hosts_file}"
grep_value_file '1' 'ad' "${hosts_file}"
grep_value_file '1' 'ad.*cdn' "${hosts_file}"
grep_value_file '1' 'ad.*service' "${hosts_file}"
grep_value_file '1' 'ad.*services' "${hosts_file}"
grep_value_file '1' 'ad[[:alpha:]]' "${hosts_file}"
grep_value_file 'E' 'ad[[:alpha:]]?[[:digit:]]' "${hosts_file}"
grep_value_file '1' 'ad[[:digit:]]' "${hosts_file}"
grep_value_file '1' 'adapi' "${hosts_file}"
grep_value_file '1' 'adbana' "${hosts_file}"
grep_value_file '1' 'adimg' "${hosts_file}"
grep_value_file '1' 'adjust' "${hosts_file}"
grep_value_file '1' 'adkwai' "${hosts_file}"
grep_value_file '1' 'admaster' "${hosts_file}"
grep_value_file '1' 'adnxs' "${hosts_file}"
grep_value_file '1' 'adobe' "${hosts_file}"
grep_value_file '1' 'adpush' "${hosts_file}"
grep_value_file '1' 'ads' "${hosts_file}"
grep_value_file '1' 'ads.*cdn' "${hosts_file}"
grep_value_file 'E' 'ads[[:alpha:]]?[[:digit:]]+' "${hosts_file}"
grep_value_file '1' 'ads[[:digit:]]' "${hosts_file}"
grep_value_file '1' 'adsage' "${hosts_file}"
grep_value_file '1' 'adsame' "${hosts_file}"
grep_value_file '1' 'adsapi' "${hosts_file}"
grep_value_file '1' 'adsdk' "${hosts_file}"
grep_value_file '1' 'adsensor' "${hosts_file}"
grep_value_file '1' 'adsmind' "${hosts_file}"
grep_value_file '1' 'adtrack' "${hosts_file}"
grep_value_file '1' 'advertise' "${hosts_file}"
grep_value_file '1' 'advertisement' "${hosts_file}"
grep_value_file '1' 'advertising' "${hosts_file}"
grep_value_file '1' 'adview' "${hosts_file}"
grep_value_file '1' 'adwo' "${hosts_file}"
grep_value_file '1' 'agrantsem' "${hosts_file}"
grep_value_file '1' 'alicdn' "${hosts_file}"
grep_value_file '1' 'alimama' "${hosts_file}"
grep_value_file '1' 'analytics' "${hosts_file}"
grep_value_file '1' 'api' "${hosts_file}"
grep_value_file '1' 'appad' "${hosts_file}"
grep_value_file '1' 'appads' "${hosts_file}"
grep_value_file '1' 'atianqi' "${hosts_file}"
grep_value_file '1' 'baichuan' "${hosts_file}"
grep_value_file '1' 'baidu' "${hosts_file}"
grep_value_file '1' 'banner' "${hosts_file}"
grep_value_file '1' 'bcebos' "${hosts_file}"
grep_value_file '1' 'bdimg' "${hosts_file}"
grep_value_file '1' 'bdstatic' "${hosts_file}"
grep_value_file '1' 'browser' "${hosts_file}"
grep_value_file '1' 'bugly' "${hosts_file}"
grep_value_file '1' 'cdn.*ad' "${hosts_file}"
grep_value_file '1' 'cdn.*ads' "${hosts_file}"
grep_value_file '1' 'check' "${hosts_file}"
grep_value_file '1' 'cibntv' "${hosts_file}"
grep_value_file '1' 'click' "${hosts_file}"
grep_value_file '1' 'cnzz' "${hosts_file}"
grep_value_file '1' 'commercial' "${hosts_file}"
grep_value_file '1' 'consumer' "${hosts_file}"
grep_value_file '1' 'corp' "${hosts_file}"
grep_value_file '1' 'cpro' "${hosts_file}"
grep_value_file '1' 'csdn' "${hosts_file}"
grep_value_file '1' 'ctobsnssdk' "${hosts_file}"
grep_value_file '1' 'dm' "${hosts_file}"
grep_value_file '1' 'dns' "${hosts_file}"
grep_value_file '1' 'douban' "${hosts_file}"
grep_value_file '1' 'doubanio' "${hosts_file}"
grep_value_file '1' 'doubleclick' "${hosts_file}"
grep_value_file '1' 'download' "${hosts_file}"
grep_value_file '1' 'exosrv' "${hosts_file}"
grep_value_file '1' 'flash' "${hosts_file}"
grep_value_file '1' 'flurry' "${hosts_file}"
grep_value_file '1' 'gdt' "${hosts_file}"
grep_value_file '1' 'gifshow' "${hosts_file}"
grep_value_file '1' 'godaddy' "${hosts_file}"
grep_value_file '1' 'google' "${hosts_file}"
grep_value_file '1' 'googlead' "${hosts_file}"
grep_value_file '1' 'googleads' "${hosts_file}"
grep_value_file '1' 'googleanalysis' "${hosts_file}"
grep_value_file '1' 'googlesyndication' "${hosts_file}"
grep_value_file '1' 'gtimg' "${hosts_file}"
grep_value_file '1' 'hao123' "${hosts_file}"
grep_value_file '1' 'heytap.*' "${hosts_file}"
grep_value_file '1' 'httpdns' "${hosts_file}"
grep_value_file '1' 'igexin' "${hosts_file}"
grep_value_file '1' 'imgad' "${hosts_file}"
grep_value_file '1' 'imgcache' "${hosts_file}"
grep_value_file '1' 'imtt' "${hosts_file}"
grep_value_file '1' 'ipinyou' "${hosts_file}"
grep_value_file '1' 'iqiyi' "${hosts_file}"
grep_value_file '1' 'ixigua' "${hosts_file}"
grep_value_file '1' 'jiguang' "${hosts_file}"
grep_value_file '1' 'jomodns' "${hosts_file}"
grep_value_file '1' 'juicy' "${hosts_file}"
grep_value_file '1' 'ksapisrv' "${hosts_file}"
grep_value_file '1' 'ksosoft' "${hosts_file}"
grep_value_file '1' 'kuaishou' "${hosts_file}"
grep_value_file '1' 'kwad' "${hosts_file}"
grep_value_file '1' 'lenovomm' "${hosts_file}"
grep_value_file '1' 'lianmeng' "${hosts_file}"
grep_value_file '1' 'lmgg' "${hosts_file}"
grep_value_file '1' 'locus' "${hosts_file}"
grep_value_file '1' 'lottery' "${hosts_file}"
grep_value_file '1' 'lrswl' "${hosts_file}"
grep_value_file '1' 'mediav' "${hosts_file}"
grep_value_file '1' 'meitu' "${hosts_file}"
grep_value_file '1' 'mi' "${hosts_file}"
grep_value_file '1' 'miaozhen' "${hosts_file}"
grep_value_file '1' 'migu' "${hosts_file}"
grep_value_file '1' 'miguvideo' "${hosts_file}"
grep_value_file '1' 'miui' "${hosts_file}"
grep_value_file '1' 'mmstat' "${hosts_file}"
grep_value_file '1' 'mob' "${hosts_file}"
grep_value_file '1' 'mobad' "${hosts_file}"
grep_value_file '1' 'mobads' "${hosts_file}"
grep_value_file '1' 'mobi' "${hosts_file}"
grep_value_file '1' 'mobilead' "${hosts_file}"
grep_value_file '1' 'mobileads' "${hosts_file}"
grep_value_file '1' 'mobmore' "${hosts_file}"
grep_value_file '1' 'msn' "${hosts_file}"
grep_value_file '1' 'mssdk' "${hosts_file}"
grep_value_file '1' 'mta' "${hosts_file}"
grep_value_file '1' 'netease' "${hosts_file}"
grep_value_file '1' 'oceanengine' "${hosts_file}"
grep_value_file '1' 'open' "${hosts_file}"
grep_value_file '1' 'openapi' "${hosts_file}"
grep_value_file '1' 'oppo' "${hosts_file}"
grep_value_file '1' 'oppomobile' "${hosts_file}"
grep_value_file '1' 'oupeng' "${hosts_file}"
grep_value_file '1' 'pagead' "${hosts_file}"
grep_value_file '1' 'pagead[[:digit:]]' "${hosts_file}"
grep_value_file '1' 'pandora' "${hosts_file}"
grep_value_file '1' 'pangle' "${hosts_file}"
grep_value_file '1' 'partner' "${hosts_file}"
grep_value_file '1' 'pgdt' "${hosts_file}"
grep_value_file '1' 'pglstatp' "${hosts_file}"
grep_value_file '1' 'pinduoduo' "${hosts_file}"
grep_value_file '1' 'pro' "${hosts_file}"
grep_value_file '1' 'pstatp' "${hosts_file}"
grep_value_file '1' 'puata' "${hosts_file}"
grep_value_file '1' 'qihoo' "${hosts_file}"
#grep_value_file '1' 'qq' "${hosts_file}"
grep_value_file '1' 'realsrv' "${hosts_file}"
grep_value_file '1' 'sax' "${hosts_file}"
grep_value_file '1' 'saxs' "${hosts_file}"
grep_value_file '1' 'sdk' "${hosts_file}"
grep_value_file '1' 'share' "${hosts_file}"
grep_value_file '1' 'shifen' "${hosts_file}"
grep_value_file '1' 'sina' "${hosts_file}"
grep_value_file '1' 'sinaimg' "${hosts_file}"
grep_value_file '1' 'sm' "${hosts_file}"
grep_value_file '1' 'smartadserver' "${hosts_file}"
grep_value_file '1' 'snssdk' "${hosts_file}"
grep_value_file '1' 'splash' "${hosts_file}"
grep_value_file '1' 'syndication' "${hosts_file}"
grep_value_file '1' 'tad' "${hosts_file}"
grep_value_file '1' 'tagtic' "${hosts_file}"
grep_value_file '1' 'talkingdata' "${hosts_file}"
grep_value_file '1' 'taobao' "${hosts_file}"
grep_value_file '1' 'taobaocdn' "${hosts_file}"
grep_value_file '1' 'tbs' "${hosts_file}"
grep_value_file '1' 'tieba' "${hosts_file}"
grep_value_file '1' 'tongji' "${hosts_file}"
#grep_value_file '1' 'top' "${hosts_file}"
grep_value_file '1' 'tos' "${hosts_file}"
grep_value_file '1' 'toutiao' "${hosts_file}"
#grep_value_file '1' 'tpns' "${hosts_file}"
grep_value_file '1' 'trace' "${hosts_file}"
grep_value_file '1' 'twitter' "${hosts_file}"
grep_value_file '1' 'uc' "${hosts_file}"
grep_value_file '1' 'ucweb' "${hosts_file}"
grep_value_file '1' 'uczzd' "${hosts_file}"
grep_value_file '1' 'umeng' "${hosts_file}"
grep_value_file '1' 'umengcloud' "${hosts_file}"
grep_value_file '1' 'union' "${hosts_file}"
grep_value_file '1' 'update' "${hosts_file}"
grep_value_file '1' 'upgrade' "${hosts_file}"
grep_value_file '1' 'vlion' "${hosts_file}"
grep_value_file '1' 'voiceads' "${hosts_file}"
grep_value_file '1' 'wechat' "${hosts_file}"
grep_value_file '1' 'weibo' "${hosts_file}"
grep_value_file '1' 'weixin' "${hosts_file}"
grep_value_file '1' 'woozooo' "${hosts_file}"
grep_value_file '1' 'wps' "${hosts_file}"
grep_value_file '1' 'wx' "${hosts_file}"
grep_value_file '1' 'wxs' "${hosts_file}"
grep_value_file '1' 'wxsnsdy' "${hosts_file}"
grep_value_file '1' 'x5' "${hosts_file}"
grep_value_file '1' 'xdrig' "${hosts_file}"
grep_value_file '1' 'xg' "${hosts_file}"
grep_value_file '1' 'ximalaya' "${hosts_file}"
grep_value_file '1' 'xiaomi' "${hosts_file}"
grep_value_file '1' 'xigua' "${hosts_file}"
grep_value_file '1' 'xunlei' "${hosts_file}"
grep_value_file '1' 'youdao' "${hosts_file}"
grep_value_file '1' 'yximgs' "${hosts_file}"
grep_value_file '1' 'zhihu' "${hosts_file}"
grep_value_file '1' 'zijieapi' "${hosts_file}"
grep_value_file '1' 'zzd' "${hosts_file}"
#22.09.26
grep_value_file '1' 'yandex' "${hosts_file}"
#22.10.06
#华为隐私收集和部分广告
grep_value_file '1' 'hicloud' "${hosts_file}"
#yandex广告
grep_value_file '1' 'yandexadexchange' "${hosts_file}"
#22.10.24 网易邮箱
grep_value_file '1' '163' "${hosts_file}"
#22.10.25 恢复QQ相关域名拦截，可能会有大量误杀
grep_value_file '1' 'qq' "`pwd`/tmp_hosts/yhost"
grep_value_file '1' 'qq' "`pwd`/tmp_hosts/大圣净化"
#虎扑 2022.11.20
grep_value_file '1' 'hupu' "${hosts_file}"
#Hub 联盟
grep_value_file "1" 'hubcloud' "$hosts_file"
grep_value_file "0" 'adv.' "$hosts_file"
grep_value_file "1" 'adv-' "$hosts_file"
#BeiZi 广告
grep_value_file "1" 'BeiZi' "$hosts_file"
#anythinktech
grep_value_file "1" 'anythinktech' "$hosts_file"
#toponad
grep_value_file "1" 'toponad' "$hosts_file"
#neodev 
grep_value_file "E" '[[:space:]]ad\.|(-)?ad[vsx-]|[[:space:]]ad[0-9]|ads[0-9]{1,2}|[[:space:]]([a-z]{2,8}|-)?sdk\.|[[:space:]]([a-z]{2,5})?api\.' "`pwd`/tmp_hosts/neodev"
#hblock
grep_value_file "E" '[[:space:]]ad\.|(-)?ad[vsx-]|[[:space:]]ad[0-9]|ads[0-9]{1,2}|[[:space:]]([a-z]{2,8}|-)?sdk\.|[[:space:]]([a-z]{2,5})?api\.' "`pwd`/tmp_hosts/hblock"
#1Host
grep_value_file "E" '[[:space:]]ad\.|(-)?ad[vsx-]|[[:space:]]ad[0-9]|ads[0-9]{1,2}|[[:space:]]([a-z]{2,8}|-)?sdk\.|[[:space:]]([a-z]{2,5})?api\.' "`pwd`/tmp_hosts/1Host"


}

#开始运行
#设置环境
RUnning_SETUPS_environment
#筛选设定值
RUnning_grep_values_conf
Do_detect_hosts
#制作去除广告奖励的Host
mktouch_host
#制作不包含广告奖励的Host
mktouch_no_host
#制作adblock规则
adblock `pwd`/reward
#制作Adaway白名单
white_list_Maker_Adaway `pwd`/configure/排除列表.prop
#制作Adclose规则
adclose `pwd`/reward
#统计
rm -rf `pwd`/result `pwd`/host `pwd`/tmp_hosts
test -f `pwd`/reward && echo "文件大小 $( du -sh `pwd`/reward )，hosts数量: $(cat `pwd`/reward | wc -l ) "
test -f `pwd`/all && echo "文件大小 $( du -sh `pwd`/all )，hosts数量: $(cat `pwd`/all | wc -l ) "
test -f `pwd`/adb.txt && echo "文件大小 $( du -sh `pwd`/adb.txt )，hosts数量: $(cat `pwd`/adb.txt | wc -l ) "




