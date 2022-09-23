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

function grep_value_file() {
local value="${2}"
local file="${3}"
local word="${1}"
test $word == 1 && word='-iw' || word='-i'
local targetdir="./result"
if test -e "${file}" ;then 
	mkdir -p ${targetdir}
cat <<key>>"${targetdir}/${value}_${file##*/}.conf" && echo "已经输出「 $value 」"
$(cat "${file}" | grep "$word" "${value}" "${file}" | sed '/^#/d;/^[[:space:]]*$/d' | sed '' )
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
grep_value_file ./host
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
grep_value_file ./host
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

