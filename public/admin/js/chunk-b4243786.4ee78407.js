(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-b4243786","chunk-2d218037","chunk-2d22c56e"],{"786e":function(e,t,r){"use strict";r.r(t);var n=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("d2-container",{class:{"page-compact":e.crud.pageOptions.compact}},[r("template",{slot:"header"}),r("d2-crud-x",e._g(e._b({ref:"d2Crud"},"d2-crud-x",e._crudProps,!1),e._crudListeners),[r("div",{attrs:{slot:"header"},slot:"header"},[r("el-button",{directives:[{name:"permission",rawName:"v-permission",value:"setting.delivery:add",expression:"'setting.delivery:add'"}],attrs:{slot:"header",size:"small",type:"primary"},on:{click:e.addRow},slot:"header"},[r("i",{staticClass:"el-icon-plus"}),e._v(" 新增")]),r("crud-toolbar",{attrs:{search:e.crud.searchOptions.show,compact:e.crud.pageOptions.compact,columns:e.crud.columns},on:{"update:search":function(t){return e.$set(e.crud.searchOptions,"show",t)},"update:compact":function(t){return e.$set(e.crud.pageOptions,"compact",t)},refresh:function(t){return e.doRefresh()},"columns-filter-changed":e.handleColumnsFilterChanged}})],1)])],2)},i=[],s=r("f38c"),d=r("1fbf"),o=r("c8d0"),a={name:"User",mixins:[d["d2CrudPlus"].crud],data:function(){return{activeNames:[],roleList:[],checked:[],dialogPermissionVisible:!1,currentUserId:void 0}},methods:{getCrudOptions:function(){return Object(s["crudOptions"])(this)},pageRequest:function(e){return o["GetList"](e)},addRequest:function(e){return o["AddObj"](e)},updateRequest:function(e){return o["UpdateObj"](e)},delRequest:function(e){return o["DelObj"](e.id)},infoRequest:function(e){return o["GetObj"](e.id)}}},u=a,c=r("2877"),l=Object(c["a"])(u,n,i,!1,null,null,null);t["default"]=l.exports},c8d0:function(e,t,r){"use strict";r.r(t),r.d(t,"GetList",(function(){return s})),r.d(t,"AddObj",(function(){return d})),r.d(t,"UpdateObj",(function(){return o})),r.d(t,"DelObj",(function(){return a}));var n=r("22ce"),i="/setting.delivery";function s(e){return Object(n["b"])({url:i+"/list",method:"post",data:e})}function d(e){return Object(n["b"])({url:i+"/add",method:"post",data:e})}function o(e){return Object(n["b"])({url:i+"/edit",method:"post",data:e})}function a(e){return Object(n["b"])({url:i+"/del",method:"post",data:{id:e}})}},f38c:function(e,t,r){"use strict";r.r(t),r.d(t,"crudOptions",(function(){return n}));r("22ce");var n=function(e){return{options:{height:"100%",highlightCurrentRow:!0,rowKey:"id"},rowHandle:{view:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("setting.delivery:list")}},edit:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("setting.delivery:edit")}},remove:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("setting.delivery:del")}},width:180,fixed:"right"},columns:[{title:"名称",key:"name",sortable:!1,search:{},form:{rules:[{required:!0,message:"请输入名称"}]},width:300},{title:"图标",key:"icon",sortable:!1,type:"avatar-uploader",component:{props:{height:40,width:40}},form:{rules:[],component:{props:{uploader:{type:"form",data:{path:"images/site"},action:"/admin/common.upload/save",successHandle:function(e){return{url:e.data.url}}}},span:24}}},{title:"启用",key:"is_enable",sortable:!0,type:"select",dict:{data:[{value:!0,label:"是",color:"success"},{value:!1,label:"否",color:"danger"}]},search:{},form:{},width:300},{title:"排序",key:"sort",type:"number",search:{disabled:!0},width:300,sortable:!0},{title:"添加时间",key:"create_time",form:{disabled:!0},disabled:!0,sortable:!1},{title:"更新时间",key:"update_time",form:{disabled:!0},disabled:!0,sortable:!1}]}}}}]);