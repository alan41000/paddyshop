(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-601ba692","chunk-0f3041c1"],{5333:function(e,t,i){"use strict";i("e052")},"88dd":function(e,t,i){"use strict";i.r(t),i.d(t,"crudOptions",(function(){return l}));var s=i("ade3"),r=(i("22ce"),i("a696")),l=function(e){return{options:{height:"100%",highlightCurrentRow:!0,rowKey:"id"},components:{OrderGoods:r["default"]},rowHandle:{custom:[{text:" 发货",type:"primary",size:"small",emit:"delivery",icon:"el-icon-s-flag",show:function(e,t){return 2===t.status},disabled:function(){return!e.hasPermissions("order.order:delivery")}},{text:" 详情",type:"primary",size:"small",emit:"orderDetailShow",icon:"el-icon-s-flag",disabled:function(){return!e.hasPermissions("order.order:view")}}],view:{thin:!0,text:null,show:!1,disabled:function(){return!e.hasPermissions("order.order:view")}},edit:{thin:!0,text:null,show:!1,disabled:function(){return!e.hasPermissions("order.order:update")}},remove:{thin:!0,text:null,show:!1,disabled:function(){return!e.hasPermissions("order.order:delete")}},width:180},columns:[{title:"订单",key:"items",sortable:!1,width:500,component:{name:r["default"]},form:{disabled:!0}},{title:"订单金额",key:"total_price",sortable:!1,width:100,form:{disabled:!0}},{title:"买家",key:"userInfo.nickname",sortable:!0,search:{disabled:!0},width:100,form:{disabled:!0}},Object(s["a"])({title:"交易状态",key:"status",sortable:!0,type:"select",width:100,dict:{data:[{value:0,label:"待确认"},{value:1,label:"待支付"},{value:2,label:"待发货"},{value:3,label:"已发货"},{value:4,label:"已完成"},{value:5,label:"已取消"},{value:6,label:"已关闭"}]},search:{disabled:!1},form:{}},"width",100),{title:"订单号",key:"order_no",sortable:!0,search:{},width:100,form:{disabled:!0},show:!1}]}}},a696:function(e,t,i){"use strict";i.r(t);var s=function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",[i("div",{staticClass:"info"},[i("div",{staticClass:"info-left"},[e._v("订单号："+e._s(this.scope.row.order_no))]),i("div",{staticClass:"info-right"},[e._v("创建日期："+e._s(this.scope.row.create_time))])]),i("div",{staticClass:"goods"},e._l(this.scope.row.orderDetail,(function(t){return i("div",{key:t.id,staticClass:"items"},[i("div",{staticClass:"items-left"},[i("el-image",{staticStyle:{width:"80px",height:"80px"},attrs:{src:t.images}})],1),i("div",{staticClass:"items-right"},[i("div",{staticClass:"title"},[e._v(" "+e._s(t.title)+" ")]),""!==t.sku?i("div",{staticClass:"price-info"},[e._v(" 规格："+e._s(t.sku)+" ")]):e._e(),i("div",{staticClass:"price-info"},[e._v(" 单价："+e._s(t.price)+" 数量:"+e._s(t.qty)+" ")])])])})),0)])},r=[],l={props:{scope:{default:null},myProps:{default:null}},computed:{},mounted:function(){},methods:{}},a=l,o=(i("5333"),i("2877")),n=Object(o["a"])(a,s,r,!1,null,null,null);t["default"]=n.exports},e052:function(e,t,i){}}]);