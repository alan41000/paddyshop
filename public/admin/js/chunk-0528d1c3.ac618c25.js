(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-0528d1c3"],{"24ce":function(t,e,n){"use strict";n("56f8")},"56f8":function(t,e,n){},e29a:function(t,e,n){"use strict";n.r(e);var i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return this.isLogined()?n("div",{staticClass:"page"},[n("p",{staticClass:"page_title"},[t._v("404 page not found")]),n("div",[n("el-button",{staticClass:"d2-mt",on:{click:function(e){return t.$router.replace({path:"/"})}}},[t._v(" 返回首页 ")])],1)]):t._e()},c=[],o=(n("ac1f"),n("5319"),n("c276")),s={created:function(){this.isLogined()||this.goLogin()},methods:{isLogined:function(){var t=o["a"].cookies.get("uuid");return null!=t},goLogin:function(){var t=this.$route.path;this.$router.replace({path:"/login?redirect="+t})}}},a=s,u=(n("24ce"),n("2877")),r=Object(u["a"])(a,i,c,!1,null,"0c8cb4ec",null);e["default"]=r.exports}}]);