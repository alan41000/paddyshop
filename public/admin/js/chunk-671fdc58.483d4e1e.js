(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-671fdc58","chunk-601ba692","chunk-0f3041c1","chunk-2d0e97dc"],{"436a":function(e,t,r){"use strict";r("cf83")},5333:function(e,t,r){"use strict";r("e052")},7985:function(e,t,r){"use strict";r.r(t);var s=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("d2-container",{class:{"page-compact":e.crud.pageOptions.compact}},[r("template",{slot:"header"}),r("d2-crud-x",e._g(e._b({ref:"d2Crud",on:{delivery:e.delivery,orderDetailShow:e.orderDetailShow}},"d2-crud-x",e._crudProps,!1),e._crudListeners),[r("div",{attrs:{slot:"header"},slot:"header"},[r("crud-search",{ref:"search",attrs:{options:e.crud.searchOptions},on:{submit:e.handleSearch}}),r("crud-toolbar",{attrs:{search:e.crud.searchOptions.show,compact:e.crud.pageOptions.compact,columns:e.crud.columns},on:{"update:search":function(t){return e.$set(e.crud.searchOptions,"show",t)},"update:compact":function(t){return e.$set(e.crud.pageOptions,"compact",t)},refresh:function(t){return e.doRefresh()},"columns-filter-changed":e.handleColumnsFilterChanged}})],1)]),r("el-dialog",{attrs:{title:"发货操作",width:"30%",visible:e.dialogFormVisible},on:{"update:visible":function(t){e.dialogFormVisible=t}}},[r("el-form",{ref:"deliveryForm",attrs:{model:e.dialogForm}},[r("el-form-item",{attrs:{label:"快递公司","label-width":e.formLabelWidth}},[r("el-select",{attrs:{placeholder:"请选择快递公司"},model:{value:e.dialogForm.express_id,callback:function(t){e.$set(e.dialogForm,"express_id",t)},expression:"dialogForm.express_id"}},e._l(e.deliveryData,(function(e,t){return r("el-option",{attrs:{label:e.name,value:e.id}})})),1)],1),r("el-form-item",{attrs:{label:"快递单号","label-width":e.formLabelWidth}},[r("el-input",{attrs:{autocomplete:"off"},model:{value:e.dialogForm.express_number,callback:function(t){e.$set(e.dialogForm,"express_number",t)},expression:"dialogForm.express_number"}})],1)],1),r("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[r("el-button",{on:{click:function(t){return e.deliveryCancle("deliveryForm")}}},[e._v("取 消")]),r("el-button",{attrs:{type:"primary"},on:{click:e.deliveryConfirm}},[e._v("确 定")])],1)],1),r("el-dialog",{attrs:{title:"订单详情",width:"80%",visible:e.dialogOrderDetail},on:{"update:visible":function(t){e.dialogOrderDetail=t}}},[r("el-row",[r("el-col",{attrs:{span:12}},[r("div",[e._v(" 订单详情 ")]),r("div",{staticClass:"pd20"},[e.orderDetail.row?r("el-form",{ref:"form",attrs:{model:e.orderDetail.row,"label-width":"80px"}},[r("el-form-item",{attrs:{label:"订单号"}},[r("el-input",{model:{value:e.orderDetail.row.order_no,callback:function(t){e.$set(e.orderDetail.row,"order_no",t)},expression:"orderDetail.row.order_no"}})],1),e.orderDetail.row.userInfo?r("el-form-item",{attrs:{label:"买家"}},[r("el-input",{model:{value:e.orderDetail.row.userInfo["nickname"],callback:function(t){e.$set(e.orderDetail.row.userInfo,"nickname",t)},expression:"orderDetail.row.userInfo['nickname']"}})],1):e._e(),e.orderDetail.row.addressInfo?r("el-form-item",{attrs:{label:"收货人"}},[r("el-input",{model:{value:e.orderDetail.row.addressInfo.name,callback:function(t){e.$set(e.orderDetail.row.addressInfo,"name",t)},expression:"orderDetail.row.addressInfo.name"}})],1):e._e(),e.orderDetail.row.addressInfo?r("el-form-item",{attrs:{label:"联系电话"}},[r("el-input",{model:{value:e.orderDetail.row.addressInfo.tel,callback:function(t){e.$set(e.orderDetail.row.addressInfo,"tel",t)},expression:"orderDetail.row.addressInfo.tel"}})],1):e._e(),e.orderDetail.row.addressInfo?r("el-form-item",{attrs:{label:"收货地址"}},[r("el-input",{model:{value:e.orderDetailAddress,callback:function(t){e.orderDetailAddress=t},expression:"orderDetailAddress"}})],1):e._e(),r("el-form-item",{attrs:{label:"备注"}},[r("el-input",{model:{value:e.orderDetail.row.user_note,callback:function(t){e.$set(e.orderDetail.row,"user_note",t)},expression:"orderDetail.row.user_note"}})],1)],1):e._e()],1)]),r("el-col",{attrs:{span:12}},[r("div",[e._v(" 订单状态 ")]),e.orderDetail.row?r("div",{staticClass:"pd20"},[r("div",[r("el-steps",{attrs:{space:200,active:e.orderDetail.row.status,"finish-status":"success"}},[r("el-step",{attrs:{title:"待付款"}}),r("el-step",{attrs:{title:"待发货"}}),r("el-step",{attrs:{title:"已发货"}}),r("el-step",{attrs:{title:"已完成"}})],1)],1),r("div",{staticClass:"mt20"},[e.hasPermissions("order.order:delivery")&&2==e.orderDetail.row.status?r("el-button",{attrs:{size:"small"},on:{click:function(t){return e.delivery(e.orderDetail)}}},[e._v("发货")]):e._e(),0==e.orderDetail.row.status||1==e.orderDetail.row.status?r("el-button",{attrs:{size:"small"}},[e._v("关闭订单")]):e._e()],1)]):e._e()])],1),r("el-row",[r("el-col",{attrs:{span:24}},[r("div",[e._v(" 商品清单 ")]),this.orderDetail.row?r("div",{staticClass:"pd20"},[r("el-row",[r("el-col",{attrs:{span:12}},[e._v(" 商品名称 ")]),r("el-col",{attrs:{span:4}},[e._v(" 单价 ")]),r("el-col",{attrs:{span:4}},[e._v(" 数量 ")]),r("el-col",{attrs:{span:4}},[e._v(" 小计 ")])],1),e._l(this.orderDetail.row.orderDetail,(function(t){return r("el-row",{key:t.id},[r("el-col",{attrs:{span:12}},[r("div",{staticClass:"fl"},[r("el-image",{staticStyle:{width:"60px",height:"60px"},attrs:{src:t.images}})],1),r("div",{staticClass:"fl title"},[e._v(e._s(t.title))])]),r("el-col",{attrs:{span:4}},[e._v(" "+e._s(t.price)+" ")]),r("el-col",{attrs:{span:4}},[e._v(" "+e._s(t.qty)+" ")]),r("el-col",{attrs:{span:4}},[e._v(" "+e._s(t.total_price)+" ")])],1)}))],2):e._e()])],1),r("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[r("el-button",{on:{click:function(t){e.dialogOrderDetail=!1}}},[e._v("关 闭")])],1)],1)],2)},o=[],i=r("88dd"),l=r("1fbf"),a=r("8e81"),d=r("22ce"),n={name:"Order",mixins:[l["d2CrudPlus"].crud],data:function(){return{dialogOrderDetail:!1,orderDetail:{},orderDetailAddress:"",dialogFormVisible:!1,dialogForm:{express_number:"",express_id:"",express_name:""},dialogFormOrderId:0,dialogFormUserId:0,formLabelWidth:"80px",deliveryData:[]}},created:function(){this.getDeliveryData()},methods:{getCrudOptions:function(){return Object(i["crudOptions"])(this)},pageRequest:function(e){return a["GetList"](e)},addRequest:function(e){return a["AddObj"](e)},updateRequest:function(e){return a["UpdateObj"](e)},delRequest:function(e){return a["DelObj"](e.id)},infoRequest:function(e){return a["GetObj"](e.id)},getDeliveryData:function(){var e=this;Object(d["b"])({url:"/setting.delivery/getAll",method:"post"}).then((function(t){200!==t.code?e.$message.error(t.msg):e.deliveryData=t.data}))},orderDetailShow:function(e){this.dialogOrderDetail=!0,this.orderDetail=e,this.orderDetailAddress=e.row.addressInfo.province_name+e.row.addressInfo.city_name+e.row.addressInfo.county_name+e.row.addressInfo.address},delivery:function(e){this.dialogFormVisible=!0,this.dialogFormOrderId=e.row.id,this.dialogFormUserId=e.row.user_id},deliveryConfirm:function(){var e=this,t=this.$refs.deliveryForm.model.express_id,r=this.$refs.deliveryForm.model.express_number,s={express_id:t,express_number:r,order_id:this.dialogFormOrderId,user_id:this.dialogFormUserId};a["Delivery"](s).then((function(t){200==t.code&&(e.$message({message:t.msg,type:"success"}),e.doRefresh(),e.dialogFormVisible=!1,e.dialogOrderDetail=!1,e.dialogForm={express_number:"",express_id:"",express_name:""})}))},deliveryCancle:function(e){var t=this;this.dialogFormVisible=!1,this.dialogForm={express_number:"",express_id:"",express_name:""},this.$nextTick((function(){t.$refs["deliveryForm"].resetFields()}))}}},c=n,u=(r("436a"),r("2877")),m=Object(u["a"])(c,s,o,!1,null,null,null);t["default"]=m.exports},"88dd":function(e,t,r){"use strict";r.r(t),r.d(t,"crudOptions",(function(){return i}));var s=r("ade3"),o=(r("22ce"),r("a696")),i=function(e){return{options:{height:"100%",highlightCurrentRow:!0,rowKey:"id"},components:{OrderGoods:o["default"]},rowHandle:{custom:[{text:" 发货",type:"primary",size:"small",emit:"delivery",icon:"el-icon-s-flag",show:function(e,t){return 2===t.status},disabled:function(){return!e.hasPermissions("order.order:delivery")}},{text:" 详情",type:"primary",size:"small",emit:"orderDetailShow",icon:"el-icon-s-flag",disabled:function(){return!e.hasPermissions("order.order:view")}}],view:{thin:!0,text:null,show:!1,disabled:function(){return!e.hasPermissions("order.order:view")}},edit:{thin:!0,text:null,show:!1,disabled:function(){return!e.hasPermissions("order.order:update")}},remove:{thin:!0,text:null,show:!1,disabled:function(){return!e.hasPermissions("order.order:delete")}},width:180},columns:[{title:"订单",key:"items",sortable:!1,width:500,component:{name:o["default"]},form:{disabled:!0}},{title:"订单金额",key:"total_price",sortable:!1,width:100,form:{disabled:!0}},{title:"买家",key:"userInfo.nickname",sortable:!0,search:{disabled:!0},width:100,form:{disabled:!0}},Object(s["a"])({title:"交易状态",key:"status",sortable:!0,type:"select",width:100,dict:{data:[{value:0,label:"待确认"},{value:1,label:"待支付"},{value:2,label:"待发货"},{value:3,label:"已发货"},{value:4,label:"已完成"},{value:5,label:"已取消"},{value:6,label:"已关闭"}]},search:{disabled:!1},form:{}},"width",100),{title:"订单号",key:"order_no",sortable:!0,search:{},width:100,form:{disabled:!0},show:!1}]}}},"8e81":function(e,t,r){"use strict";r.r(t),r.d(t,"GetList",(function(){return i})),r.d(t,"AddObj",(function(){return l})),r.d(t,"UpdateObj",(function(){return a})),r.d(t,"DelObj",(function(){return d})),r.d(t,"Delivery",(function(){return n}));var s=r("22ce"),o="/order.order";function i(e){return Object(s["b"])({url:o+"/list",method:"post",data:e})}function l(e){return Object(s["b"])({url:o+"/add",method:"post",data:e})}function a(e){return Object(s["b"])({url:o+"/update",method:"post",data:e})}function d(e){return Object(s["b"])({url:o+"/delete",method:"post",data:{id:e}})}function n(e){return Object(s["b"])({url:o+"/delivery",method:"post",data:{data:e}})}},a696:function(e,t,r){"use strict";r.r(t);var s=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",[r("div",{staticClass:"info"},[r("div",{staticClass:"info-left"},[e._v("订单号："+e._s(this.scope.row.order_no))]),r("div",{staticClass:"info-right"},[e._v("创建日期："+e._s(this.scope.row.create_time))])]),r("div",{staticClass:"goods"},e._l(this.scope.row.orderDetail,(function(t){return r("div",{key:t.id,staticClass:"items"},[r("div",{staticClass:"items-left"},[r("el-image",{staticStyle:{width:"80px",height:"80px"},attrs:{src:t.images}})],1),r("div",{staticClass:"items-right"},[r("div",{staticClass:"title"},[e._v(" "+e._s(t.title)+" ")]),""!==t.sku?r("div",{staticClass:"price-info"},[e._v(" 规格："+e._s(t.sku)+" ")]):e._e(),r("div",{staticClass:"price-info"},[e._v(" 单价："+e._s(t.price)+" 数量:"+e._s(t.qty)+" ")])])])})),0)])},o=[],i={props:{scope:{default:null},myProps:{default:null}},computed:{},mounted:function(){},methods:{}},l=i,a=(r("5333"),r("2877")),d=Object(a["a"])(l,s,o,!1,null,null,null);t["default"]=d.exports},cf83:function(e,t,r){},e052:function(e,t,r){}}]);