(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-user-order"],{"0099":function(e,t,n){"use strict";var i=n("b5f2"),r=n.n(i);r.a},"0cde":function(e,t,n){"use strict";n.r(t);var i=n("86bc"),r=n("5424");for(var a in r)"default"!==a&&function(e){n.d(t,e,(function(){return r[e]}))}(a);n("589d");var o,s=n("f0c5"),c=Object(s["a"])(r["default"],i["b"],i["c"],!1,null,"4a13060c",null,!1,i["a"],o);t["default"]=c.exports},"1b2b":function(e,t,n){var i=n("24fb");t=i(!1),t.push([e.i,'@charset "UTF-8";\r\n/**\r\n * 下方引入的为uView UI的集成样式文件，为scss预处理器，其中包含了一些"u-"开头的自定义变量\r\n * uView自定义的css类名和scss变量，均以"u-"开头，不会造成冲突，请放心使用 \r\n */.wrap[data-v-7e661ab4]{display:flex;flex-direction:column;height:calc(100vh - var(--window-top));width:100%}.swiper-box[data-v-7e661ab4]{flex:1}.swiper-item[data-v-7e661ab4]{height:100%}',""]),e.exports=t},"1ccd":function(e,t,n){"use strict";var i=n("3e6b"),r=n.n(i);r.a},"22ee":function(e,t,n){var i=n("a852");"string"===typeof i&&(i=[[e.i,i,""]]),i.locals&&(e.exports=i.locals);var r=n("4f06").default;r("71b5fc11",i,!0,{sourceMap:!1,shadowMode:!1})},"2e8a":function(e,t,n){n("c975"),n("ac1f"),n("466d"),n("5319"),n("1276");var i=n("9523");!function(t,n){e.exports=n(t)}(window,(function(e,t){function n(t,n,i){e.WeixinJSBridge?WeixinJSBridge.invoke(t,a(n),(function(e){s(t,e,i)})):d(t,i)}function r(t,n,i){e.WeixinJSBridge?WeixinJSBridge.on(t,(function(e){i&&i.trigger&&i.trigger(e),s(t,e,n)})):d(t,i||n)}function a(e){return(e=e||{}).appId=T.appId,e.verifyAppId=T.appId,e.verifySignType="sha1",e.verifyTimestamp=T.timestamp+"",e.verifyNonceStr=T.nonceStr,e.verifySignature=T.signature,e}function o(e){return{timeStamp:e.timestamp+"",nonceStr:e.nonceStr,package:e.package,paySign:e.paySign,signType:e.signType||"SHA1"}}function s(e,t,n){"openEnterpriseChat"==e&&(t.errCode=t.err_code),delete t.err_code,delete t.err_desc,delete t.err_detail;var i=t.errMsg;i||(i=t.err_msg,delete t.err_msg,i=function(e,t){var n=e,i=m[n];i&&(n=i);var r="ok";if(t){var a=t.indexOf(":");"confirm"==(r=t.substring(a+1))&&(r="ok"),"failed"==r&&(r="fail"),-1!=r.indexOf("failed_")&&(r=r.substring(7)),-1!=r.indexOf("fail_")&&(r=r.substring(5)),"access denied"!=(r=(r=r.replace(/_/g," ")).toLowerCase())&&"no permission to execute"!=r||(r="permission denied"),"config"==n&&"function not exist"==r&&(r="ok"),""==r&&(r="fail")}return n+":"+r}(e,i),t.errMsg=i),(n=n||{})._complete&&(n._complete(t),delete n._complete),i=t.errMsg||"",T.debug&&!n.isInnerInvoke&&alert(JSON.stringify(t));var r=i.indexOf(":");switch(i.substring(r+1)){case"ok":n.success&&n.success(t);break;case"cancel":n.cancel&&n.cancel(t);break;default:n.fail&&n.fail(t)}n.complete&&n.complete(t)}function c(e){if(e){for(var t=0,n=e.length;t<n;++t){var i=e[t],r=p[i];r&&(e[t]=r)}return e}}function d(e,t){if(!(!T.debug||t&&t.isInnerInvoke)){var n=m[e];n&&(e=n),t&&t._complete&&delete t._complete,console.log('"'+e+'",',t||"")}}function u(){return(new Date).getTime()}function l(t){b&&(e.WeixinJSBridge?t():v.addEventListener&&v.addEventListener("WeixinJSBridgeReady",t,!1))}if(!e.jWeixin){var f,p={config:"preVerifyJSAPI",onMenuShareTimeline:"menu:share:timeline",onMenuShareAppMessage:"menu:share:appmessage",onMenuShareQQ:"menu:share:qq",onMenuShareWeibo:"menu:share:weiboApp",onMenuShareQZone:"menu:share:QZone",previewImage:"imagePreview",getLocation:"geoLocation",openProductSpecificView:"openProductViewWithPid",addCard:"batchAddCard",openCard:"batchViewCard",chooseWXPay:"getBrandWCPayRequest",openEnterpriseRedPacket:"getRecevieBizHongBaoRequest",startSearchBeacons:"startMonitoringBeacons",stopSearchBeacons:"stopMonitoringBeacons",onSearchBeacons:"onBeaconsInRange",consumeAndShareCard:"consumedShareCard",openAddress:"editAddress"},m=function(){var e={};for(var t in p)e[p[t]]=t;return e}(),v=e.document,h=v.title,g=navigator.userAgent.toLowerCase(),w=navigator.platform.toLowerCase(),y=!(!w.match("mac")&&!w.match("win")),_=-1!=g.indexOf("wxdebugger"),b=-1!=g.indexOf("micromessenger"),S=-1!=g.indexOf("android"),I=-1!=g.indexOf("iphone")||-1!=g.indexOf("ipad"),C=($=g.match(/micromessenger\/(\d+\.\d+\.\d+)/)||g.match(/micromessenger\/(\d+\.\d+)/))?$[1]:"",x={initStartTime:u(),initEndTime:0,preVerifyStartTime:0,preVerifyEndTime:0},k={version:1,appId:"",initTime:0,preVerifyTime:0,networkType:"",isPreVerifyOk:1,systemType:I?1:S?2:-1,clientVersion:C,url:encodeURIComponent(location.href)},T={},L={_completes:[]},M={state:0,data:{}};l((function(){x.initEndTime=u()}));var P=!1,E=[],O=(f={config:function(t){d("config",T=t);var i=!1!==T.check;l((function(){if(i)n(p.config,{verifyJsApiList:c(T.jsApiList)},function(){L._complete=function(e){x.preVerifyEndTime=u(),M.state=1,M.data=e},L.success=function(e){k.isPreVerifyOk=0},L.fail=function(e){L._fail?L._fail(e):M.state=-1};var e=L._completes;return e.push((function(){!function(e){if(!(y||_||T.debug||C<"6.0.2"||k.systemType<0)){var t=new Image;k.appId=T.appId,k.initTime=x.initEndTime-x.initStartTime,k.preVerifyTime=x.preVerifyEndTime-x.preVerifyStartTime,O.getNetworkType({isInnerInvoke:!0,success:function(e){k.networkType=e.networkType;var n="https://open.weixin.qq.com/sdk/report?v="+k.version+"&o="+k.isPreVerifyOk+"&s="+k.systemType+"&c="+k.clientVersion+"&a="+k.appId+"&n="+k.networkType+"&i="+k.initTime+"&p="+k.preVerifyTime+"&u="+k.url;t.src=n}})}}()})),L.complete=function(t){for(var n=0,i=e.length;n<i;++n)e[n]();L._completes=[]},L}()),x.preVerifyStartTime=u();else{M.state=1;for(var e=L._completes,t=0,r=e.length;t<r;++t)e[t]();L._completes=[]}})),O.invoke||(O.invoke=function(t,n,i){e.WeixinJSBridge&&WeixinJSBridge.invoke(t,a(n),i)},O.on=function(t,n){e.WeixinJSBridge&&WeixinJSBridge.on(t,n)})},ready:function(e){0!=M.state?e():(L._completes.push(e),!b&&T.debug&&e())},error:function(e){C<"6.0.2"||(-1==M.state?e(M.data):L._fail=e)},checkJsApi:function(e){n("checkJsApi",{jsApiList:c(e.jsApiList)},(e._complete=function(e){if(S){var t=e.checkResult;t&&(e.checkResult=JSON.parse(t))}e=function(e){var t=e.checkResult;for(var n in t){var i=m[n];i&&(t[i]=t[n],delete t[n])}return e}(e)},e))},onMenuShareTimeline:function(e){r(p.onMenuShareTimeline,{complete:function(){n("shareTimeline",{title:e.title||h,desc:e.title||h,img_url:e.imgUrl||"",link:e.link||location.href,type:e.type||"link",data_url:e.dataUrl||""},e)}},e)},onMenuShareAppMessage:function(e){r(p.onMenuShareAppMessage,{complete:function(t){"favorite"===t.scene?n("sendAppMessage",{title:e.title||h,desc:e.desc||"",link:e.link||location.href,img_url:e.imgUrl||"",type:e.type||"link",data_url:e.dataUrl||""}):n("sendAppMessage",{title:e.title||h,desc:e.desc||"",link:e.link||location.href,img_url:e.imgUrl||"",type:e.type||"link",data_url:e.dataUrl||""},e)}},e)},onMenuShareQQ:function(e){r(p.onMenuShareQQ,{complete:function(){n("shareQQ",{title:e.title||h,desc:e.desc||"",img_url:e.imgUrl||"",link:e.link||location.href},e)}},e)},onMenuShareWeibo:function(e){r(p.onMenuShareWeibo,{complete:function(){n("shareWeiboApp",{title:e.title||h,desc:e.desc||"",img_url:e.imgUrl||"",link:e.link||location.href},e)}},e)},onMenuShareQZone:function(e){r(p.onMenuShareQZone,{complete:function(){n("shareQZone",{title:e.title||h,desc:e.desc||"",img_url:e.imgUrl||"",link:e.link||location.href},e)}},e)},updateTimelineShareData:function(e){n("updateTimelineShareData",{title:e.title,link:e.link,imgUrl:e.imgUrl},e)},updateAppMessageShareData:function(e){n("updateAppMessageShareData",{title:e.title,desc:e.desc,link:e.link,imgUrl:e.imgUrl},e)},startRecord:function(e){n("startRecord",{},e)},stopRecord:function(e){n("stopRecord",{},e)},onVoiceRecordEnd:function(e){r("onVoiceRecordEnd",e)},playVoice:function(e){n("playVoice",{localId:e.localId},e)},pauseVoice:function(e){n("pauseVoice",{localId:e.localId},e)},stopVoice:function(e){n("stopVoice",{localId:e.localId},e)},onVoicePlayEnd:function(e){r("onVoicePlayEnd",e)},uploadVoice:function(e){n("uploadVoice",{localId:e.localId,isShowProgressTips:0==e.isShowProgressTips?0:1},e)},downloadVoice:function(e){n("downloadVoice",{serverId:e.serverId,isShowProgressTips:0==e.isShowProgressTips?0:1},e)},translateVoice:function(e){n("translateVoice",{localId:e.localId,isShowProgressTips:0==e.isShowProgressTips?0:1},e)},chooseImage:function(e){n("chooseImage",{scene:"1|2",count:e.count||9,sizeType:e.sizeType||["original","compressed"],sourceType:e.sourceType||["album","camera"]},(e._complete=function(e){if(S){var t=e.localIds;try{t&&(e.localIds=JSON.parse(t))}catch(e){}}},e))},getLocation:function(e){},previewImage:function(e){n(p.previewImage,{current:e.current,urls:e.urls},e)},uploadImage:function(e){n("uploadImage",{localId:e.localId,isShowProgressTips:0==e.isShowProgressTips?0:1},e)},downloadImage:function(e){n("downloadImage",{serverId:e.serverId,isShowProgressTips:0==e.isShowProgressTips?0:1},e)},getLocalImgData:function(e){!1===P?(P=!0,n("getLocalImgData",{localId:e.localId},(e._complete=function(e){if(P=!1,0<E.length){var t=E.shift();wx.getLocalImgData(t)}},e))):E.push(e)},getNetworkType:function(e){n("getNetworkType",{},(e._complete=function(e){e=function(e){var t=e.errMsg;e.errMsg="getNetworkType:ok";var n=e.subtype;if(delete e.subtype,n)e.networkType=n;else{var i=t.indexOf(":"),r=t.substring(i+1);switch(r){case"wifi":case"edge":case"wwan":e.networkType=r;break;default:e.errMsg="getNetworkType:fail"}}return e}(e)},e))},openLocation:function(e){n("openLocation",{latitude:e.latitude,longitude:e.longitude,name:e.name||"",address:e.address||"",scale:e.scale||28,infoUrl:e.infoUrl||""},e)}},i(f,"getLocation",(function(e){n(p.getLocation,{type:(e=e||{}).type||"wgs84"},(e._complete=function(e){delete e.type},e))})),i(f,"hideOptionMenu",(function(e){n("hideOptionMenu",{},e)})),i(f,"showOptionMenu",(function(e){n("showOptionMenu",{},e)})),i(f,"closeWindow",(function(e){n("closeWindow",{},e=e||{})})),i(f,"hideMenuItems",(function(e){n("hideMenuItems",{menuList:e.menuList},e)})),i(f,"showMenuItems",(function(e){n("showMenuItems",{menuList:e.menuList},e)})),i(f,"hideAllNonBaseMenuItem",(function(e){n("hideAllNonBaseMenuItem",{},e)})),i(f,"showAllNonBaseMenuItem",(function(e){n("showAllNonBaseMenuItem",{},e)})),i(f,"scanQRCode",(function(e){n("scanQRCode",{needResult:(e=e||{}).needResult||0,scanType:e.scanType||["qrCode","barCode"]},(e._complete=function(e){if(I){var t=e.resultStr;if(t){var n=JSON.parse(t);e.resultStr=n&&n.scan_code&&n.scan_code.scan_result}}},e))})),i(f,"openAddress",(function(e){n(p.openAddress,{},(e._complete=function(e){var t;(t=e).postalCode=t.addressPostalCode,delete t.addressPostalCode,t.provinceName=t.proviceFirstStageName,delete t.proviceFirstStageName,t.cityName=t.addressCitySecondStageName,delete t.addressCitySecondStageName,t.countryName=t.addressCountiesThirdStageName,delete t.addressCountiesThirdStageName,t.detailInfo=t.addressDetailInfo,delete t.addressDetailInfo,e=t},e))})),i(f,"openProductSpecificView",(function(e){n(p.openProductSpecificView,{pid:e.productId,view_type:e.viewType||0,ext_info:e.extInfo},e)})),i(f,"addCard",(function(e){for(var t=e.cardList,i=[],r=0,a=t.length;r<a;++r){var o=t[r],s={card_id:o.cardId,card_ext:o.cardExt};i.push(s)}n(p.addCard,{card_list:i},(e._complete=function(e){var t=e.card_list;if(t){for(var n=0,i=(t=JSON.parse(t)).length;n<i;++n){var r=t[n];r.cardId=r.card_id,r.cardExt=r.card_ext,r.isSuccess=!!r.is_succ,delete r.card_id,delete r.card_ext,delete r.is_succ}e.cardList=t,delete e.card_list}},e))})),i(f,"chooseCard",(function(e){n("chooseCard",{app_id:T.appId,location_id:e.shopId||"",sign_type:e.signType||"SHA1",card_id:e.cardId||"",card_type:e.cardType||"",card_sign:e.cardSign,time_stamp:e.timestamp+"",nonce_str:e.nonceStr},(e._complete=function(e){e.cardList=e.choose_card_info,delete e.choose_card_info},e))})),i(f,"openCard",(function(e){for(var t=e.cardList,i=[],r=0,a=t.length;r<a;++r){var o=t[r],s={card_id:o.cardId,code:o.code};i.push(s)}n(p.openCard,{card_list:i},e)})),i(f,"consumeAndShareCard",(function(e){n(p.consumeAndShareCard,{consumedCardId:e.cardId,consumedCode:e.code},e)})),i(f,"chooseWXPay",(function(e){n(p.chooseWXPay,o(e),e)})),i(f,"openEnterpriseRedPacket",(function(e){n(p.openEnterpriseRedPacket,o(e),e)})),i(f,"startSearchBeacons",(function(e){n(p.startSearchBeacons,{ticket:e.ticket},e)})),i(f,"stopSearchBeacons",(function(e){n(p.stopSearchBeacons,{},e)})),i(f,"onSearchBeacons",(function(e){r(p.onSearchBeacons,e)})),i(f,"openEnterpriseChat",(function(e){n("openEnterpriseChat",{useridlist:e.userIds,chatname:e.groupName},e)})),i(f,"launchMiniProgram",(function(e){n("launchMiniProgram",{targetAppId:e.targetAppId,path:function(e){if("string"==typeof e&&0<e.length){var t=e.split("?")[0],n=e.split("?")[1];return t+=".html",void 0!==n?t+"?"+n:t}}(e.path),envVersion:e.envVersion},e)})),i(f,"miniProgram",{navigateBack:function(e){e=e||{},l((function(){n("invokeMiniProgramAPI",{name:"navigateBack",arg:{delta:e.delta||1}},e)}))},navigateTo:function(e){l((function(){n("invokeMiniProgramAPI",{name:"navigateTo",arg:{url:e.url}},e)}))},redirectTo:function(e){l((function(){n("invokeMiniProgramAPI",{name:"redirectTo",arg:{url:e.url}},e)}))},switchTab:function(e){l((function(){n("invokeMiniProgramAPI",{name:"switchTab",arg:{url:e.url}},e)}))},reLaunch:function(e){l((function(){n("invokeMiniProgramAPI",{name:"reLaunch",arg:{url:e.url}},e)}))},postMessage:function(e){l((function(){n("invokeMiniProgramAPI",{name:"postMessage",arg:e.data||{}},e)}))},getEnv:function(t){l((function(){t({miniprogram:"miniprogram"===e.__wxjs_environment})}))}}),f),V=1,A={};return v.addEventListener("error",(function(e){if(!S){var t=e.target,n=t.tagName,i=t.src;if(("IMG"==n||"VIDEO"==n||"AUDIO"==n||"SOURCE"==n)&&-1!=i.indexOf("wxlocalresource://")){e.preventDefault(),e.stopPropagation();var r=t["wx-id"];if(r||(r=V++,t["wx-id"]=r),A[r])return;A[r]=!0,wx.ready((function(){wx.getLocalImgData({localId:i,success:function(e){t.src=e.localData}})}))}}}),!0),v.addEventListener("load",(function(e){if(!S){var t=e.target,n=t.tagName;if(t.src,"IMG"==n||"VIDEO"==n||"AUDIO"==n||"SOURCE"==n){var i=t["wx-id"];i&&(A[i]=!1)}}}),!0),t&&(e.wx=e.jWeixin=O),O}var $}))},3598:function(e,t,n){var i=n("f986");"string"===typeof i&&(i=[[e.i,i,""]]),i.locals&&(e.exports=i.locals);var r=n("4f06").default;r("de040bf4",i,!0,{sourceMap:!1,shadowMode:!1})},"3a2f":function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var i={name:"pds-order-empty",components:{},props:{},data:function(){return{}},methods:{}};t.default=i},"3e6b":function(e,t,n){var i=n("4980");"string"===typeof i&&(i=[[e.i,i,""]]),i.locals&&(e.exports=i.locals);var r=n("4f06").default;r("6998cec3",i,!0,{sourceMap:!1,shadowMode:!1})},4980:function(e,t,n){var i=n("24fb");t=i(!1),t.push([e.i,'@charset "UTF-8";\r\n/**\r\n * 下方引入的为uView UI的集成样式文件，为scss预处理器，其中包含了一些"u-"开头的自定义变量\r\n * uView自定义的css类名和scss变量，均以"u-"开头，不会造成冲突，请放心使用 \r\n */.content[data-v-a9e80202]{line-height:2;padding:%?0?%!important}.group[data-v-a9e80202]{width:100%}',""]),e.exports=t},5424:function(e,t,n){"use strict";n.r(t);var i=n("6fed"),r=n.n(i);for(var a in i)"default"!==a&&function(e){n.d(t,e,(function(){return i[e]}))}(a);t["default"]=r.a},"589d":function(e,t,n){"use strict";var i=n("22ee"),r=n.n(i);r.a},"5a53":function(e,t,n){"use strict";n.r(t);var i=n("3a2f"),r=n.n(i);for(var a in i)"default"!==a&&function(e){n.d(t,e,(function(){return i[e]}))}(a);t["default"]=r.a},"5cc2":function(e,t,n){"use strict";n.r(t);var i=n("f51a"),r=n("5a53");for(var a in r)"default"!==a&&function(e){n.d(t,e,(function(){return r[e]}))}(a);n("0099");var o,s=n("f0c5"),c=Object(s["a"])(r["default"],i["b"],i["c"],!1,null,"7815d456",null,!1,i["a"],o);t["default"]=c.exports},"6e6c":function(e,t,n){"use strict";n.r(t);var i=n("8704"),r=n.n(i);for(var a in i)"default"!==a&&function(e){n.d(t,e,(function(){return i[e]}))}(a);t["default"]=r.a},"6fed":function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var i={name:"pds-order-item",components:{},props:{orderItem:{}},data:function(){return{}},mounted:function(){},computed:{},methods:{cancel:function(){this.$emit("cancel")},pay:function(){this.$emit("pay")},receipt:function(){this.$emit("receipt")}}};t.default=i},"86bc":function(e,t,n){"use strict";var i;n.d(t,"b",(function(){return r})),n.d(t,"c",(function(){return a})),n.d(t,"a",(function(){return i}));var r=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("v-uni-view",{staticClass:"order"},[n("v-uni-view",{staticClass:"top"},[n("v-uni-view",{staticClass:"left"}),1==e.orderItem.status?n("v-uni-view",{staticClass:"right"},[e._v("待付款")]):e._e()],1),e._l(e.orderItem.orderDetail,(function(t,i){return n("v-uni-view",{key:i,on:{click:function(t){arguments[0]=t=e.$handleEvent(t),e.navigateTo("/pages/order/detail?id="+e.orderItem.id)}}},[n("v-uni-view",{staticClass:"item"},[n("v-uni-view",{staticClass:"left"},[n("v-uni-image",{attrs:{src:t.images,mode:"aspectFill"}})],1),n("v-uni-view",{staticClass:"content"},[n("v-uni-view",{staticClass:"title u-line-2"},[e._v(e._s(t.title))]),n("v-uni-view",{staticClass:"type"},[e._v(e._s(t.sku))])],1),n("v-uni-view",{staticClass:"right"},[n("v-uni-view",{staticClass:"price"},[e._v("￥"+e._s(t.price))]),n("v-uni-view",{staticClass:"number"},[e._v("x"+e._s(t.qty))])],1)],1)],1)})),n("v-uni-view",{staticClass:"total"},[e._v("共"+e._s(e.orderItem.qty_total)+"件商品 合计:"),n("v-uni-text",{staticClass:"total-price"},[e._v("￥"+e._s(e.orderItem.total_price))])],1),n("v-uni-view",{staticClass:"bottom"},[3==e.orderItem.status?n("v-uni-view",{staticClass:"logistics btn"},[e._v("查看物流")]):e._e(),e.orderItem.status<=1?n("v-uni-view",{staticClass:"exchange btn",on:{click:function(t){arguments[0]=t=e.$handleEvent(t),e.cancel.apply(void 0,arguments)}}},[e._v("取消订单")]):e._e(),1==e.orderItem.status?n("v-uni-view",{staticClass:"pay btn",on:{click:function(t){arguments[0]=t=e.$handleEvent(t),e.pay.apply(void 0,arguments)}}},[e._v("支付")]):e._e(),4==e.orderItem.status&&0==e.orderItem.user_is_comments?n("v-uni-view",{staticClass:"evaluate btn",on:{click:function(t){arguments[0]=t=e.$handleEvent(t),e.navigateTo("/pages/order/comment?orderId="+e.orderItem.id)}}},[e._v("评价")]):e._e(),3==e.orderItem.status?n("v-uni-view",{staticClass:"pay btn",on:{click:function(t){arguments[0]=t=e.$handleEvent(t),e.receipt.apply(void 0,arguments)}}},[e._v("确认收货")]):e._e()],1)],2)},a=[]},"86dc":function(e,t,n){"use strict";var i=n("de8d"),r=n.n(i);r.a},8704:function(e,t,n){"use strict";var i=n("4ea4");n("a9e3"),n("ac1f"),n("1276"),Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var r=i(n("2e8a")),a=i(n("0cde")),o=i(n("5cc2")),s=i(n("9c61")),c={components:{pdsOrderItem:a.default,pdsOrderEmpty:o.default,pdsPayment:s.default},data:function(){return{orderList:[[],[],[],[],[]],list:[{name:"待付款"},{name:"待发货"},{name:"待收货"},{name:"待评价"},{name:"全部"}],current:0,swiperCurrent:0,tabsHeight:0,dx:0,size:10,page:[1,1,1,1,1],loadStatus:["loadmore","loadmore","loadmore","loadmore","loadmore"],orderCancelDialogShow:!1,paymentChooseShow:!1,orderReceiptShow:!1,handle_order_id:0}},onLoad:function(e){e.type&&(this.current=e.type,this.swiperCurrent=e.type,this.dx=e.type)},onShow:function(){this.paramsInit(),this.getOrderList(this.current)},onReady:function(){this.wx_config()},methods:{paramsInit:function(){this.page=[1,1,1,1,1],this.orderList=[[],[],[],[],[]]},cancelOrderDialog:function(e){this.handle_order_id=e,this.orderCancelDialogShow=!0},paymentChoose:function(e){this.handle_order_id=e,this.paymentChooseShow=!0},receiptConfirm:function(e){this.handle_order_id=e,this.orderReceiptShow=!0},receiptOrder:function(){var e=this,t={order_id:this.handle_order_id};this.$u.api.receiptOrder(t).then((function(t){e.orderReceiptShow=!1,uni.showToast({title:"确认收货成功"}),e.paramsInit(),e.getOrderList(2)}))},pay:function(e){var t=this,n={order_id:this.handle_order_id,payment_id:e,isH5:!0};this.$u.api.payOrder(n).then((function(e){if(e.data.hasOwnProperty("status")&&2==e.data.status)return t.navigateTo("/pages/order/pay-success?orderId="+e.data.id),!1;t.wechatPay(e.data,t.handle_order_id,r.default)}))},cancelOrder:function(){var e=this,t={order_id:this.handle_order_id};this.$u.api.cancelOrder(t).then((function(t){e.orderCancelDialogShow=!1,uni.showToast({title:"取消成功"}),e.paramsInit(),e.getOrderList(0)}))},reachBottom:function(){"loadmore"==this.loadStatus[this.current]&&(this.page[this.current]=++this.page[this.current],this.getOrderList(this.current))},getOrderList:function(e){var t=this,n={};n=4==e?{current:this.page[e]}:{current:this.page[e],status:Number(e)+1},this.$u.api.getUserOrder(n).then((function(n){for(var i=0;i<n.data.records.length;i++)t.orderList[e].push(n.data.records[i]);n.data.total<=t.page[e]*t.size?t.loadStatus[e]="nomore":t.loadStatus[e]="loadmore"}))},change:function(e){this.page=[1,1,1,1,1],this.orderList[e]=[],this.loadStatus[e]="loading",this.swiperCurrent=e,this.getOrderList(e)},transition:function(e){var t=e.detail.dx;this.$refs.tabs.setDx(t)},animationfinish:function(e){var t=e.detail.current;this.$refs.tabs.setFinishCurrent(t),this.swiperCurrent=t,this.current=t},wx_config:function(){var e={url:window.location.href.split("#")[0]};this.$u.api.getWechatSignPackage(e).then((function(e){var t=200===e.code?e.data:{};r.default.config({debug:!1,appId:t.appId,timestamp:t.timestamp,nonceStr:t.nonceStr,signature:t.signature,jsApiList:["chooseWXPay"]}),r.default.ready((function(){r.default.checkJsApi({jsApiList:["chooseWXPay"],success:function(e){}})})),r.default.error((function(e){console.log("接口验证失败",e)}))})).catch((function(e){}))}}};t.default=c},8868:function(e,t,n){"use strict";n.r(t);var i=n("f0d1"),r=n("6e6c");for(var a in r)"default"!==a&&function(e){n.d(t,e,(function(){return r[e]}))}(a);n("d08c"),n("86dc");var o,s=n("f0c5"),c=Object(s["a"])(r["default"],i["b"],i["c"],!1,null,"7e661ab4",null,!1,i["a"],o);t["default"]=c.exports},"8b37":function(e,t,n){"use strict";Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var i={name:"pds-payment",components:{},data:function(){return{payment:"payment",paymentList:[]}},created:function(){this.getPaymentList()},methods:{paymentChoose:function(e){this.$emit("paymentChoose",e)},getPaymentList:function(){var e=this;this.$u.api.getPaymentList().then((function(t){e.paymentList=t.data}))}}};t.default=i},9523:function(e,t){function n(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}e.exports=n},"9c61":function(e,t,n){"use strict";n.r(t);var i=n("e5d6"),r=n("f759");for(var a in r)"default"!==a&&function(e){n.d(t,e,(function(){return r[e]}))}(a);n("1ccd");var o,s=n("f0c5"),c=Object(s["a"])(r["default"],i["b"],i["c"],!1,null,"a9e80202",null,!1,i["a"],o);t["default"]=c.exports},a852:function(e,t,n){var i=n("24fb");t=i(!1),t.push([e.i,'@charset "UTF-8";\r\n/**\r\n * 下方引入的为uView UI的集成样式文件，为scss预处理器，其中包含了一些"u-"开头的自定义变量\r\n * uView自定义的css类名和scss变量，均以"u-"开头，不会造成冲突，请放心使用 \r\n */.order[data-v-4a13060c]{width:%?710?%;background-color:#fff;margin:%?20?% auto;border-radius:%?20?%;box-sizing:border-box;padding:%?20?%;font-size:%?28?%}.order .top[data-v-4a13060c]{display:flex;justify-content:space-between}.order .top .left[data-v-4a13060c]{display:flex;align-items:center}.order .top .left .store[data-v-4a13060c]{margin:0 %?10?%;font-size:%?32?%;font-weight:700}.order .top .right[data-v-4a13060c]{color:#f29100}.order .item[data-v-4a13060c]{display:flex;margin:%?20?% 0 0}.order .item .left[data-v-4a13060c]{margin-right:%?20?%}.order .item .left uni-image[data-v-4a13060c]{width:%?200?%;height:%?200?%;border-radius:%?10?%}.order .item .content[data-v-4a13060c]{width:50%}.order .item .content .title[data-v-4a13060c]{font-size:%?28?%;line-height:%?50?%}.order .item .content .type[data-v-4a13060c]{margin:%?10?% 0;font-size:%?24?%;color:#909399}.order .item .content .delivery-time[data-v-4a13060c]{color:#e5d001;font-size:%?24?%}.order .item .right[data-v-4a13060c]{margin-left:%?10?%;padding-top:%?20?%;text-align:right}.order .item .right .decimal[data-v-4a13060c]{font-size:%?24?%;margin-top:%?4?%}.order .item .right .number[data-v-4a13060c]{color:#909399;font-size:%?24?%}.order .total[data-v-4a13060c]{margin-top:%?20?%;text-align:right;font-size:%?24?%}.order .total .total-price[data-v-4a13060c]{font-size:%?32?%}.order .bottom[data-v-4a13060c]{display:flex;margin-top:%?40?%;padding:0 %?10?%;justify-content:space-between;align-items:center}.order .bottom .btn[data-v-4a13060c]{line-height:%?52?%;width:%?160?%;border-radius:%?26?%;border:%?2?% solid #e4e7ed;font-size:%?26?%;text-align:center;color:#82848a}.order .bottom .evaluate[data-v-4a13060c]{color:#f29100;border-color:#f29100}.order .bottom .pay[data-v-4a13060c]{background-color:#fa3534;color:#fff}',""]),e.exports=t},b5f2:function(e,t,n){var i=n("c459");"string"===typeof i&&(i=[[e.i,i,""]]),i.locals&&(e.exports=i.locals);var r=n("4f06").default;r("228bfd4a",i,!0,{sourceMap:!1,shadowMode:!1})},c459:function(e,t,n){var i=n("24fb");t=i(!1),t.push([e.i,'@charset "UTF-8";\r\n/**\r\n * 下方引入的为uView UI的集成样式文件，为scss预处理器，其中包含了一些"u-"开头的自定义变量\r\n * uView自定义的css类名和scss变量，均以"u-"开头，不会造成冲突，请放心使用 \r\n */.centre[data-v-7815d456]{text-align:center;margin:%?200?% auto;font-size:%?32?%}.centre uni-image[data-v-7815d456]{width:%?164?%;height:%?164?%;border-radius:50%;margin-bottom:%?20?%}.centre .tips[data-v-7815d456]{font-size:%?24?%;color:#999;margin-top:%?20?%}.centre .btn[data-v-7815d456]{margin:%?80?% auto;width:%?200?%;border-radius:%?32?%;line-height:%?64?%;color:#fff;font-size:%?26?%;background:linear-gradient(270deg,#f9745a,#ff9e01)}',""]),e.exports=t},d08c:function(e,t,n){"use strict";var i=n("3598"),r=n.n(i);r.a},de8d:function(e,t,n){var i=n("1b2b");"string"===typeof i&&(i=[[e.i,i,""]]),i.locals&&(e.exports=i.locals);var r=n("4f06").default;r("6778734f",i,!0,{sourceMap:!1,shadowMode:!1})},e5d6:function(e,t,n){"use strict";n.d(t,"b",(function(){return r})),n.d(t,"c",(function(){return a})),n.d(t,"a",(function(){return i}));var i={pdsBox:n("5786").default,uRadioGroup:n("98f6").default,uCellGroup:n("2e01").default,uCellItem:n("4328").default,uRadio:n("a16d").default},r=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("pds-box",{attrs:{title:"支付方式"}},[n("v-uni-view",{staticClass:"content",attrs:{slot:"content"},slot:"content"},[n("u-radio-group",{staticClass:"group",model:{value:e.payment,callback:function(t){e.payment=t},expression:"payment"}},[n("u-cell-group",e._l(e.paymentList,(function(t,i){return n("u-cell-item",{attrs:{arrow:!1,"icon-style":{color:t.iconColor},"icon-size":"70",icon:t.icon,title:t.name,"title-style":{fontSize:"36rpx"}},on:{click:function(n){arguments[0]=n=e.$handleEvent(n),e.paymentChoose(t.id)}}},[n("u-radio",{attrs:{slot:"right-icon",name:t.id,disabled:!1},slot:"right-icon"})],1)})),1)],1)],1)],1)},a=[]},f0d1:function(e,t,n){"use strict";n.d(t,"b",(function(){return r})),n.d(t,"c",(function(){return a})),n.d(t,"a",(function(){return i}));var i={pdsDialog:n("7a5a").default,uPopup:n("6c26").default,uTabsSwiper:n("a255").default,uLoadmore:n("3e23").default},r=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("v-uni-view",[n("pds-dialog",{attrs:{show:e.orderCancelDialogShow,title:"真的要残忍取消我吗？"},on:{cancel:function(t){arguments[0]=t=e.$handleEvent(t),e.orderCancelDialogShow=!1},confirm:function(t){arguments[0]=t=e.$handleEvent(t),e.cancelOrder.apply(void 0,arguments)}}}),n("pds-dialog",{attrs:{show:e.orderReceiptShow,title:"确认收到货了吗？"},on:{cancel:function(t){arguments[0]=t=e.$handleEvent(t),e.orderReceiptShow=!1},confirm:function(t){arguments[0]=t=e.$handleEvent(t),e.receiptOrder.apply(void 0,arguments)}}}),n("u-popup",{attrs:{mode:"bottom",closeable:!0,"close-icon-size":"50","border-radius":"30",height:"380"},model:{value:e.paymentChooseShow,callback:function(t){e.paymentChooseShow=t},expression:"paymentChooseShow"}},[n("pds-payment",{ref:"paymentRef",on:{paymentChoose:function(t){arguments[0]=t=e.$handleEvent(t),e.pay.apply(void 0,arguments)}}})],1),n("v-uni-view",{staticClass:"wrap"},[n("v-uni-view",{staticClass:"u-tabs-box"},[n("u-tabs-swiper",{ref:"tabs",attrs:{activeColor:"#f29100",list:e.list,current:e.current,"is-scroll":!1,swiperWidth:"750"},on:{change:function(t){arguments[0]=t=e.$handleEvent(t),e.change.apply(void 0,arguments)}}})],1),n("v-uni-swiper",{staticClass:"swiper-box",attrs:{current:e.swiperCurrent},on:{transition:function(t){arguments[0]=t=e.$handleEvent(t),e.transition.apply(void 0,arguments)},animationfinish:function(t){arguments[0]=t=e.$handleEvent(t),e.animationfinish.apply(void 0,arguments)}}},[n("v-uni-swiper-item",{staticClass:"swiper-item"},[n("v-uni-scroll-view",{staticStyle:{height:"100%",width:"100%"},attrs:{"scroll-y":!0},on:{scrolltolower:function(t){arguments[0]=t=e.$handleEvent(t),e.reachBottom.apply(void 0,arguments)}}},[n("v-uni-view",{staticClass:"page-box"},[e._l(e.orderList[0],(function(t,i){return e.orderList[0].length>0?n("v-uni-view",{key:t.id},[n("pds-order-item",{attrs:{orderItem:t},on:{pay:function(n){arguments[0]=n=e.$handleEvent(n),e.paymentChoose(t.id)},cancel:function(n){arguments[0]=n=e.$handleEvent(n),e.cancelOrderDialog(t.id)}}})],1):e._e()})),e.orderList[0].length>0?n("u-loadmore",{attrs:{status:e.loadStatus[0],bgColor:"#f2f2f2"}}):e._e(),0==e.orderList[0].length?n("v-uni-view",[n("pds-order-empty")],1):e._e()],2)],1)],1),n("v-uni-swiper-item",{staticClass:"swiper-item"},[n("v-uni-scroll-view",{staticStyle:{height:"100%",width:"100%"},attrs:{"scroll-y":!0},on:{scrolltolower:function(t){arguments[0]=t=e.$handleEvent(t),e.reachBottom.apply(void 0,arguments)}}},[n("v-uni-view",{staticClass:"page-box"},[e._l(e.orderList[1],(function(t,i){return e.orderList[1].length>0?n("v-uni-view",{key:t.id},[n("pds-order-item",{attrs:{orderItem:t}})],1):e._e()})),e.orderList[1].length>0?n("u-loadmore",{attrs:{status:e.loadStatus[1],bgColor:"#f2f2f2"}}):e._e(),0==e.orderList[1].length?n("v-uni-view",[n("pds-order-empty")],1):e._e()],2)],1)],1),n("v-uni-swiper-item",{staticClass:"swiper-item"},[n("v-uni-scroll-view",{staticStyle:{height:"100%",width:"100%"},attrs:{"scroll-y":!0}},[n("v-uni-view",{staticClass:"page-box"},[e._l(e.orderList[2],(function(t,i){return e.orderList[2].length>0?n("v-uni-view",{key:t.id},[n("pds-order-item",{attrs:{orderItem:t},on:{receipt:function(n){arguments[0]=n=e.$handleEvent(n),e.receiptConfirm(t.id)}}})],1):e._e()})),e.orderList[2].length>0?n("u-loadmore",{attrs:{status:e.loadStatus[2],bgColor:"#f2f2f2"}}):e._e(),0==e.orderList[2].length?n("v-uni-view",[n("pds-order-empty")],1):e._e()],2)],1)],1),n("v-uni-swiper-item",{staticClass:"swiper-item"},[n("v-uni-scroll-view",{staticStyle:{height:"100%",width:"100%"},attrs:{"scroll-y":!0},on:{scrolltolower:function(t){arguments[0]=t=e.$handleEvent(t),e.reachBottom.apply(void 0,arguments)}}},[n("v-uni-view",{staticClass:"page-box"},[e._l(e.orderList[3],(function(t,i){return e.orderList[3].length>0?n("v-uni-view",{key:t.id},[n("pds-order-item",{attrs:{orderItem:t}})],1):e._e()})),e.orderList[3].length>0?n("u-loadmore",{attrs:{status:e.loadStatus[3],bgColor:"#f2f2f2"}}):e._e(),0==e.orderList[3].length?n("v-uni-view",[n("pds-order-empty")],1):e._e()],2)],1)],1),n("v-uni-swiper-item",{staticClass:"swiper-item"},[n("v-uni-scroll-view",{staticStyle:{height:"100%",width:"100%"},attrs:{"scroll-y":!0},on:{scrolltolower:function(t){arguments[0]=t=e.$handleEvent(t),e.reachBottom.apply(void 0,arguments)}}},[n("v-uni-view",{staticClass:"page-box"},[e._l(e.orderList[4],(function(t,i){return e.orderList[4].length>0?n("v-uni-view",{key:t.id},[n("pds-order-item",{attrs:{orderItem:t},on:{receipt:function(n){arguments[0]=n=e.$handleEvent(n),e.receiptConfirm(t.id)},pay:function(n){arguments[0]=n=e.$handleEvent(n),e.paymentChoose(t.id)},cancel:function(n){arguments[0]=n=e.$handleEvent(n),e.cancelOrderDialog(t.id)}}})],1):e._e()})),e.orderList[4].length>0?n("u-loadmore",{attrs:{status:e.loadStatus[4],bgColor:"#f2f2f2"}}):e._e(),0==e.orderList[4].length?n("v-uni-view",[n("pds-order-empty")],1):e._e()],2)],1)],1)],1)],1)],1)},a=[]},f51a:function(e,t,n){"use strict";var i;n.d(t,"b",(function(){return r})),n.d(t,"c",(function(){return a})),n.d(t,"a",(function(){return i}));var r=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("v-uni-view",{staticClass:"centre"},[n("v-uni-image",{attrs:{src:"https://cdn.uviewui.com/uview/template/taobao-order.png",mode:""}}),n("v-uni-view",{staticClass:"explain"},[e._v("您还没有相关的订单"),n("v-uni-view",{staticClass:"tips"},[e._v("可以去看看有那些想买的")])],1),n("v-uni-view",{staticClass:"btn",on:{click:function(t){arguments[0]=t=e.$handleEvent(t),e.navigateTo("/pages/index/index")}}},[e._v("随便逛逛")])],1)},a=[]},f759:function(e,t,n){"use strict";n.r(t);var i=n("8b37"),r=n.n(i);for(var a in i)"default"!==a&&function(e){n.d(t,e,(function(){return i[e]}))}(a);t["default"]=r.a},f986:function(e,t,n){var i=n("24fb");t=i(!1),t.push([e.i,"\nbody.?%PAGE?%[data-v-7e661ab4]{background-color:#f2f2f2}",""]),e.exports=t}}]);