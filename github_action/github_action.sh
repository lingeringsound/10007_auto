#!/bin/sh

original_Host=host

function wipe_value() {
	local file="${1}"
	#去除特殊符号
	echo -e "\n去除特殊符号……"
	sed -i '/^#/d;/^[[:space:]]*$/d' "${file}"
	sed -i '/\[/d;/^[[:space:]]*$/d' "${file}"
	sed -i '/\]/d;/^[[:space:]]*$/d' "${file}"
	sed -i '/<.*>/d;/^[[:space:]]*$/d' "${file}"
	sed -i '/^@/d;/^[[:space:]]*$/d' "${file}"
	sed -i 's|[[:space:]]$||g' "${file}"
	#去除特殊的0.0.0.0符号
	echo -e "\n去除特殊0.0.0.0符号……"
	sed -i 's|^0.0.0.0[[:space:]]|127.0.0.1 |g' "${file}"
	sed -i 's|^0.0.0.0	|127.0.0.1 |g' "${file}"
	sed -i 's|^0.0.0.0[[:space:]][[:space:]]|127.0.0.1 |g' "${file}"
	sed -i 's|^0.0.0.0[[:space:]][[:space:]][[:space:]]|127.0.0.1 |g' "${file}"
	sed -i 's|^0.0.0.0[[:space:]][[:space:]][[:space:]][[:space:]]|127.0.0.1 |g' "${file}"
	#去除特殊的127.0.0.1符号
	echo -e "\n去除特殊127.0.0.1符号……"
	sed -i 's|^127.0.0.1	|127.0.0.1 |g' "${file}"
	sed -i '/^127.0.0.1[[:space:]]#/d;/^[[:space:]]*$/d' "${file}"
	sed -i 's|^127.0.0.1[[:space:]][[:space:]]|127.0.0.1 |g' "${file}"
	sed -i 's|^127.0.0.1[[:space:]][[:space:]][[:space:]]|127.0.0.1 |g' "${file}"
	sed -i 's|^127.0.0.1[[:space:]][[:space:]][[:space:]][[:space:]]|127.0.0.1 |g' "${file}"
	sed -i 's|^127.0.0.1    |127.0.0.1 |g' "${file}"
	#去除"::"回环
	echo -e "\n去除回环符号……"
	sed -i 's|^::[[:space:]]|127.0.0.1 |g' "${file}"
	sed -i 's|^::[[:space:]][[:space:]]|127.0.0.1 |g' "${file}"
}


function mk_new_file() {
	local file=$1
	local new=$(cat "${file}" | sort | uniq | sed '/^[[:space:]]*$/d')
	echo "$new" >"${file}"
}

function download_hosts() {
local file="${1}"
while read i; do curl -s "${i}" >> ${file} && echo "下载成功" || echo "$i 下载失败" ;done<<EOF
https://hblock.molinero.dev/hosts
https://raw.githubusercontent.com/E7KMbb/AD-hosts/master/system/etc/hosts
https://raw.githubusercontent.com/Goooler/1024_hosts/master/hosts
https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts
https://raw.githubusercontent.com/VeleSila/yhosts/master/hosts
https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts
https://hosts.oisd.nl/basic
https://neodev.team/lite_host
EOF
}

function grep_value_file () {
local value="${2}"
local file="${3}"
local word="${1}"
test $word == 1 && word='-iw' || word='-i'
local targetdir="${0%/*}/result"
if test -e "${file}" ;then 
	mkdir -p "${targetdir}"
cat <<key>>"${targetdir}/${value}_${file##*/}.conf" && echo "已经输出「 $value 」"
$(cat "${file}" | grep "$word" "${value}" "${file}" | sed '/^#/d;/^[[:space:]]*$/d' )
key
fi
}

function wipe_logcat() {
local file="$1"
local list="
errlogos
errlog
errlogs
eventlog
extlog
xlog
xlogs
logs
log
ulog
ulogs
toblog
tobapplog
"
local IFS=$'\n'
if test -f "$file" ;then
	for i in $list 
		do
		echo "$(grep -wvi "$i" "$file")" > "$file"
	done
fi
}

function exclude_value() {
local conf="${1}"
local target="${2}"
if test -e $conf ;then 
echo "[$(date +%y-%m-%d-%T)] ※执行排除文件["${conf}"]下的规则……※\n"
	for i in $(cat "${conf}" | sed '/^#.*/d;/^[[:space:]]*$/d' )
		do
			sed -i "/$i/d" "${target}"
	done && echo "[$(date +%y-%m-%d-%T)] ※已排除[${conf}]文件中的规则※\n"
fi
}

function add_custo() {
local conf_file="${1}"
local target="${2}"
if test -e "${conf_file}" ;then
	cp -rf "${conf_file}" "${target}/${conf_file##*/}.conf" && echo "[$(date +%y-%m-%d-%T)] ※复制["${conf_file}"]※\n" || echo "[$(date +%y-%m-%d-%T)] ※复制["${conf_file}"]失败！※\n"
fi
}

function combine_file() {
local target_dir="${1}"
local output="${2}"
test -e "${output}" && rm -rf "${output}"
if test -e "${target_dir}" ;then
	echo "[$(date +%y-%m-%d-%T)] ※合并规则中……※\n"
for i in ${target_dir}/*.conf ;do
cat <<key >>"${output}"
$(cat $i)
key
done && echo "[$(date +%y-%m-%d-%T)] ※完成合并规则！※\n" || echo "[$(date +%y-%m-%d-%T)] ※合并失败！※\n"
	if test -e "${output}" ;then
		echo "[$(date +%y-%m-%d-%T)] ※筛选重复项中……※\n"
cat <<key >"${output}" && echo "[$(date +%y-%m-%d-%T)] ※筛选重复项完成！※\n" || echo "[$(date +%y-%m-%d-%T)] ※筛选失败！※\n"
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
}

function remove_ad() {
local file="$1"
local target="$2"
local local_host_file="$3"
cat "${file}" | sed '/^#/d;/^[[:space:]]*$/d' | while read host ;do
echo "127.0.0.1 $host" >> "$target"
done
cat <<key >> $local_host_file
#广告奖励
$(cat "$target" )
#END
key
}

function write_head() {
local target_file="${1}"
sed -i "1i #@coolapk 1007" "${target_file}"
sed -i "2i #有问题可以在文件里搜索关键词" "${target_file}"
sed -i "3i #例如\"toutiao(头条)\"，\"MIUI xiaomi (小米)\"，\"reward(奖励)\"" "${target_file}"
sed -i "4i #在相应行的开头加个\"\#\"号" "${target_file}"
sed -i "5i #更新时间: $(date '+%F %T') " "${target_file}"
sed -i "6i 127.0.0.1 localhost" "${target_file}"
sed -i "7i ::1 localhost" "${target_file}"
sed -i "8i ::1 ip6-loopback" "${target_file}"
sed -i "9i ::1 ip6-localhost" "${target_file}"
sed -i '10i \n' "${target_file}"
}

function adblock() {
echo "[$(date +%y-%m-%d-%T)] ※制作Adblock规则……※\n"
local old_file="${1}"
local file="${old_file%/*}/adb.txt"
cp -rf "$old_file" "$file"
if test -f "$file" ;then
	sed -i "s|^#|!|g" "$file"
	sed -i "/^::1/d" "$file"
	sed -i "s/127.0.0.1[[:space:]]localhost//g" "$file"
	sed -i "s/127.0.0.1 /||/g;s|$|^|g" "$file"
	sed -i "s/^\^//g" "$file"
	sed -i "1i [Host 10007]" "$file"
	sed -i "2i !Title: Host 10007" "$file"
	sed -i "3i !URL= https://raw.githubusercontent.com/lingeringsound/10007/main/adb.txt" "$file"
fi
}

function mktouch_host() {
download_hosts ./host
mk_new_file ./host
wipe_value ./host
dos2unix ./host

grep_value_file "1" '1688' ./host
grep_value_file "1" '2345' ./host
grep_value_file "1" '360' ./host
grep_value_file "1" '360safe' ./host
grep_value_file "1" '365' ./host
grep_value_file "1" 'JUNKY' ./host
grep_value_file "1" 'TRAFFIC' ./host
grep_value_file "1" 'TRAFFIC.*JUNKY' ./host
grep_value_file "1" '[[:alpha:]]ad' ./host
grep_value_file "1" '[[:alpha:]]ads' ./host
grep_value_file "1" '[[:alpha:]]cdn' ./host
grep_value_file "1" '[[:alpha:]]sdk' ./host
grep_value_file "1" '[[:digit:]]ad' ./host
grep_value_file "1" '[[:digit:]]ads' ./host
grep_value_file "1" 'ad' ./host
grep_value_file "1" 'ad.*cdn' ./host
grep_value_file "1" 'ad.*service' ./host
grep_value_file "1" 'ad.*services' ./host
grep_value_file "1" 'ad[[:alpha:]]' ./host
grep_value_file "1" 'ad[[:alpha:]][[:digit:]]' ./host
grep_value_file "1" 'ad[[:digit:]]' ./host
grep_value_file "1" 'adapi' ./host
grep_value_file "1" 'adbana' ./host
grep_value_file "1" 'adimg' ./host
grep_value_file "1" 'adjust' ./host
grep_value_file "1" 'adkwai' ./host
grep_value_file "1" 'admaster' ./host
grep_value_file "1" 'adnxs' ./host
grep_value_file "1" 'adobe' ./host
grep_value_file "1" 'adpush' ./host
grep_value_file "1" 'ads' ./host
grep_value_file "1" 'ads.*cdn' ./host
grep_value_file "1" 'ads[[:alpha:]][[:digit:]]' ./host
grep_value_file "1" 'ads[[:digit:]]' ./host
grep_value_file "1" 'adsage' ./host
grep_value_file "1" 'adsame' ./host
grep_value_file "1" 'adsapi' ./host
grep_value_file "1" 'adsdk' ./host
grep_value_file "1" 'adsensor' ./host
grep_value_file "1" 'adsmind' ./host
grep_value_file "1" 'adtrack' ./host
grep_value_file "1" 'advertise' ./host
grep_value_file "1" 'advertisement' ./host
grep_value_file "1" 'advertising' ./host
grep_value_file "1" 'adview' ./host
grep_value_file "1" 'adwo' ./host
grep_value_file "1" 'agrantsem' ./host
grep_value_file "1" 'alicdn' ./host
grep_value_file "1" 'alimama' ./host
grep_value_file "1" 'analytics' ./host
grep_value_file "1" 'api' ./host
grep_value_file "1" 'appad' ./host
grep_value_file "1" 'appads' ./host
grep_value_file "1" 'atianqi' ./host
grep_value_file "1" 'baichuan' ./host
grep_value_file "1" 'baidu' ./host
grep_value_file "1" 'banner' ./host
grep_value_file "1" 'bcebos' ./host
grep_value_file "1" 'bdimg' ./host
grep_value_file "1" 'bdstatic' ./host
grep_value_file "1" 'browser' ./host
grep_value_file "1" 'bugly' ./host
grep_value_file "1" 'cdn.*ad' ./host
grep_value_file "1" 'cdn.*ads' ./host
grep_value_file "1" 'check' ./host
grep_value_file "1" 'cibntv' ./host
grep_value_file "1" 'click' ./host
grep_value_file "1" 'cnzz' ./host
grep_value_file "1" 'commercial' ./host
grep_value_file "1" 'consumer' ./host
grep_value_file "1" 'corp' ./host
grep_value_file "1" 'cpro' ./host
grep_value_file "1" 'csdn' ./host
grep_value_file "1" 'ctobsnssdk' ./host
grep_value_file "1" 'dm' ./host
grep_value_file "1" 'dns' ./host
grep_value_file "1" 'douban' ./host
grep_value_file "1" 'doubanio' ./host
grep_value_file "1" 'doubleclick' ./host
grep_value_file "1" 'download' ./host
grep_value_file "1" 'exosrv' ./host
grep_value_file "1" 'flash' ./host
grep_value_file "1" 'flurry' ./host
grep_value_file "1" 'gdt' ./host
grep_value_file "1" 'gifshow' ./host
grep_value_file "1" 'godaddy' ./host
grep_value_file "1" 'google' ./host
grep_value_file "1" 'googlead' ./host
grep_value_file "1" 'googleads' ./host
grep_value_file "1" 'googleanalysis' ./host
grep_value_file "1" 'googlesyndication' ./host
grep_value_file "1" 'gtimg' ./host
grep_value_file "1" 'hao123' ./host
grep_value_file "1" 'heytap.*' ./host
grep_value_file "1" 'httpdns' ./host
grep_value_file "1" 'igexin' ./host
grep_value_file "1" 'imgad' ./host
grep_value_file "1" 'imgcache' ./host
grep_value_file "1" 'imtt' ./host
grep_value_file "1" 'ipinyou' ./host
grep_value_file "1" 'iqiyi' ./host
grep_value_file "1" 'ixigua' ./host
grep_value_file "1" 'jiguang' ./host
grep_value_file "1" 'jomodns' ./host
grep_value_file "1" 'juicy' ./host
grep_value_file "1" 'ksapisrv' ./host
grep_value_file "1" 'ksosoft' ./host
grep_value_file "1" 'kuaishou' ./host
grep_value_file "1" 'kwad' ./host
grep_value_file "1" 'lenovomm' ./host
grep_value_file "1" 'lianmeng' ./host
grep_value_file "1" 'lmgg' ./host
grep_value_file "1" 'locus' ./host
grep_value_file "1" 'lottery' ./host
grep_value_file "1" 'lrswl' ./host
grep_value_file "1" 'mediav' ./host
grep_value_file "1" 'meitu' ./host
grep_value_file "1" 'mi' ./host
grep_value_file "1" 'miaozhen' ./host
grep_value_file "1" 'migu' ./host
grep_value_file "1" 'miguvideo' ./host
grep_value_file "1" 'miui' ./host
grep_value_file "1" 'mmstat' ./host
grep_value_file "1" 'mob' ./host
grep_value_file "1" 'mobad' ./host
grep_value_file "1" 'mobads' ./host
grep_value_file "1" 'mobi' ./host
grep_value_file "1" 'mobilead' ./host
grep_value_file "1" 'mobileads' ./host
grep_value_file "1" 'mobmore' ./host
grep_value_file "1" 'msn' ./host
grep_value_file "1" 'mssdk' ./host
grep_value_file "1" 'mta' ./host
grep_value_file "1" 'netease' ./host
grep_value_file "1" 'oceanengine' ./host
grep_value_file "1" 'open' ./host
grep_value_file "1" 'openapi' ./host
grep_value_file "1" 'oppo' ./host
grep_value_file "1" 'oppomobile' ./host
grep_value_file "1" 'oupeng' ./host
grep_value_file "1" 'pagead' ./host
grep_value_file "1" 'pagead[[:digit:]]' ./host
grep_value_file "1" 'pandora' ./host
grep_value_file "1" 'pangle' ./host
grep_value_file "1" 'partner' ./host
grep_value_file "1" 'pgdt' ./host
grep_value_file "1" 'pglstatp' ./host
grep_value_file "1" 'pinduoduo' ./host
grep_value_file "1" 'pro' ./host
grep_value_file "1" 'pstatp' ./host
grep_value_file "1" 'puata' ./host
grep_value_file "1" 'qihoo' ./host
grep_value_file "1" 'qq' ./host
grep_value_file "1" 'realsrv' ./host
grep_value_file "1" 'sax' ./host
grep_value_file "1" 'saxs' ./host
grep_value_file "1" 'sdk' ./host
grep_value_file "1" 'share' ./host
grep_value_file "1" 'shifen' ./host
grep_value_file "1" 'sina' ./host
grep_value_file "1" 'sinaimg' ./host
grep_value_file "1" 'sm' ./host
grep_value_file "1" 'smartadserver' ./host
grep_value_file "1" 'snssdk' ./host
grep_value_file "1" 'splash' ./host
grep_value_file "1" 'syndication' ./host
grep_value_file "1" 'tad' ./host
grep_value_file "1" 'tagtic' ./host
grep_value_file "1" 'talkingdata' ./host
grep_value_file "1" 'taobao' ./host
grep_value_file "1" 'taobaocdn' ./host
grep_value_file "1" 'tbs' ./host
grep_value_file "1" 'tieba' ./host
grep_value_file "1" 'tongji' ./host
grep_value_file "1" 'top' ./host
grep_value_file "1" 'tos' ./host
grep_value_file "1" 'toutiao' ./host
grep_value_file "1" 'tpns' ./host
grep_value_file "1" 'trace' ./host
grep_value_file "1" 'twitter' ./host
grep_value_file "1" 'uc' ./host
grep_value_file "1" 'ucweb' ./host
grep_value_file "1" 'uczzd' ./host
grep_value_file "1" 'umeng' ./host
grep_value_file "1" 'umengcloud' ./host
grep_value_file "1" 'union' ./host
grep_value_file "1" 'update' ./host
grep_value_file "1" 'upgrade' ./host
grep_value_file "1" 'vlion' ./host
grep_value_file "1" 'voiceads' ./host
grep_value_file "1" 'wechat' ./host
grep_value_file "1" 'weibo' ./host
grep_value_file "1" 'weixin' ./host
grep_value_file "1" 'woozooo' ./host
grep_value_file "1" 'wps' ./host
grep_value_file "1" 'wx' ./host
grep_value_file "1" 'wxs' ./host
grep_value_file "1" 'wxsnsdy' ./host
grep_value_file "1" 'x5' ./host
grep_value_file "1" 'xdrig' ./host
grep_value_file "1" 'xg' ./host
grep_value_file "1" 'ximalaya' ./host
grep_value_file "1" 'xiaomi' ./host
grep_value_file "1" 'xigua' ./host
grep_value_file "1" 'xunlei' ./host
grep_value_file "1" 'youdao' ./host
grep_value_file "1" 'yximgs' ./host
grep_value_file "1" 'zhihu' ./host
grep_value_file "1" 'zijieapi' ./host
grep_value_file "1" 'zzd' ./host

add_custo ./configure/自定义.prop ./result
add_custo ./configure/魅族.conf ./result
remove_ad ./configure/配置/广告奖励.prop ./result/广告奖励.conf ./all
combine_file ./result ./all
exclude_value ./configure/排除列表.prop ./all
modtifly ./all
write_head ./all
}

function mktouch_no_host() {
download_hosts ./host
mk_new_file ./host
wipe_value ./host
dos2unix ./host

grep_value_file "1" '1688' ./host
grep_value_file "1" '2345' ./host
grep_value_file "1" '360' ./host
grep_value_file "1" '360safe' ./host
grep_value_file "1" '365' ./host
grep_value_file "1" 'JUNKY' ./host
grep_value_file "1" 'TRAFFIC' ./host
grep_value_file "1" 'TRAFFIC.*JUNKY' ./host
grep_value_file "1" '[[:alpha:]]ad' ./host
grep_value_file "1" '[[:alpha:]]ads' ./host
grep_value_file "1" '[[:alpha:]]cdn' ./host
grep_value_file "1" '[[:alpha:]]sdk' ./host
grep_value_file "1" '[[:digit:]]ad' ./host
grep_value_file "1" '[[:digit:]]ads' ./host
grep_value_file "1" 'ad' ./host
grep_value_file "1" 'ad.*cdn' ./host
grep_value_file "1" 'ad.*service' ./host
grep_value_file "1" 'ad.*services' ./host
grep_value_file "1" 'ad[[:alpha:]]' ./host
grep_value_file "1" 'ad[[:alpha:]][[:digit:]]' ./host
grep_value_file "1" 'ad[[:digit:]]' ./host
grep_value_file "1" 'adapi' ./host
grep_value_file "1" 'adbana' ./host
grep_value_file "1" 'adimg' ./host
grep_value_file "1" 'adjust' ./host
grep_value_file "1" 'adkwai' ./host
grep_value_file "1" 'admaster' ./host
grep_value_file "1" 'adnxs' ./host
grep_value_file "1" 'adobe' ./host
grep_value_file "1" 'adpush' ./host
grep_value_file "1" 'ads' ./host
grep_value_file "1" 'ads.*cdn' ./host
grep_value_file "1" 'ads[[:alpha:]][[:digit:]]' ./host
grep_value_file "1" 'ads[[:digit:]]' ./host
grep_value_file "1" 'adsage' ./host
grep_value_file "1" 'adsame' ./host
grep_value_file "1" 'adsapi' ./host
grep_value_file "1" 'adsdk' ./host
grep_value_file "1" 'adsensor' ./host
grep_value_file "1" 'adsmind' ./host
grep_value_file "1" 'adtrack' ./host
grep_value_file "1" 'advertise' ./host
grep_value_file "1" 'advertisement' ./host
grep_value_file "1" 'advertising' ./host
grep_value_file "1" 'adview' ./host
grep_value_file "1" 'adwo' ./host
grep_value_file "1" 'agrantsem' ./host
grep_value_file "1" 'alicdn' ./host
grep_value_file "1" 'alimama' ./host
grep_value_file "1" 'analytics' ./host
grep_value_file "1" 'api' ./host
grep_value_file "1" 'appad' ./host
grep_value_file "1" 'appads' ./host
grep_value_file "1" 'atianqi' ./host
grep_value_file "1" 'baichuan' ./host
grep_value_file "1" 'baidu' ./host
grep_value_file "1" 'banner' ./host
grep_value_file "1" 'bcebos' ./host
grep_value_file "1" 'bdimg' ./host
grep_value_file "1" 'bdstatic' ./host
grep_value_file "1" 'browser' ./host
grep_value_file "1" 'bugly' ./host
grep_value_file "1" 'cdn.*ad' ./host
grep_value_file "1" 'cdn.*ads' ./host
grep_value_file "1" 'check' ./host
grep_value_file "1" 'cibntv' ./host
grep_value_file "1" 'click' ./host
grep_value_file "1" 'cnzz' ./host
grep_value_file "1" 'commercial' ./host
grep_value_file "1" 'consumer' ./host
grep_value_file "1" 'corp' ./host
grep_value_file "1" 'cpro' ./host
grep_value_file "1" 'csdn' ./host
grep_value_file "1" 'ctobsnssdk' ./host
grep_value_file "1" 'dm' ./host
grep_value_file "1" 'dns' ./host
grep_value_file "1" 'douban' ./host
grep_value_file "1" 'doubanio' ./host
grep_value_file "1" 'doubleclick' ./host
grep_value_file "1" 'download' ./host
grep_value_file "1" 'exosrv' ./host
grep_value_file "1" 'flash' ./host
grep_value_file "1" 'flurry' ./host
grep_value_file "1" 'gdt' ./host
grep_value_file "1" 'gifshow' ./host
grep_value_file "1" 'godaddy' ./host
grep_value_file "1" 'google' ./host
grep_value_file "1" 'googlead' ./host
grep_value_file "1" 'googleads' ./host
grep_value_file "1" 'googleanalysis' ./host
grep_value_file "1" 'googlesyndication' ./host
grep_value_file "1" 'gtimg' ./host
grep_value_file "1" 'hao123' ./host
grep_value_file "1" 'heytap.*' ./host
grep_value_file "1" 'httpdns' ./host
grep_value_file "1" 'igexin' ./host
grep_value_file "1" 'imgad' ./host
grep_value_file "1" 'imgcache' ./host
grep_value_file "1" 'imtt' ./host
grep_value_file "1" 'ipinyou' ./host
grep_value_file "1" 'iqiyi' ./host
grep_value_file "1" 'ixigua' ./host
grep_value_file "1" 'jiguang' ./host
grep_value_file "1" 'jomodns' ./host
grep_value_file "1" 'juicy' ./host
grep_value_file "1" 'ksapisrv' ./host
grep_value_file "1" 'ksosoft' ./host
grep_value_file "1" 'kuaishou' ./host
grep_value_file "1" 'kwad' ./host
grep_value_file "1" 'lenovomm' ./host
grep_value_file "1" 'lianmeng' ./host
grep_value_file "1" 'lmgg' ./host
grep_value_file "1" 'locus' ./host
grep_value_file "1" 'lottery' ./host
grep_value_file "1" 'lrswl' ./host
grep_value_file "1" 'mediav' ./host
grep_value_file "1" 'meitu' ./host
grep_value_file "1" 'mi' ./host
grep_value_file "1" 'miaozhen' ./host
grep_value_file "1" 'migu' ./host
grep_value_file "1" 'miguvideo' ./host
grep_value_file "1" 'miui' ./host
grep_value_file "1" 'mmstat' ./host
grep_value_file "1" 'mob' ./host
grep_value_file "1" 'mobad' ./host
grep_value_file "1" 'mobads' ./host
grep_value_file "1" 'mobi' ./host
grep_value_file "1" 'mobilead' ./host
grep_value_file "1" 'mobileads' ./host
grep_value_file "1" 'mobmore' ./host
grep_value_file "1" 'msn' ./host
grep_value_file "1" 'mssdk' ./host
grep_value_file "1" 'mta' ./host
grep_value_file "1" 'netease' ./host
grep_value_file "1" 'oceanengine' ./host
grep_value_file "1" 'open' ./host
grep_value_file "1" 'openapi' ./host
grep_value_file "1" 'oppo' ./host
grep_value_file "1" 'oppomobile' ./host
grep_value_file "1" 'oupeng' ./host
grep_value_file "1" 'pagead' ./host
grep_value_file "1" 'pagead[[:digit:]]' ./host
grep_value_file "1" 'pandora' ./host
grep_value_file "1" 'pangle' ./host
grep_value_file "1" 'partner' ./host
grep_value_file "1" 'pgdt' ./host
grep_value_file "1" 'pglstatp' ./host
grep_value_file "1" 'pinduoduo' ./host
grep_value_file "1" 'pro' ./host
grep_value_file "1" 'pstatp' ./host
grep_value_file "1" 'puata' ./host
grep_value_file "1" 'qihoo' ./host
grep_value_file "1" 'qq' ./host
grep_value_file "1" 'realsrv' ./host
grep_value_file "1" 'sax' ./host
grep_value_file "1" 'saxs' ./host
grep_value_file "1" 'sdk' ./host
grep_value_file "1" 'share' ./host
grep_value_file "1" 'shifen' ./host
grep_value_file "1" 'sina' ./host
grep_value_file "1" 'sinaimg' ./host
grep_value_file "1" 'sm' ./host
grep_value_file "1" 'smartadserver' ./host
grep_value_file "1" 'snssdk' ./host
grep_value_file "1" 'splash' ./host
grep_value_file "1" 'syndication' ./host
grep_value_file "1" 'tad' ./host
grep_value_file "1" 'tagtic' ./host
grep_value_file "1" 'talkingdata' ./host
grep_value_file "1" 'taobao' ./host
grep_value_file "1" 'taobaocdn' ./host
grep_value_file "1" 'tbs' ./host
grep_value_file "1" 'tieba' ./host
grep_value_file "1" 'tongji' ./host
grep_value_file "1" 'top' ./host
grep_value_file "1" 'tos' ./host
grep_value_file "1" 'toutiao' ./host
grep_value_file "1" 'tpns' ./host
grep_value_file "1" 'trace' ./host
grep_value_file "1" 'twitter' ./host
grep_value_file "1" 'uc' ./host
grep_value_file "1" 'ucweb' ./host
grep_value_file "1" 'uczzd' ./host
grep_value_file "1" 'umeng' ./host
grep_value_file "1" 'umengcloud' ./host
grep_value_file "1" 'union' ./host
grep_value_file "1" 'update' ./host
grep_value_file "1" 'upgrade' ./host
grep_value_file "1" 'vlion' ./host
grep_value_file "1" 'voiceads' ./host
grep_value_file "1" 'wechat' ./host
grep_value_file "1" 'weibo' ./host
grep_value_file "1" 'weixin' ./host
grep_value_file "1" 'woozooo' ./host
grep_value_file "1" 'wps' ./host
grep_value_file "1" 'wx' ./host
grep_value_file "1" 'wxs' ./host
grep_value_file "1" 'wxsnsdy' ./host
grep_value_file "1" 'x5' ./host
grep_value_file "1" 'xdrig' ./host
grep_value_file "1" 'xg' ./host
grep_value_file "1" 'ximalaya' ./host
grep_value_file "1" 'xiaomi' ./host
grep_value_file "1" 'xigua' ./host
grep_value_file "1" 'xunlei' ./host
grep_value_file "1" 'youdao' ./host
grep_value_file "1" 'yximgs' ./host
grep_value_file "1" 'zhihu' ./host
grep_value_file "1" 'zijieapi' ./host
grep_value_file "1" 'zzd' ./host

add_custo ./configure/自定义.prop ./result
add_custo ./configure/魅族.conf ./result
combine_file ./result ./reward
exclude_value ./configure/排除列表.prop ./reward
exclude_value ./configure/保留奖励.prop ./reward
modtifly ./reward
write_head ./reward
}


mktouch_host
mktouch_no_host

