#!/bin/bash

function setup_environment(){
mkdir -p `pwd`/result
mkdir -p `pwd`/configure
dos2unix `pwd`/* >/dev/null 2>&1
dos2unix `pwd`/*/* >/dev/null 2>&1
}

function SETUPS_TEXT_custo_FILE(){
local file="`pwd`/configure/自定义.prop"
cat << "key" > ${file}
#蓝奏云
127.0.0.1 lupic.cdn.bcebos.com
127.0.0.1 sanme2.lanzoui.com
127.0.0.1 glores2.lanzoui.com
127.0.0.1 sanme2.lanzoux.com
127.0.0.1 glores2.lanzoux.com
127.0.0.1 sanme2.taisantech.com
127.0.0.1 glores2.taisantech.com


#其他
#127.0.0.1 ulog.ksapisrv.com
#127.0.0.1 ulogs.bytefence.com
127.0.0.1 erebor.douban.com
#127.0.0.1 tobapplog.ctobsnssdk.com
#127.0.0.1 h.trace.qq.com
127.0.0.1 yoke.tianyaoguan.cn

#微信
127.0.0.1 chineseinla.com
127.0.0.1 ckxxbao.com
127.0.0.1 ptbus.com
127.0.0.1 pilipali.cc
127.0.0.1 qsptv.net
127.0.0.1 meijutt.tv

#禁漫
127.0.0.1 ikhgg.snalkdl.top
127.0.0.1 adserver.juicyads.com
127.0.0.1 poweredby.jads.com
127.0.0.1 poweredby.jads.co
127.0.0.1 a.realsrv.com
127.0.0.1 ck.jads.co
127.0.0.1 2yearatt15.sugar1818.net
127.0.0.1 squirtatt15.sugar1818.net
127.0.0.1 xratt15.sky1818.net
127.0.0.1 bongacams.com
127.0.0.1 juicy-news.blogspot.us.intellitxt.com
127.0.0.1 juicy-pubg.com
127.0.0.1 juicyads.com
127.0.0.1 juicyads.me
127.0.0.1 juicycash.net
127.0.0.1 juicyceleb.us.intellitxt.com
127.0.0.1 juicyfiles.net
127.0.0.1 juicygf.com
127.0.0.1 juicygif.com
127.0.0.1 juicygirlfriends.com
127.0.0.1 juicygranny.com
127.0.0.1 juicylesbiansex.com
127.0.0.1 juicypussyclips.com
127.0.0.1 juicyteenie.com
127.0.0.1 juicyteenvideos.com
127.0.0.1 juicywebcams.com
127.0.0.1 juicywin.pl
127.0.0.1 juicywives.com

#头条
127.0.0.1 dm-hl.toutiao.com

#咪咕
127.0.0.1 ggx01.miguvideo.com
127.0.0.1 ggx02.miguvideo.com
127.0.0.1 ggic01.miguvideo.com


#QQ
127.0.0.1 wxa.wxs.qq.com
127.0.0.1 badjs.weixinbridge.com
127.0.0.1 badjs.qq.com
127.0.0.1 mark.l.qq.com
127.0.0.1 market.m.qq.com
127.0.0.1 adss.video.qq.com

#酷安广告
127.0.0.1 stream.snssdk.com
127.0.0.1 tnc3-bjlgy.snssdk.com
127.0.0.1 vas-hl-x.snssdk.com
127.0.0.1 dm-lq.toutiao.com
#127.0.0.1 toblog.ctobsnssdk.com
127.0.0.1 mssdk-bu.bytedance.com
#127.0.0.1 v3-default.ixigua.com
127.0.0.1 pangolin.snssdk.com

#知乎
#127.0.0.1 vdn1.vzuu.com
#127.0.0.1 vdn.vzuu.com
#127.0.0.1 vdn2.vzuu.com
#127.0.0.1 vdn3.vzuu.com
#127.0.0.1 vdn4.vzuu.com

#MIUI
127.0.0.1 hysdkservice.g.mi.com
127.0.0.1 im-x.jd.com
#127.0.0.1 img11.360buyimg.com
#127.0.0.1 verify.sec.xiaomi.com
127.0.0.1 erebor.douban.com
#127.0.0.1 static-verify.sec.xiaomi.com
127.0.0.1 amonsul.douban.com
127.0.0.1 msedown.360safe.com

#腾讯22.03.18
127.0.0.1 qzs.gdtimg.com
127.0.0.1 adstats.tencentmusic.com
127.0.0.1 a.lubiao.com
127.0.0.1 access1.tpns.tencent.com

#网易22.03.19
127.0.0.1 ad.163.com
127.0.0.1 adimg.163.com
127.0.0.1 adserver.163.com
127.0.0.1 iad.g.163.com


#adrules
127.0.0.1 xg.adbeuch.cn
127.0.0.1 ssl.trace.zhiziyun.com
127.0.0.1 live-trace.bilibili.com
127.0.0.1 analytics.tv189.cn
127.0.0.1 adfunds.org
127.0.0.1 adchina.cc

#有道云笔记22.03.26
127.0.0.1 push.lx.netease.com
127.0.0.1 advert.lx.netease.com

#22.03.26 腾讯
#127.0.0.1 guid.tpns.tencent.com
#127.0.0.1 log.tpns.tencent.com
#127.0.0.1 ping.cloud.tencent.com
#127.0.0.1 sensors.cloud.tencent.com
127.0.0.1 ad.tencentmusic.com
127.0.0.1 adcdn.tencentmusic.com
127.0.0.1 adclick.tencentmusic.com
127.0.0.1 adexpo.tencentmusic.com
127.0.0.1 adstats.tencentmusic.com
127.0.0.1 bds.snssdk.com
#127.0.0.1 midas.gtimg.cn

#快手22.03.26
127.0.0.1 com.yxcorp.gifshow.ad
127.0.0.1 com.yxcorp.gifshow.map

#穿山甲(snssdk)22.03.27
#127.0.0.1 extlog.snssdk.com
127.0.0.1 ug.snssdk.com

#京东22.03.27
127.0.0.1 img14.360buyimg.com

#UC浏览器
#127.0.0.1 pdds.ucweb.com
#127.0.0.1 iflow.uczzd.cn

#网页22.03.29
127.0.0.1 cdn.lakdc.top
127.0.0.1 www.smyfinancial.com
127.0.0.1 i.cat-happy.cn
127.0.0.1 i.hao61.net

#22.03.30
127.0.0.1 staticsns.cdn.bcebos.com

#QQ浏览器22.03.31
127.0.0.1 upage.imtt.qq.com
127.0.0.1 v.gdt.qq.com
127.0.0.1 mtt.eve.mdt.qq.com
127.0.0.1 mtt.str.mdt.qq.com

#酷安
#127.0.0.1 imtt.dd.qq.com
#127.0.0.1 downum.game.uc.cn
#127.0.0.1 gdown.baidu.com
#127.0.0.1 opencdnbdgdown.jomodns.com

#22.03.31
#360加固
127.0.0.1 a.appjiagu.com
127.0.0.1 b.appjiagu.com
127.0.0.1 c.appjiagu.com
127.0.0.1 j.appjiagu.com
127.0.0.1 p.appjiagu.com
127.0.0.1 s.appjiagu.com

#京东
127.0.0.1 cm.jd.com
127.0.0.1 im-x.jd.com
127.0.0.1 img-x.jd.com
127.0.0.1 u-x.jd.com
127.0.0.1 u.x.jd.com
127.0.0.1 x.jd.com

#新浪微博
127.0.0.1 d0.sinaimg.cn
127.0.0.1 d1.sinaimg.cn
127.0.0.1 d2.sinaimg.cn
127.0.0.1 d3.sinaimg.cn
127.0.0.1 d6.sinaimg.cn
127.0.0.1 d7.sinaimg.cn
127.0.0.1 d8.sinaimg.cn

#QQ浏览器04.01
127.0.0.1 pgdt.gtimg.cn
127.0.0.1 report.url.cn
127.0.0.1 static.res.qq.com
#127.0.0.1 119.29.29.29
127.0.0.1 othstr.beacon.qq.com
#127.0.0.1 urlsec.qq.com
#127.0.0.1 res.imtt.qq.com
127.0.0.1 qbdsp.html5.qq.com
127.0.0.1 kde.qq.com

#OPPO22.04.01
127.0.0.1 epoch-cn.cdo.heytapmobi.com
#知乎
#127.0.0.1 zhihu-pics-upload.zhimg.com
#127.0.0.1 upload-oss.vzuu.com
#127.0.0.1 pic1.zhimg.com
#127.0.0.1 pic2.zhimg.com
#127.0.0.1 pic3.zhimg.com
#127.0.0.1 pic4.zhimg.com
#127.0.0.1 pic5.zhimg.com
#127.0.0.1 vdn.vzuu.com
#127.0.0.1 vdn1.vzuu.com
#127.0.0.1 vdn2.vzuu.com
#127.0.0.1 mqtt.zhihu.com
#127.0.0.1 mqtt-app.zhihu.com
#127.0.0.1 log1.cmpassport.com
#127.0.0.1 appcloud2.zhihu.com
#127.0.0.1 api.zhihu.com
#127.0.0.1 appcloud.zhihu.com
127.0.0.1 crash2.zhihu.com
#127.0.0.1 ipv6.shuzilm.cn

#pornhub 22.04.03
127.0.0.1 static.trafficjunky.com
127.0.0.1 media.trafficjunky.net
127.0.0.1 etahub.com
#127.0.0.1 www.pornhub.com
127.0.0.1 hubt.pornhub.com
127.0.0.1 evtubescms.phncdn.com
127.0.0.1 galaxymedia.xyz

#22.04.04
#127.0.0.1 certs.godaddy.com
#127.0.0.1 crl.godaddy.com
#127.0.0.1 certificates.godaddy.com
#127.0.0.1 ocsp.godaddy.com

#22.04.04
#127.0.0.1 u.jd.com
#127.0.0.1 3gimg.qq.com
#蓝奏云
127.0.0.1 statics.woozooo.com
127.0.0.1 analytics.woozooo.com
127.0.0.1 crbug.com
127.0.0.1 wer.qdwght.com
127.0.0.1 hm.woozooo.com

#清明节22.04.05
127.0.0.1 advsdkreport-def.tt.cn
127.0.0.1 gdfp.gifshow.com
127.0.0.1 sdk-link.tt.cn
127.0.0.1 mp.cmllw.iego.net
#127.0.0.1 log-sdk.ksapisrv.com

#22.04.07
#127.0.0.1 cdn.ynuf.aliapp.org
127.0.0.1 9308935.com
#127.0.0.1 wappass.baidu.com

#22.4.14
127.0.0.1 tnc3-alisc1.snssdk.com

#22.04.18
#httpsdns
127.0.0.1 httpdns.alicdn.com
127.0.0.1 httpdns.n.netease.com
127.0.0.1 httpdns.netease.com
127.0.0.1 httpdns.qq.com
127.0.0.1 httpdns.qqcdn.com

#其他
127.0.0.1 tnc3-aliec2.snssdk.com
127.0.0.1 open.kwaizt.com
127.0.0.1 raddus.bayescom.com

#22.04.22MIUI安装包管理器
127.0.0.1 preview-api.installer.xiaomi.com
127.0.0.1 api.installer.xiaomi.com

#22.04.23
127.0.0.1 adash.man.aliyuncs.com
#127.0.0.1 sf3-cdn-tos.toutiaostatic.com
#127.0.0.1 dig.bdurl.net
#127.0.0.1 dig.zjurl.cn
#网页劫持
127.0.0.1 wtrwx.top

#22.04.24
#网页劫持
127.0.0.1 zuwnq.cn
127.0.0.1 pre-mpnewyear.uc.cn
127.0.0.1 xn--pan-eixe.xn--baidu-jm6h.com
127.0.0.1 n--pan-eixe.xn--baidu-jm6h.com
127.0.0.1 hm.baidu.com
127.0.0.1 unet.ucweb.com
#127.0.0.1 ucweb.com
127.0.0.1 download.uc.cn
#127.0.0.1 image.uc.cn
#127.0.0.1 g.alicdn.com
#色情直播
127.0.0.1 aibanka.cnibk.com
127.0.0.1 ccwq.cc
127.0.0.1 hflalffajhf.top
#其他
127.0.0.1 mydisplay.ctfile.com

#22.04.25
#百度云升级
127.0.0.1 update.baidu.com
#腾讯视频
#127.0.0.1 dldir1.qq.com
#127.0.0.1 pingmid.qq.com

#22.04.30
#127.0.0.1 wx2.sinaimg.cn

##22.05.02
#哔哩哔哩
#127.0.0.1 gxb.mmstat.com
127.0.0.1 g.cn.miaozhen.com
127.0.0.1 e.cn.miaozhen.com

#22.05.03
#哔哩哔哩
#127.0.0.1 mm1.365dmp.com
#127.0.0.1 mm3.365dmp.com
#127.0.0.1 mall.bilibili.com
#127.0.0.1 i2.hdslb.com
#127.0.0.1 i0.hdslb.com
#127.0.0.1 i1.hdslb.com
#127.0.0.1 dl.hdslb.com
#127.0.0.1 upos-sz-static.bilivideo.com
#127.0.0.1 upos-sz-mirrorcos.bilivideo.com
#127.0.0.1 upos-sz-mirrorhwo1.bilivideo.com
127.0.0.1 xyqh5.163.com

#22.05.06
#京东商城广告
127.0.0.1 cdn.appads.com
127.0.0.1 bdsp.x.jd.com
127.0.0.1 cm.jd.com
127.0.0.1 gia.jd.com
127.0.0.1 u.x.jd.com
127.0.0.1 wn.x.jd.com
127.0.0.1 x.jd.com
#必应
127.0.0.1 telemetry.appex.bing.net
#金立手机广告
127.0.0.1 ads.gionee.com
127.0.0.1 pdl.gionee.com
127.0.0.1 adres.myaora.net
#联想手机广告
127.0.0.1 adcore.lenovomm.com
127.0.0.1 pushapi.lenovomm.com
127.0.0.1 susapi.lenovomm.com
127.0.0.1 adapi.lenovogame.com
127.0.0.1 lcs.dev.surepush.cn
127.0.0.1 susapi.dev.surepush.cn
127.0.0.1 test.surepush.cn
127.0.0.1 ad.gtbrowser.com
#魔趣广告
127.0.0.1 stats.mokeedev.com
#oppo广告
127.0.0.1 adsfs.oppomobile.com
127.0.0.1 adx.ads.oppomobile.com
127.0.0.1 bdapi.ads.oppomobile.com
127.0.0.1 data.ads.oppomobile.com
127.0.0.1 httpdns.push.oppomobile.com
127.0.0.1 sms.ads.oppomobile.com
#魅族广告
127.0.0.1 api-flow.flyme.cn
127.0.0.1 bro.flyme.cn
127.0.0.1 t-e.flyme.cn
127.0.0.1 t-flow.flyme.cn
127.0.0.1 api-game.meizu.com
127.0.0.1 game.res.meizu.com
127.0.0.1 game-res.meizu.com
127.0.0.1 umid.orion.meizu.com
127.0.0.1 uxip.meizu.com
127.0.0.1 api-push.meizu.com
127.0.0.1 push.res.meizu.com
#京东
127.0.0.1 adnewnc.app.autohome.com.cn
#apkpure
127.0.0.1 disqusads.com

#22.05.07
#小米应用商店
#主题壁纸
127.0.0.1 lite.a.market.xiaomi.com
127.0.0.1 site.e.mi.com
#豆瓣
127.0.0.1 erebor.douban.com
127.0.0.1 adsmind.ugdtimg.com
127.0.0.1 c2.gdt.qq.com
127.0.0.1 h5.gdt.qq.com
#腾讯
127.0.0.1 bricks.e.qq.com
127.0.0.1 test.bricks.e.qq.com
#127.0.0.1 aq.qq.com
127.0.0.1 oth.eve.mdt.qq.com
#微博
127.0.0.1 api.mapps.uve.weibo.com
127.0.0.1 down.apps.sina.cn
127.0.0.1 pkg.sinaimg.cn

##22.05.11
#禁漫天堂
127.0.0.1 www.googletagmanager.com
#22.05.12
#字节跳动
#127.0.0.1 lf3-cdn-tos.bytegoofy.com
#127.0.0.1 lf1-cdn-tos.bytescm.com

#22.05.13
#腾讯DNS
#127.0.0.1 dns.weixin.qq.com.cn
#MIUI 云控
#127.0.0.1 rom.pt.miui.srv
#127.0.0.1 jupiter.rus.sys.miui.com
#127.0.0.1 jupiter.intl.sys.miui.com
#127.0.0.1 jupiter.india.sys.miui.com
#127.0.0.1 jupiter.sys.miui.com
#127.0.0.1 preview-jupiter.sys.miui.com
#127.0.0.1 preview-jupiter.rus.sys.miui.com
#127.0.0.1 preview-jupiter.intl.sys.miui.com
#127.0.0.1 preview-jupiter.india.sys.miui.com
#127.0.0.1 staging.tracking.miui.com
127.0.0.1 staging.sdkconfig.ad.xiaomi.srv
#127.0.0.1 tracking.miui.com
#127.0.0.1 tracking.intl.miui.com
#127.0.0.1 tracking.rus.miui.com
#127.0.0.1 tracking.india.miui.com
127.0.0.1 sdkconfig.ad.xiaomi.com
127.0.0.1 sdkconfig.ad.intl.xiaomi.com
127.0.0.1 sdkconfig.ad.india.xiaomi.com
127.0.0.1 sdkconfig.ad.rus.xiaomi.com

#22.05.17
#云打包(老榕树联盟)
127.0.0.1 static.ydbimg.com
127.0.0.1 www.yundabao.com

#22.05.20
#番茄小说
127.0.0.1 tnc3-alisc1.zijieapi.com
#127.0.0.1 mon.toutiaocloud.com
#127.0.0.1 mon.toutiao.com
127.0.0.1 frontier-toutiao.snssdk.com
127.0.0.1 pitaya.bytedance.com
127.0.0.1 apps.bytesfield.com
#127.0.0.1 ad.oceanengine.com
127.0.0.1 www.chengzijianzhan.com
127.0.0.1 tnc3-aliec2.zijieapi.com
127.0.0.1 s3a.pstatp.com
127.0.0.1 ad.zijieapi.com
#127.0.0.1 i.snssdk.com
#127.0.0.1 ib.snssdk.com
127.0.0.1 open.snssdk.com
#127.0.0.1 p3-orange.byteorge.com
#127.0.0.1 mon.snssdk.com
#127.0.0.1 api.snssdk.com
#127.0.0.1 pangolin.snssdk.com
#127.0.0.1 success.ctobsnssdk.com
#127.0.0.1 crash.snssdk.com
#127.0.0.1 dig.zjurl.cn
#127.0.0.1 dig.bdurl.net
#127.0.0.1 minigame5-normal-lq.zijieapi.com
#127.0.0.1 minigame5-normal-hl.zijieapi.com
#微信DNS
127.0.0.1 dns.weixin.qq.com.cn
127.0.0.1 dns.weixin.qq.com
127.0.0.1 dns.weixin.qq.cn
#apps分享
127.0.0.1 amdcopen.m.taobao.com
#127.0.0.1 edu-image.nosdn.127.net
#22.05.21
127.0.0.1 vali-g1.cp31.ott.cibntv.net
127.0.0.1 valipl.cp31.ott.cibntv.net
127.0.0.1 www.qchannel01.cn
127.0.0.1 b.qchannel03.cn
127.0.0.1 zconfig.alibabausercontent.com
127.0.0.1 sgj1.zmj22.top

#22.05.24
#127.0.0.1 playlog.youku.com
127.0.0.1 ems.youku.com

#22.05.25
#番茄小说
127.0.0.1 security-lq.snssdk.com
127.0.0.1 security-hl.snssdk.com
#127.0.0.1 vcs-lq.snssdk.com
#127.0.0.1 vcs-hl.snssdk.com

#22.05.26
#https://rapidtai.com
127.0.0.1 v1cdn.snmovie.com
127.0.0.1 syzbh66.xyz
#微软搜索？为什么？
#127.0.0.1 f99.gdsoq.com

#22.05.27
127.0.0.1 dragate-cn.dc.heytapmobi.com
127.0.0.1 support.browser.heytapmobi.com

#22.06.01
#全媒体广告
127.0.0.1 yx.wucheshu.top
127.0.0.1 pyqqx.dcbxnc.cn

#22.06.03
127.0.0.1 adsrich.qq.com
#127.0.0.1 oimsgad.qq.com
#豆瓣
127.0.0.1 img1.360buyimg.com
127.0.0.1 qnmob3.doubanio.com
#127.0.0.1 img9.doubanio.com
#127.0.0.1 img1.doubanio.com
#127.0.0.1 img3.doubanio.com
#127.0.0.1 erebor.douban.com

#22.06.04
#spotify
127.0.0.1 adeventtracker.spotify.com
#22.06.10
127.0.0.1 23986834.com
#MIUI浏览器
127.0.0.1 browser.sentry-cdn.com
127.0.0.1 security.browser.miui.com
127.0.0.1 httpdns.browser.miui.com
#127.0.0.1 activity.browser.intl.miui.com

#22.06.13
#UC浏览器
127.0.0.1 ahn.jiankang123.net
#127.0.0.1 dns.alidns.com
#127.0.0.1 vs3.gzct.u3.ucweb.com
127.0.0.1 ucdc-upaas.uc.cn
127.0.0.1 hcadv.video.ums.uc.cn
#127.0.0.1 pssn.alicdn.com
#127.0.0.1 gzct.u3.ucweb.com

#22.06.17
#穿山甲
127.0.0.1 sf6-fe-tos.pglstatp-toutiao.com
#22.06.18
#百度贴吧
#127.0.0.1 group.wejianzhan.com
127.0.0.1 static.yximgs.com
#127.0.0.1 duzhanread.cdn.bcebos.com
#127.0.0.1 opencdntbvideo.jomodns.com
#127.0.0.1 opencdnbaidutbpic.jomodns.com
#127.0.0.1 opencdnbdsimage.jomodns.com
#127.0.0.1 wjz.e.shifen.com
#127.0.0.1 bdbus-turbonet.baidu.com
#127.0.0.1 group.wejianzhan.com
#127.0.0.1 cd.xdplt.com
#酷安
#127.0.0.1 i1.hdslb.com
#127.0.0.1 hcdnw.bili.c.cdnhwc2.com
#微信
#127.0.0.1 socwxsns.video.qq.com
#127.0.0.1 vweixinthumb.tc.qq.com
#127.0.0.1 forwardtmp.weixin.qq.com
#127.0.0.1 forwardwx.weixin.qq.com
#127.0.0.1 res.wx.qq.com.sched.legopic1.tdnsv6.com
#魅族
127.0.0.1 uxip-res.meizu.com
#22.06.24
127.0.0.1 open.e.kuaishou.cn
127.0.0.1 multi-az-ad.kuaishou.cn

#22.06.28
#WPS
127.0.0.1 update.wps.cn
#百度网盘
127.0.0.1 update.pan.baidu.com
#华为更新
127.0.0.1 update.dbankcdn.com

#22.06.30
#网易云
127.0.0.1 d1.music.126.net
127.0.0.1 admusicpic.music.126.net
127.0.0.1 iadmusicpic.music.126.net
127.0.0.1 iadmusicmatvideo.music.126.net
127.0.0.1 admusicmatvideo.music.126.net
#127.0.0.1 interface.music.163.com
127.0.0.1 iadmusicmat.music.126.net
#小米应用商店
#127.0.0.1 api.ad.xiaomi.com
#127.0.0.1 www.api.ad.intl.xiaomi.com
#127.0.0.1 www.api.ad.xiaomi.com

#22.07.02
#OPPO
127.0.0.1 api.open.oppomobile.com
127.0.0.1 api.e.kuaishou.com
127.0.0.1 api2.e.kuaishou.com
127.0.0.1 open.e.kuaishou.com
127.0.0.1 ad.partner.gifshow.com

#22.07.27
127.0.0.1 ad-static-xg.tagtic.cn
#MIUI更新弹窗
127.0.0.1 api.developer.xiaomi.com
#22.08.18
#字节跳动
127.0.0.1 ads.zijieapi.com
127.0.0.1 ad.zijieapi.com
#22.08.27
127.0.0.1 pgdt.gtimg.cn
#127.0.0.1 tnc3-bjlgy.zijieapi.com

#22.08.30
#樱花动漫
127.0.0.1 jipinyouwu.com
127.0.0.1 stgowan.com
127.0.0.1 pc.stgowan.com
127.0.0.1 pc.jipinyouwu.com

#22.09.22
127.0.0.1 adse.ximalaya.com
127.0.0.1 xdcs-collectorhera.ximalaya.com
127.0.0.1 gslbali.ximalaya.com
127.0.0.1 mktsound.cos.tx.xmcdn.com
127.0.0.1 adcos.adxmly.com
127.0.0.1 appmarket.api.gsxnj.cn
#127.0.0.1 gsxnj.cn

#22.09.28
#番茄小说
127.0.0.1 tnc3-alisc1.bytedance.com
127.0.0.1 tnc3-alisc2.bytedance.com
127.0.0.1 tnc3-alisc1.zijieapi.com
127.0.0.1 tnc3-alisc2.zijieapi.com
127.0.0.1 tnc3-alisc1.snssdk.com
127.0.0.1 tnc3-alisc2.snssdk.com
127.0.0.1 tnc3-bjlgy.bytedance.com
127.0.0.1 tnc3-bjlgy.zijieapi.com
127.0.0.1 tnc3-bjlgy.snssdk.com
127.0.0.1 ad-monitor.sh9130.com

#22.09.29
#番茄小说
#来自酷安大佬
#已禁用，会影响广告奖励获得
#127.0.0.1 vcs.zijieapi.com


#谷歌翻译
180.163.151.162 translate.googleapis.com
203.208.40.66 translate.googleapis.com
203.208.40.66 translate.google.com


key
test -f "${file}" && echo -e "创建文件${file}成功！"
}



function SETUPS_TEXT_reward1_FILE(){
local file="`pwd`/configure/广告奖励.prop"
cat << "key" > ${file}
adsmind.gdtimg.com
c.gdt.qq.com
d.gdt.qq.com
gw.365you.com
i.gdt.qq.com
ii.gdt.qq.com
ipv4.gdt.qq.com
m.gdt.qq.com
mi.gdt.qq.com
nc.gdt.qq.com
pv.sohu.com
q.i.gdt.qq.com
rm.gdt.qq.com
rpt.gdt.qq.com
v.gdt.qq.com
vr.gdt.qq.com
x.adnet.qq.com
pgdt.ugdtimg.com
xc.gdt.qq.com
v2.gdt.qq.com
sdk.e.qq.com
t.gdt.qq.com
#QQ广告奖励
win.gdt.qq.com
#抖音广告奖励
#is.snssdk.com
#微信广告奖励
#wxsnsad.tc.qq.com
#wxsnsdy.tc.qq.com
#wxsnsdy.video.qq.com
#wxsnsdy.wxs.qq.com
#wxsnsdythumb.wxs.qq.com
#百度云视频广告奖励
#nadvideo.baidu.com
#nadvideo2.baidu.com
#快手支持
#删掉会使得部分开屏广告复燃
open.e.kuaishou.com
e.kuaishou.com
api2.e.kuaishou.com
api.e.kuaishou.com
#APP分享
#注释掉可获得广告奖励
#但是也会有部广告重新出现，毕竟穿山甲是目前最恶心的广告联盟
log-api.pangolin-sdk-toutiao-b.com
log-api.pangolin-sdk-toutiao.com
api-access.pangolin-sdk-toutiao.com
api-access.pangolin-sdk-toutiao-b.com
key
test -f "${file}" && echo -e "创建文件${file}成功！"
}

function SETUPS_TEXT_reward2_FILE(){
local file="`pwd`/configure/保留奖励.prop"
cat << "key" > ${file}
adsmind.gdtimg.com
c.gdt.qq.com
d.gdt.qq.com
gw.365you.com
i.gdt.qq.com
ii.gdt.qq.com
ipv4.gdt.qq.com
m.gdt.qq.com
mi.gdt.qq.com
nc.gdt.qq.com
pv.sohu.com
q.i.gdt.qq.com
rm.gdt.qq.com
rpt.gdt.qq.com
v.gdt.qq.com
vr.gdt.qq.com
x.adnet.qq.com
pgdt.ugdtimg.com
xc.gdt.qq.com
v2.gdt.qq.com
sdk.e.qq.com
t.gdt.qq.com
#QQ广告奖励
win.gdt.qq.com
#抖音广告奖励
#is.snssdk.com
#微信广告奖励
wxsnsad.tc.qq.com
wxsnsdy.tc.qq.com
wxsnsdy.video.qq.com
wxsnsdy.wxs.qq.com
wxsnsdythumb.wxs.qq.com
#百度云视频广告奖励
nadvideo.baidu.com
nadvideo2.baidu.com
#快手支持
#删掉会使得部分开屏广告复燃
open.e.kuaishou.com
e.kuaishou.com
api2.e.kuaishou.com
api.e.kuaishou.com
#APP分享
#注释掉可获得广告奖励
#但是也会有部广告重新出现，毕竟穿山甲是目前最恶心的广告联盟
log-api.pangolin-sdk-toutiao-b.com
log-api.pangolin-sdk-toutiao.com
api-access.pangolin-sdk-toutiao.com
api-access.pangolin-sdk-toutiao-b.com
key
test -f "${file}" && echo -e "创建文件${file}成功！"
}

function SETUPS_TEXT_exclude_FILE(){
local file="`pwd`/configure/排除列表.prop"
cat << "key" > ${file}
#host屏蔽的域名
#X5内核
^127.0.0.1[[:space:]]cfg.imtt.qq.com$
^127.0.0.1[[:space:]]soft.tbs.imtt.qq.com$
^127.0.0.1[[:space:]]res.imtt.qq.com$
#手机搜狗输入法
^127.0.0.1[[:space:]]shouji.sougou.com$
#MIUI 流量中心
^127.0.0.1[[:space:]]api.miui.security.xiaomi.com$
^127.0.0.1[[:space:]]api.sec.intl.miui.com$
^127.0.0.1[[:space:]]api.sec.miui.com$
#QQ直播
^127.0.0.1[[:space:]]livew.l.qq.com$
#魅族
^127.0.0.1[[:space:]]aider.meizu.com$
^127.0.0.1[[:space:]]www.meizu.com$
^127.0.0.1[[:space:]]store.meizu.com$
#魅族天气
^127.0.0.1[[:space:]]aider-res.meizu.com$
#爱奇艺、腾讯视频
#^127.0.0.1[[:space:]]mdevstat.qqlive.qq.com$
#^127.0.0.1[[:space:]]t7z.cupid.iqiyi.com$
#抖音小程序、今日头条搜索
^127.0.0.1[[:space:]]is.snssdk.com$
#QQ邮箱
^127.0.0.1[[:space:]]iwx.mail.qq.com$
#腾讯活动
^127.0.0.1[[:space:]]aegis.qq.com$
^127.0.0.1[[:space:]]ios.bugly.qq.com$
^127.0.0.1[[:space:]]img.ssl.msdk.qq.com$
#QQ微信小(程序)游戏
^127.0.0.1[[:space:]]game.weixin.qq.com$
#^127.0.0.1[[:space:]]dir.minigame.qq.com$
#^127.0.0.1[[:space:]]game.html5.qq.com$
#^127.0.0.1[[:space:]]user1.game.qq.com$
#MIUI 天气预报
^127.0.0.1[[:space:]]wtradv.market.xiaomi.com$
#推特(第三方调用)
^127.0.0.1[[:space:]]api.twitter.com$
^127.0.0.1[[:space:]]mobile.twitter.com$
^127.0.0.1[[:space:]]twitter.com$
^127.0.0.1[[:space:]]www.twitter.com$
#MIUI 快应用
^127.0.0.1[[:space:]]www.api.hybrid.intl.xiaomi.com$
^127.0.0.1[[:space:]]api.hybrid.intl.xiaomi.com$
#网易某版本
^127.0.0.1[[:space:]]api.iplay.163.com$
#九游游戏中心
^127.0.0.1[[:space:]]api.open.uc.cn$
#百度小程序
^127.0.0.1[[:space:]]ossapi.baidu.com$
#UC文章
^127.0.0.1[[:space:]]mparticle.uc.cn$
#微信福利/活动中心
^127.0.0.1[[:space:]]isee.weishi.qq.com$
#京东图片api
^127.0.0.1[[:space:]]img14.360buyimg.com$
#腾讯充值
^127.0.0.1[[:space:]]midas.gtimg.cn$
^127.0.0.1[[:space:]]api.unipay.qq.com$
#皮皮虾/字节跳动
^127.0.0.1[[:space:]]mon.snssdk.com$
^127.0.0.1[[:space:]]mon.isnssdk.com$
^127.0.0.1[[:space:]]dig.bdurl.net$
^127.0.0.1[[:space:]]is-hl.snssdk.com$
^127.0.0.1[[:space:]]p.*[[:digit:]]-ppx.byteimg.com$
^127.0.0.1[[:space:]]dig.zjurl.cn$
^127.0.0.1[[:space:]]i.snssdk.com$
#^127.0.0.1[[:space:]]sf3-ttcdn-tos.pstatp.com$
^127.0.0.1[[:space:]]dm.toutiao.com$
#应用宝
^127.0.0.1[[:space:]]pp.myapp.com$
#淘宝授权
^127.0.0.1[[:space:]]acs4baichuan.m.taobao.com$
#淘宝活动
^127.0.0.1[[:space:]]s.click.taobao.com$
^127.0.0.1[[:space:]]s.click.alimama.com$
^127.0.0.1[[:space:]]s.click.tmall.com$
#pornhub
^127.0.0.1[[:space:]]ss.phncdn.com$
^127.0.0.1[[:space:]]ei.phncdn.com$
^127.0.0.1[[:space:]]dm1.phncdn.com$
^127.0.0.1[[:space:]]di.phncdn.com$
^127.0.0.1[[:space:]]cdn1d-static-shared.phncdn.com$
^127.0.0.1[[:space:]]cdn1-smallimg.phncdn.com$
^127.0.0.1[[:space:]]cn.pornhub.com$
^127.0.0.1[[:space:]]www.pornhub.com$

#知乎小程序
^127.0.0.1[[:space:]]sugar.zhihu.com$
#支付宝生活号
^127.0.0.1[[:space:]]gm.mmstat.com$
#支付宝扫码支付
^127.0.0.1[[:space:]]pingjs.qq.com$
#支付宝运动
^127.0.0.1[[:space:]]wgo.mmstat.com$
#迅雷影音api
^127.0.0.1[[:space:]]api-shoulei-ssl.xunlei.com$
#MIUI浏览器在线翻译
^127.0.0.1[[:space:]]ssl-cdn.static.browser.mi-img.com$
#MIUI浏览器关键词联想
#^127.0.0.1[[:space:]]activity.browser.intl.miui.com$
#^127.0.0.1[[:space:]]reader.browser.miui.com$
#X5内核文档插件下载
^127.0.0.1[[:space:]]static.res.qq.com$
#MIUI天星金融钱包
^127.0.0.1[[:space:]]api.jr.mi.com$
#豌豆荚网络下载
^127.0.0.1[[:space:]]alissl.ucdl.pp.uc.cn$
#微博国际版图片保存
^127.0.0.1[[:space:]]wx2.sinaimg.cn$
#百度百科
^127.0.0.1[[:space:]]baikebcs.bdimg.com$
^127.0.0.1[[:space:]]bkimg.cdn.bcebos.com$
#QQ安全网址访问
^127.0.0.1[[:space:]]c.pc.qq.com$
#cdn加速
^127.0.0.1[[:space:]]cdn.bootcdn.net$
#未知的白名单
#^127.0.0.1[[:space:]]rpc-php.trafficfactory.biz$
#^127.0.0.1[[:space:]]adv.sec.miui.com$
#^127.0.0.1[[:space:]]data.mistat.xiaomi.com$
#^127.0.0.1[[:space:]]adash.man.aliyuncs.com$
#微信广告政策
^127.0.0.1[[:space:]]ads.privacy.qq.com$
#百度求医问药网
^127.0.0.1[[:space:]]med-fe.cdn.bcebos.com$
#微信部分小程序登陆
^127.0.0.1[[:space:]]pv.sohu.com$
#百度百家号
^127.0.0.1[[:space:]]f10.baidu.com$
#MIUI 主题
^127.0.0.1[[:space:]]zhuti.xiaomi.com$
#爱(i)茅台
^127.0.0.1[[:space:]]mm1.365dmp.com$
^127.0.0.1[[:space:]]mm3.365dmp.com$
^127.0.0.1[[:space:]]sfp.safe.baidu.com$
^127.0.0.1[[:space:]]sofire.bdstatic.com$
^127.0.0.1[[:space:]]sofire.baidu.com$
#MIUI浏览器
^127.0.0.1[[:space:]]hot.browser.intl.miui.com$
^127.0.0.1[[:space:]]hot.browser.miui.com$
#360清理大师
^127.0.0.1[[:space:]]sjws.ssl.qihucdn.com$
^127.0.0.1[[:space:]]mvconf.f.360.cn$
#腾讯新闻
#^127.0.0.1[[:space:]]news.l.qq.com$
#^127.0.0.1[[:space:]]xw.qq.com$
^127.0.0.1[[:space:]]pacaio.match.qq.com$
#^127.0.0.1[[:space:]]news.ssp.qq.com$
#UC浏览器
^127.0.0.1[[:space:]]emoji.uc.cn$
#^127.0.0.1[[:space:]]m.uczzd.cn$
^127.0.0.1[[:space:]]iflow.uc.cn$
^127.0.0.1[[:space:]]iflow-api.uc.cn$
^127.0.0.1[[:space:]]iflow.uczzd.cn$
#夸克浏览器下载插件
^127.0.0.1[[:space:]]pdds-c1-cdn.uc.cn$
^127.0.0.1[[:space:]]pdds.ucweb.com$
#DNS服务器
^127.0.0.1[[:space:]]dns9.quad9.net$
^127.0.0.1[[:space:]]dns.cloudflare.com$
^127.0.0.1[[:space:]]dns.rubyfish.cn$
^127.0.0.1[[:space:]]1dot1dot1dot1.cloudflare-dns.com$
^127.0.0.1[[:space:]]dns.alidns.com$
^127.0.0.1[[:space:]]dns.google.com$
#腾讯追踪
#^127.0.0.1[[:space:]]btrace.qq.com$
#^127.0.0.1[[:space:]]h.trace.qq.com$
#淘宝菜鸟裹裹
#^127.0.0.1[[:space:]]zconfig.alibabausercontent.com$
#^127.0.0.1[[:space:]]sjarvis.taobao.com$
^127.0.0.1[[:space:]]appdownload.alicdn.com$
#QQ微信头像
^127.0.0.1[[:space:]]wx.qlogo.cn$
^127.0.0.1[[:space:]]py.qlogo.cn$
^127.0.0.1[[:space:]]py2.qlogo.cn$
^127.0.0.1[[:space:]]p.qlogo.cn$
#抖音网页版验证图片
^127.0.0.1[[:space:]]verify.snssdk.com$
#小米隐私收集
^127.0.0.1[[:space:]]data\.mistat\..*xiaomi.com$
^127.0.0.1[[:space:]]www\.data\.mistat\..*xiaomi.com$
^127.0.0.1[[:space:]]o.data.mistat.xiaomi.com$
#QQ安全中心
^127.0.0.1[[:space:]]aq.qq.com$
#QQ头像
#^127.0.0.1[[:space:]]pgdt.gtimg.cn$
#美团外卖
#^127.0.0.1[[:space:]]pingma.qq.com$
#小米隐私收集(为了省电，所以排除)
^127.0.0.1[[:space:]]tracking\..*miui\.com$
^127.0.0.1[[:space:]]www\.tracking\..*miui\.com$
#小米广告配置文件
^127.0.0.1[[:space:]]sdkconfig\.ad.*\.xiaomi\.com$
^127.0.0.1[[:space:]]www\.sdkconfig\.ad.*\.xiaomi\.com$
#MIUI手机管家
^127.0.0.1[[:space:]]data\.sec.*\.miui\.com$
^127.0.0.1[[:space:]]www\.data\.sec.*\.miui\.com$
#小米文件下载
^127.0.0.1[[:space:]]api.airpush.com$
^127.0.0.1[[:space:]]file.xmpush.xiaomi.com$
^127.0.0.1[[:space:]]api.airpush.com$
^127.0.0.1[[:space:]]api-push.meizu.com$
^127.0.0.1[[:space:]]file.xiaomi.com$
^127.0.0.1[[:space:]]f8.market.xiaomi.com$
^127.0.0.1[[:space:]]f4.market.xiaomi.com$
#MIUI黄页
^127.0.0.1[[:space:]]api.huangye.miui.com$
#MIUI垃圾清理
^127.0.0.1[[:space:]]flash.sec.miui.com$
^127.0.0.1[[:space:]]flash.sec.intl.miui.com$
^127.0.0.1[[:space:]]staging.flash.sec.miui.com$
#小爱同学个人信息获取
^127.0.0.1[[:space:]]tracker.ai.xiaomi.com$
#小米主题设计师注册
^127.0.0.1[[:space:]]market.xiaomi.com$
#百度贴吧表情误杀

^127.0.0.1[[:space:]]static.tieba.baidu.com$




#放到iptables屏蔽的域名
^[0-9].*\.fls.doubleclick
\.302br\.net$
^[0-9].*\.api.swrve.com
^[0-9].*\.eu-api.swrve.com
\.adj\.st$
\.live\.api\.drift\.com$
\.chat\.api\.drift\.com$
\.analytics\.mobilegamestats\.com$
\.sprout-ad\.com
\.log\.optimizely\.com$
\.v\.admaster\.com\.cn$
\.ads\.tremorhub\.com$
\.ad\.corp\.appnexus\.com$
\.api-05\.com$
\.log\.xoalt\.com$
\.api\.splkmobile\.com$
\.api\.botman\.ninja$
\.api\.5rocks\.io$
\.api\.pushwoosh\.com$
\.c\.admaster\.com\.cn$
xvideos.*cdn
p[[:digit:]].*[[:digit:]]\.ahcdn\.com$
.*net\.zooplus\.[[:alpha:]].*[[:alpha:]]$
#.*net\.zooplus\.com$
#.*net\.zooplus\.it$
#.*net\.zooplus\.nl$
#ad.*[[:digit:]]m.adk2.co$
fra.*[[:digit:]].ib.adnxs.com$
bank.*[[:digit:]].*mp.mydas.mobi$
www\.[[:alpha:]].*[[:alpha:]].*\.top$
key
test -f "${file}" && echo -e "创建文件${file}成功！"
}


function SETUPS_TEXT_meizu_FILE(){
local file="`pwd`/configure/魅族.conf"
cat << "key" > ${file}
127.0.0.1 api-flow.flyme.cn
127.0.0.1 bro.flyme.cn
127.0.0.1 es-res.flyme.cn
127.0.0.1 madx.flyme.cn
127.0.0.1 ssp-res.flyme.cn
127.0.0.1 t-e.flyme.cn
127.0.0.1 t-flow.flyme.cn
127.0.0.1 aider-res.meizu.com
127.0.0.1 api-flow.meizu.com
127.0.0.1 api-push.meizu.com
127.0.0.1 cal.meizu.com
127.0.0.1 ebook-res.meizu.com
127.0.0.1 ebook.res.meizu.com
127.0.0.1 game-res.meizu.com
127.0.0.1 game.res.meizu.com
127.0.0.1 infocenter.meizu.com
127.0.0.1 open-iflow.meizu.com
127.0.0.1 openapi-news.meizu.com
127.0.0.1 push.res.meizu.com
127.0.0.1 reader.meizu.com
127.0.0.1 reader.res.meizu.com
127.0.0.1 safe.res.meizu.com
127.0.0.1 tongji-res1.meizu.com
127.0.0.1 tongji.meizu.com
127.0.0.1 umid.orion.meizu.com
127.0.0.1 upush.res.meizu.com
127.0.0.1 uxip.meizu.com
127.0.0.1 mz-api.smzdm.com
key
test -f "${file}" && echo -e "创建文件${file}成功！"
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
127.0.0.1 p$i-ad-sign.byteimg.com
127.0.0.1 vs$i.bj2cm.u3.ucweb.com
127.0.0.1 vs$i.bj2cu.u3.ucweb.com
127.0.0.1 vs$i.bj2ct.u3.ucweb.com
127.0.0.1 vs$i.gzct.u3.ucweb.com
127.0.0.1 vs$i.gzcu.u3.ucweb.com
127.0.0.1 vs$i.gzcm.u3.ucweb.com
127.0.0.1 ads$i-normal-lq.zijieapi.com
127.0.0.1 ads$i-normal-lf.zijieapi.com
127.0.0.1 ads$i-normal-hl.zijieapi.com
127.0.0.1 ads$i-normal.zijieapi.com
127.0.0.1 p$i-orange.byteorge.com
127.0.0.1 lf$i-common-ckv-tos.pstatp.com
127.0.0.1 v$i-ad.ixigua.com
127.0.0.1 xn--pan-ei"$i"e.xn--baidu-jm6h.com
" >> "${file}"
done

#蓝奏云拦截域名
for i in s d z ;do
cat <<key >> "${file}"
127.0.0.1 lanzou$i.com
127.0.0.1 cbzhk.lanzou$i.com
127.0.0.1 wwa.lanzou$i.com
127.0.0.1 wws.lanzou$i.com
127.0.0.1 www.lanzou$i.com
127.0.0.1 wwe.lanzou$i.com
key
done
}


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
local hosts_list='
https://hblock.molinero.dev/hosts
https://raw.githubusercontent.com/E7KMbb/AD-hosts/master/system/etc/hosts
https://raw.githubusercontent.com/Goooler/1024_hosts/master/hosts
https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts
https://raw.githubusercontent.com/VeleSila/yhosts/master/hosts
https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts
https://hosts.oisd.nl/basic
https://neodev.team/lite_host
'
a=0
echo -e "\n※下载hosts中……"
for i in ${hosts_list}
do
	curl -k -L -o "${tmp_DIR}/$a" "${i}" >/dev/null 2>&1 && echo -e "※[ ${i} ] 下载成功！" || echo -e "[ $i ]下载失败！"
	hosts_original="$(cat ${tmp_DIR}/$a 2>/dev/null )"
	echo -e "${hosts_original}" >> "${file}"
	a="$(($a + 1))"
done 
test -f "${file}" && rm -rf "${tmp_DIR}"
test ! -f "${file}" && echo -e "${file} 不存在！！" && exit 1
}

function grep_value_file() {
local value="${2}"
local file="${3}"
local word="${1}"
test $word == 1 && word='-iw' || word='-i'
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
			sed -i "/$i/d" "${target}"
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
echo -e "$(cat $i 2>/dev/null )" >>"${output}"
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
}

function remove_ad() {
local file="$1"
local target="$2"
local local_host_file="$3"
test -f "${target}" && rm -rf "${target}"
cat "${file}" 2>/dev/null | sed '/^#/d;/^[[:space:]]*$/d' | while read host ;do
echo -e "127.0.0.1 $host" >> "$target"
done
cat <<key >> $local_host_file
#广告奖励
$(cat "$target" 2>/dev/null )
#END
key
}

#写入信息
function write_head() {
local target_file="${1}"
local total_count="$(cat ${target_file} 2>/dev/null | sed '/^#/d;/^[[:space:]]*$/d' | wc -l )"
sed -i "1i #@coolapk 1007" "${target_file}"
sed -i "2i #有问题可以在文件里搜索关键词" "${target_file}"
sed -i "3i #例如\"toutiao(头条)\"，\"MIUI xiaomi (小米)\"，\"reward(奖励)\"" "${target_file}"
sed -i "4i #在相应行的开头加个\"\#\"号" "${target_file}"
sed -i "5i #更新时间: $(date '+%F %T') " "${target_file}"
sed -i "6i 127.0.0.1 localhost" "${target_file}"
sed -i "7i ::1 localhost" "${target_file}"
sed -i "8i ::1 ip6-loopback" "${target_file}"
sed -i "9i ::1 ip6-localhost" "${target_file}"
sed -i "10i #规则数量:${total_count}" "${target_file}"
sed -i '11i ##################\n' "${target_file}"
}

function write_ad_block_reward_rules(){
file="${1}"
cat << "key" > "$file"

!爱奇艺腾讯视频网页版广告，删除了客户端没广告，网页就打不开。^
||t7z.cupid.iqiyi.com^
||mdevstat.qqlive.qq.com^

||adsmind.gdtimg.com^
||c.gdt.qq.com^
||d.gdt.qq.com^
||gw.365you.com^
||i.gdt.qq.com^
||ii.gdt.qq.com^
||ipv4.gdt.qq.com^
||m.gdt.qq.com^
||mi.gdt.qq.com^
||nc.gdt.qq.com^
||pv.sohu.com^
||q.i.gdt.qq.com^
||rm.gdt.qq.com^
||rpt.gdt.qq.com^
||v.gdt.qq.com^
||vr.gdt.qq.com^
||x.adnet.qq.com^
||pgdt.ugdtimg.com^
||xc.gdt.qq.com^
||v2.gdt.qq.com^
||sdk.e.qq.com^
||t.gdt.qq.com^
!QQ广告奖励^
||win.gdt.qq.com^
!抖音广告奖励^
!||is.snssdk.com^
!微信广告奖励^
!||wxsnsad.tc.qq.com^
!||wxsnsdy.tc.qq.com^
!||wxsnsdy.video.qq.com^
!||wxsnsdy.wxs.qq.com^
!||wxsnsdythumb.wxs.qq.com^
!百度云视频广告奖励^
!||nadvideo.baidu.com^
!||nadvideo2.baidu.com^
!快手支持^
!删掉会使得部分开屏广告复燃^
||open.e.kuaishou.com^
||e.kuaishou.com^
||api2.e.kuaishou.com^
||api.e.kuaishou.com^
!APP分享^
!注释掉可获得广告奖励^
!但是也会有部广告重新出现，毕竟穿山甲是目前最恶心的广告联盟^
||log-api.pangolin-sdk-toutiao-b.com^
||log-api.pangolin-sdk-toutiao.com^
||api-access.pangolin-sdk-toutiao.com^
||api-access.pangolin-sdk-toutiao-b.com^

key
}

function adblock() {
echo -e "[$(date +%y-%m-%d-%T)] ※制作Adblock规则……※\n"
local old_file="${1}"
local file="${old_file%/*}/adb.txt"
write_ad_block_reward_rules "${file}"
echo "$(cat $old_file )" >> "${file}"
if test -f "$file" ;then
	sed -i "s|^#|!|g" "$file"
	sed -i "/^::1/d" "$file"
	sed -i "s/127.0.0.1[[:space:]]localhost//g" "$file"
	sed -i "s/127.0.0.1 /||/g;s|$|^|g" "$file"
	sed -i "s/^\^//g" "$file"
	sed -i "1i [Host 10007]" "$file"
        sed -i "1i [Adblock Plus 2.0]" "$file"
        sed -i "2i ! Title: Host 10007" "$file"
        sed -i "3i ! Homepage: https://github.com/lingeringsound/10007_auto " "$file"
        sed -i "3i ! ZH_Homepage: https://www.gitlink.org.cn/keytoolazy/10007_auto " "$file"
        sed -i "4i ! Last modified: `date +'%F %T'`" "$file"
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
SETUPS_TEXT_custo_FILE
SETUPS_TEXT_exclude_FILE
SETUPS_TEXT_meizu_FILE
SETUPS_TEXT_reward1_FILE
SETUPS_TEXT_reward2_FILE
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
grep_value_file '1' '[[:alpha:]]ads' "${hosts_file}"
grep_value_file '1' '[[:alpha:]]cdn' "${hosts_file}"
grep_value_file '1' '[[:alpha:]]sdk' "${hosts_file}"
grep_value_file '1' '[[:digit:]]ad' "${hosts_file}"
grep_value_file '1' '[[:digit:]]ads' "${hosts_file}"
grep_value_file '1' 'ad' "${hosts_file}"
grep_value_file '1' 'ad.*cdn' "${hosts_file}"
grep_value_file '1' 'ad.*service' "${hosts_file}"
grep_value_file '1' 'ad.*services' "${hosts_file}"
grep_value_file '1' 'ad[[:alpha:]]' "${hosts_file}"
grep_value_file '1' 'ad[[:alpha:]][[:digit:]]' "${hosts_file}"
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
grep_value_file '1' 'ads[[:alpha:]][[:digit:]]' "${hosts_file}"
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
grep_value_file '1' 'qq' "${hosts_file}"
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
grep_value_file '1' 'top' "${hosts_file}"
grep_value_file '1' 'tos' "${hosts_file}"
grep_value_file '1' 'toutiao' "${hosts_file}"
grep_value_file '1' 'tpns' "${hosts_file}"
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
#统计
rm -rf `pwd`/result `pwd`/configure `pwd`/host
test -f `pwd`/reward && echo "文件大小 $( du -sh `pwd`/reward )，hosts数量: $(cat `pwd`/reward | wc -l ) "
test -f `pwd`/all && echo "文件大小 $( du -sh `pwd`/all )，hosts数量: $(cat `pwd`/all | wc -l ) "
test -f `pwd`/adb.txt && echo "文件大小 $( du -sh `pwd`/adb.txt )，hosts数量: $(cat `pwd`/adb.txt | wc -l ) "




