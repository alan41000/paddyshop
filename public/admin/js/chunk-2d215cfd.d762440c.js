(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2d215cfd"],{c093:function(e,t,r){"use strict";r.r(t),r.d(t,"crudOptions",(function(){return s}));var o=r("22ce"),s=function(e){return{options:{height:"100%",highlightCurrentRow:!0,rowKey:"id"},rowHandle:{view:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("store.article:view")}},edit:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("store.article:edit")}},remove:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("store.article:del")}},width:180,fixed:"right"},columns:[{title:"标题",key:"title",sortable:!1,search:{},form:{rules:[{required:!0,message:"请输入标题"}]}},{title:"跳转链接",key:"url",sortable:!1,search:{disabled:!0},form:{},show:!1},{title:"关键词",key:"keywords",sortable:!1,search:{disabled:!0},form:{},show:!1},{title:"描述",key:"description",sortable:!1,search:{disabled:!0},form:{},show:!1},{title:"封面",key:"images",type:"image-uploader",component:{props:{height:80,width:80}},search:{disabled:!0},form:{component:{props:{elProps:{limit:1},uploader:{type:"form",action:"/admin/common.upload/save",successHandle:function(e){return{url:e.data.url}}}},span:24}},show:!1,sortable:!1},{title:"分类",key:"category_id",sortable:!0,width:300,type:"tree-selector",dict:{url:"/store.articleCategory/tree",isTree:!0,value:"id",label:"name",getData:function(e,t){return Object(o["b"])({url:e}).then((function(e){return e.data}))}},form:{rules:[{required:!0,message:"请选择父节点"}],component:{props:{multiple:!1,elProps:{defaultExpandAll:!0}}}}},{title:"浏览量",key:"views_count",sortable:!0,search:{disabled:!0},form:{disabled:!0},show:!0},{title:"启用",key:"is_enable",sortable:!0,type:"select",dict:{data:[{value:!0,label:"是",color:"success"},{value:!1,label:"否",color:"danger"}]},search:{},form:{}},{title:"内容",key:"content",type:"editor-quill",sortable:!1,search:{disabled:!0},form:{component:{props:{uploader:{type:"form",action:"/admin/common.upload/save",successHandle:function(e){return{url:e.data.url}}}},events:{"text-change":function(e){}},show:!0}},show:!1},{title:"添加时间",key:"create_time",form:{disabled:!0},sortable:!1,show:!0},{title:"更新时间",key:"update_time",form:{disabled:!0},disabled:!0,sortable:!1}]}}}}]);