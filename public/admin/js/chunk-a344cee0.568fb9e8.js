(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-a344cee0","chunk-45f6f35d","chunk-27573e76","chunk-7a4159e1","chunk-74eb4bc4","chunk-2d0cef4e","chunk-2d0a4f32"],{"092e":function(t,s,a){t.exports=a.p+"img/we.2ee17284.png"},"0c07":function(t,s,a){"use strict";a.r(s);var e=function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("d2-container",{staticClass:"page"},[a("d2-page-cover",[a("d2-icon-svg",{staticClass:"logo",attrs:{name:"d2-admin"}}),a("template",{slot:"footer"},[a("div",{staticClass:"btn-group"},[a("span",{staticClass:"btn-group__btn",on:{click:function(s){return t.$open("https://github.com/greper/d2-crud-plus")}}},[t._v("d2-crud-plus")]),t._v(" | "),a("span",{staticClass:"btn-group__btn",on:{click:function(s){return t.$open("https://github.com/greper/d2-crud")}}},[t._v("d2-crud-x")])]),a("d2-badge"),a("d2-help-btn")],1)],2)],1)},o=[],l=a("c8a3"),r=a("7ae8"),n=a("617a"),i={components:{D2HelpBtn:l["default"],D2Badge:r["default"],D2PageCover:n["default"]}},c=i,d=(a("d3e9"),a("2877")),u=Object(d["a"])(c,e,o,!1,null,"35c82166",null);s["default"]=u.exports},"29ae":function(t,s,a){},"2d4b":function(t,s,a){},"617a":function(t,s,a){"use strict";a.r(s);var e=function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("div",[a("div",[a("el-row",[a("el-col",{attrs:{span:24}},[t._v(" PaddyShop 全网多平台免费开源电商系统 ")])],1),a("el-row",{staticClass:"mt20"},[a("el-col",{attrs:{span:24}},[a("div",{staticClass:"box"},[a("el-row",[a("el-col",{attrs:{span:24}},[t._v(" 今日概况 ")])],1),a("el-row",[a("el-col",{attrs:{span:4}},[a("div",{staticClass:"number"},[t._v(t._s(t.shopData.todayInfo.orderCount))]),a("div",[t._v("订单数")])]),a("el-col",{attrs:{span:4}},[a("div",{staticClass:"number"},[t._v(t._s(t.shopData.todayInfo.faveCount))]),a("div",[t._v("收藏量")])]),a("el-col",{attrs:{span:4}},[a("div",{staticClass:"number"},[t._v(t._s(t.shopData.todayInfo.newUser))]),a("div",[t._v("新增会员")])]),a("el-col",{attrs:{span:4}},[a("div",{staticClass:"number"},[t._v(t._s(t.shopData.todayInfo.afterSale))]),a("div",[t._v("售后")])]),a("el-col",{attrs:{span:4}},[a("div",{staticClass:"number"},[t._v(t._s(t.shopData.todayInfo.withdraw))]),a("div",[t._v("提现")])]),a("el-col",{attrs:{span:4}},[a("div",{staticClass:"number"},[t._v(t._s(t.shopData.todayInfo.comments))]),a("div",[t._v("评价")])])],1)],1)])],1),a("el-row",{staticClass:"mt20",attrs:{gutter:20}},[a("el-col",{attrs:{span:14}},[a("div",{staticClass:"box"},[a("el-row",[a("el-col",{attrs:{span:24}},[t._v(" 订单状态 ")])],1),a("el-row",[a("el-col",{attrs:{span:6}},[a("div",{staticClass:"number"},[t._v(t._s(t.shopData.orders.notPay))]),a("div",[t._v("待付款")])]),a("el-col",{attrs:{span:6}},[a("div",{staticClass:"number"},[t._v(t._s(t.shopData.orders.toBeDelivered))]),a("div",[t._v("待发货")])]),a("el-col",{attrs:{span:6}},[a("div",{staticClass:"number"},[t._v(t._s(t.shopData.orders.delivered))]),a("div",[t._v("已发货")])]),a("el-col",{attrs:{span:6}},[a("div",{staticClass:"number"},[t._v(t._s(t.shopData.orders.finish))]),a("div",[t._v("已完成")])])],1)],1)]),a("el-col",{attrs:{span:10}},[a("div",{staticClass:"box"},[a("el-row",[a("el-col",{attrs:{span:24}},[t._v(" 快捷入口 ")])],1),a("el-row",[a("el-col",{attrs:{span:6}},[a("el-button",{on:{click:function(s){return t.$message("敬请期待")}}},[t._v("官方网站")])],1),a("el-col",{attrs:{span:6}},[a("el-button",{on:{click:function(s){return t.$message("敬请期待")}}},[t._v("文档中心")])],1),a("el-col",{attrs:{span:6}},[a("el-button",{on:{click:function(s){return t.$open("https://github.com/AlanLeung0410/paddyshop")}}},[t._v("github")])],1),a("el-col",{attrs:{span:6}},[a("el-button",{on:{click:function(s){return t.$open("https://gitee.com/AlanLeung87/paddyshop")}}},[t._v("gitee")])],1)],1)],1)])],1),a("el-row",{staticClass:"mt20",attrs:{gutter:20}},[a("el-col",{attrs:{span:14}},[a("div",{staticClass:"box"},[a("el-row",[a("el-col",{attrs:{span:24}},[t._v(" 热销商品 ")])],1),a("el-row",[a("el-table",{staticStyle:{width:"100%"},attrs:{data:t.hotGoods,stripe:""}},[a("el-table-column",{attrs:{prop:"index",label:"排名",width:"50"}}),a("el-table-column",{attrs:{prop:"title",label:"商品"}}),a("el-table-column",{attrs:{prop:"sales_count",label:"销量",width:"100"}})],1)],1)],1)]),a("el-col",{attrs:{span:10}},[a("div",{staticClass:"box"},[a("el-row",[a("el-col",{attrs:{span:24}},[t._v(" 销售统计 ")])],1),a("el-row",{staticClass:"row-bg",attrs:{type:"flex",justify:"space-around",align:"middle"}},[a("el-col",{attrs:{span:8}},[a("div",{staticStyle:{"text-align":"center"}},[t._v("昨日销量")])]),a("el-col",{attrs:{span:16}},[a("el-row",[a("el-col",{attrs:{span:24}},[a("div",[t._v("订单量："+t._s(t.shopData.sales.yesterday.count))])])],1),a("el-row",[a("el-col",{attrs:{span:24}},[a("div",[t._v("销售额："+t._s(t.shopData.sales.yesterday.sales))])])],1)],1)],1),a("el-row",{staticClass:"row-bg",attrs:{type:"flex",justify:"space-around",align:"middle"}},[a("el-col",{attrs:{span:8}},[a("div",{staticStyle:{"text-align":"center"}},[t._v("本周销量")])]),a("el-col",{attrs:{span:16}},[a("el-row",[a("el-col",{attrs:{span:24}},[a("div",[t._v("订单量："+t._s(t.shopData.sales.week.count))])])],1),a("el-row",[a("el-col",{attrs:{span:24}},[a("div",[t._v("销售额："+t._s(t.shopData.sales.week.sales))])])],1)],1)],1),a("el-row",{staticClass:"row-bg",attrs:{type:"flex",justify:"space-around",align:"middle"}},[a("el-col",{attrs:{span:8}},[a("div",{staticStyle:{"text-align":"center"}},[t._v("本月销量")])]),a("el-col",{attrs:{span:16}},[a("el-row",[a("el-col",{attrs:{span:24}},[a("div",[t._v("订单量："+t._s(t.shopData.sales.month.count))])])],1),a("el-row",[a("el-col",{attrs:{span:24}},[a("div",[t._v("销售额："+t._s(t.shopData.sales.month.sales))])])],1)],1)],1)],1)])],1)],1)])},o=[],l=(a("4160"),a("159b"),a("22ce")),r={data:function(){return{hotGoods:[],shopData:{hotGoods:[],orders:{},todayInfo:{},sales:{yesterday:{count:0,sales:0},week:{count:0,sales:0},month:{count:0,sales:0}}}}},mounted:function(){this.getShopData()},methods:{getShopData:function(){var t=this;Object(l["b"])({url:"/store.ShopData/shopData",method:"post",data:[]}).then((function(s){200==s.code&&(t.shopData=s.data,t.hotGoods=s.data.hotGoods,t.hotGoods.forEach((function(t,s,a){t.index=s+1})))}))}}},n=r,i=(a("859f"),a("2877")),c=Object(i["a"])(n,e,o,!1,null,"1c399a4d",null);s["default"]=c.exports},"61d8":function(t,s,a){"use strict";a("2d4b")},6251:function(t,s,a){t.exports=a.p+"img/d2-help-button@2x.f2b91bcb.png"},"6fc0":function(t,s,a){"use strict";a.r(s);var e=a("0c07");s["default"]=e["default"]},"7ae8":function(t,s,a){"use strict";a.r(s);var e=function(){var t=this,s=t.$createElement;t._self._c;return t._m(0)},o=[function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("div",{staticClass:"d2-badge"},[a("p",{attrs:{align:"center"}},[a("a",[a("img",{attrs:{src:"https://img.shields.io/github/forks/greper/d2-crud-plus.svg"}})]),a("a",[a("img",{attrs:{src:"https://img.shields.io/github/stars/greper/d2-crud-plus.svg"}})]),a("a",[a("img",{attrs:{src:"https://img.shields.io/github/issues/greper/d2-crud-plus.svg"}})]),a("a",[a("img",{attrs:{src:"https://img.shields.io/github/issues-closed/greper/d2-crud-plus.svg"}})]),a("a",[a("img",{attrs:{src:"https://img.shields.io/github/issues-pr/greper/d2-crud-plus.svg"}})]),a("a",[a("img",{attrs:{src:"https://img.shields.io/github/issues-pr-closed/greper/d2-crud-plus.svg"}})])]),a("p",{attrs:{align:"center"}},[a("a",[a("img",{attrs:{src:"https://img.shields.io/github/last-commit/greper/d2-crud-plus.svg"}})]),a("a",[a("img",{attrs:{src:"https://img.shields.io/badge/code_style-standard-brightgreen.svg"}})])])])}],l=(a("61d8"),a("2877")),r={},n=Object(l["a"])(r,e,o,!1,null,"24b2f546",null);s["default"]=n.exports},"83dc":function(t,s,a){},"859f":function(t,s,a){"use strict";a("29ae")},c8a3:function(t,s,a){"use strict";a.r(s);var e=function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",[e("img",{staticStyle:{width:"138px"},attrs:{src:a("6251")},on:{click:function(s){t.dialogVisible=!0}}}),e("el-dialog",{attrs:{title:"帮助",width:"800px",visible:t.dialogVisible,"append-to-body":!0},on:{"update:visible":function(s){t.dialogVisible=s}}},[e("div",{staticStyle:{"margin-top":"-25px","margin-bottom":"-25px"}},[e("el-button-group",{staticClass:"d2-mb"},[e("el-button",{on:{click:function(s){return t.$open("https://github.com/greper/d2-crud-plus")}}},[e("d2-icon",{staticClass:"d2-mr-5 ",attrs:{name:"github"}}),t._v(" 主页 ")],1),e("el-button",{on:{click:function(s){return t.$open("http://preview.d2-crud-plus.docmirror.cn/D2CrudPlusExample/index.html")}}},[e("d2-icon",{staticClass:"d2-mr-5",attrs:{name:"book"}}),t._v(" 示例 ")],1),e("el-button",{on:{click:function(s){return t.$open("https://greper.github.io/d2-crud-plus/")}}},[e("d2-icon",{staticClass:"d2-mr-5",attrs:{name:"book"}}),t._v(" 文档(Git) ")],1),e("el-button",{on:{click:function(s){return t.$open("http://d2-crud-plus.docmirror.cn/d2-crud-plus/")}}},[e("d2-icon",{staticClass:"d2-mr-5",attrs:{name:"book"}}),t._v(" 文档(码云) ")],1),e("el-button",{on:{click:function(s){return t.$open("https://fairyever.com/d2-admin/doc/zh/")}}},[e("d2-icon",{staticClass:"d2-mr-5",attrs:{name:"book"}}),t._v(" d2-admin 文档 ")],1),e("el-button",{on:{click:function(s){return t.$open("https://fairyever.com/d2-admin/doc/zh/ecosystem-d2-crud/")}}},[e("d2-icon",{staticClass:"d2-mr-5",attrs:{name:"book"}}),t._v(" d2-crud 文档 ")],1)],1),e("el-row",{attrs:{gutter:20}},[e("el-col",{attrs:{span:8}},[e("el-alert",{staticClass:"d2-mb",attrs:{closable:!1,type:"info",title:"微信加作者好友寻求帮助"}}),e("img",{staticStyle:{width:"100%"},attrs:{src:a("092e")}})],1)],1)],1)])],1)},o=[],l={data:function(){return{dialogVisible:!1}}},r=l,n=a("2877"),i=Object(n["a"])(r,e,o,!1,null,null,null);s["default"]=i.exports},d3e9:function(t,s,a){"use strict";a("83dc")}}]);