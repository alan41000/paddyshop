(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-dc07b91c","chunk-2d0aabd2","chunk-2d0ea110"],{"11fb":function(e,t,r){"use strict";r.r(t),r.d(t,"GetList",(function(){return o})),r.d(t,"AddObj",(function(){return l})),r.d(t,"UpdateObj",(function(){return c})),r.d(t,"DelObj",(function(){return n}));var s=r("22ce"),a="/store.banner";function o(e){return Object(s["b"])({url:a+"/list",method:"post",data:e})}function l(e){return Object(s["b"])({url:a+"/add",method:"post",data:e})}function c(e){return Object(s["b"])({url:a+"/edit",method:"post",data:e})}function n(e){return Object(s["b"])({url:a+"/del",method:"post",data:{id:e}})}},8710:function(e,t,r){"use strict";r.r(t);var s=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("d2-container",{class:{"page-compact":e.crud.pageOptions.compact}},[r("template",{slot:"header"}),r("d2-crud-x",e._g(e._b({ref:"d2Crud"},"d2-crud-x",e._crudProps,!1),e._crudListeners),[r("div",{attrs:{slot:"header"},slot:"header"},[r("crud-search",{ref:"search",attrs:{options:e.crud.searchOptions},on:{submit:e.handleSearch}}),r("el-button",{directives:[{name:"permission",rawName:"v-permission",value:"store.banner:add",expression:"'store.banner:add'"}],attrs:{slot:"header",size:"small",type:"primary"},on:{click:e.addRow},slot:"header"},[r("i",{staticClass:"el-icon-plus"}),e._v(" 新增")]),r("crud-toolbar",{attrs:{search:e.crud.searchOptions.show,compact:e.crud.pageOptions.compact,columns:e.crud.columns},on:{"update:search":function(t){return e.$set(e.crud.searchOptions,"show",t)},"update:compact":function(t){return e.$set(e.crud.pageOptions,"compact",t)},refresh:function(t){return e.doRefresh()},"columns-filter-changed":e.handleColumnsFilterChanged}})],1)])],2)},a=[],o=r("8fe1"),l=r("1fbf"),c=r("11fb"),n={name:"User",mixins:[l["d2CrudPlus"].crud],data:function(){return{activeNames:[],roleList:[],checked:[],dialogPermissionVisible:!1,currentUserId:void 0}},methods:{getCrudOptions:function(){return Object(o["crudOptions"])(this)},pageRequest:function(e){return c["GetList"](e)},addRequest:function(e){return c["AddObj"](e)},updateRequest:function(e){return c["UpdateObj"](e)},delRequest:function(e){return c["DelObj"](e.id)},infoRequest:function(e){return c["GetObj"](e.id)}}},u=n,i=r("2877"),d=Object(i["a"])(u,s,a,!1,null,null,null);t["default"]=d.exports},"8fe1":function(e,t,r){"use strict";r.r(t),r.d(t,"crudOptions",(function(){return s}));r("22ce");var s=function(e){return{options:{height:"100%",highlightCurrentRow:!0,rowKey:"id"},rowHandle:{view:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("store.banner:view")}},edit:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("store.banner:edit")}},remove:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("store.banner:del")}},width:180,fixed:"right"},columns:[{title:"名称",key:"name",sortable:!1,search:{},form:{rules:[{required:!0,message:"请输入名称"}]},width:100},{title:"图片",key:"images_url",type:"image-uploader",component:{props:{height:80,width:80}},search:{disabled:!0},form:{rules:[{required:!0,message:"请上传图片"}],component:{props:{uploader:{type:"form",action:"/shop/upload/save",successHandle:function(e){return{url:e.data.url}}}},span:24}},show:!0,sortable:!1,width:200},{title:"事件类型",key:"event_type",sortable:!0,type:"select",dict:{data:[{value:0,label:"WEB页面",color:"success"},{value:1,label:"内部页面(小程序或APP内部地址)",color:"success"},{value:2,label:"外部小程序(同一个主体下的小程序appid)",color:"success"},{value:3,label:"打开地图",color:"success"},{value:4,label:"拨打电话",color:"success"}]},search:{disabled:!0},form:{rules:[{required:!0,message:"请选择事件类型"}]},show:!0,width:100},{title:"事件值",key:"event_value",sortable:!1,search:{disabled:!0},form:{rules:[{required:!0,message:"请输入事件值"}]},show:!0,width:250},{title:"平台",key:"platform",sortable:!1,width:180,search:{disabled:!1},type:"select",form:{rules:[{required:!0,message:"请选择平台"}],component:{props:{filterable:!0,multiple:!0,clearable:!0}}},dict:{data:[{value:"h5",label:"H5",color:"success"},{value:"app-plus",label:"App",color:"success"},{value:"mp-weixin",label:"微信小程序",color:"success"},{value:"mp-alipay",label:"支付宝小程序",color:"success"},{value:"mp-baidu",label:"百度小程序",color:"success"},{value:"mp-toutiao",label:"头条小程序",color:"success"},{value:"mp-lark",label:"飞书小程序",color:"success"},{value:"mp-qq",label:"QQ小程序",color:"success"},{value:"mp-kuaishou",label:"快手小程序",color:"success"},{value:"mp-360",label:"360小程序",color:"success"}]},component:{props:{color:"auto"}}},{title:"启用",key:"is_enable",sortable:!0,type:"select",dict:{data:[{value:!0,label:"是",color:"success"},{value:!1,label:"否",color:"danger"}]},search:{disabled:!0},form:{component:{value:1}},width:50},{title:"排序",key:"sort",type:"number",search:{disabled:!0},sortable:!0,form:{component:{value:0}},width:50},{title:"添加时间",key:"create_time",form:{disabled:!0},sortable:!1,show:!1},{title:"更新时间",key:"update_time",form:{disabled:!0},disabled:!0,sortable:!1}]}}}}]);