(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2d0d0f1d"],{"69ae":function(e,t,r){"use strict";r.r(t),r.d(t,"crudOptions",(function(){return n}));var i=r("22ce"),n=function(e){return{pagination:{disabled:!0,pageSize:100},rowHandle:{view:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("store.articlecategory:view")}},edit:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("store.articlecategory:edit")}},remove:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("store.articlecategory:del")}},custom:[{thin:!0,text:null,type:"primary",size:"small",emit:"add-sub-category",icon:"el-icon-plus",disabled:function(){return!e.hasPermissions("store.articlecategory:add")}}],width:180,fixed:"right"},options:{height:"100%",highlightCurrentRow:!0,rowKey:"id"},columns:[{title:"分类名称",key:"name",sortable:!0,search:{},form:{rules:[{required:!0,message:"请输入分类名称"}],component:{props:{placeholder:"分类名称"}}}},{title:"排序",key:"sort",sortable:!0},{title:"父节点",key:"parent_id",sortable:!0,type:"tree-selector",dict:{url:"/store.ArticleCategory/tree",isTree:!0,value:"id",label:"name",getData:function(e,t){return Object(i["b"])({url:e}).then((function(e){return[{id:0,name:"根节点",children:e.data}]}))}},form:{rules:[{required:!0,message:"请选择父节点"}],component:{props:{multiple:!1,elProps:{defaultExpandAll:!0}}}}}]}}}}]);