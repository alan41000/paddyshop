(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2d209afc"],{a9b0:function(e,t,r){"use strict";r.r(t),r.d(t,"crudOptions",(function(){return l}));var i=r("22ce"),l=function(e){return{rowHandle:{view:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("auth.menu:view")}},edit:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("auth.menu:edit")}},remove:{thin:!0,text:null,disabled:function(){return!e.hasPermissions("auth.menu:del")}},custom:[{thin:!0,text:null,type:"primary",size:"small",emit:"add-sub-resource",icon:"el-icon-plus",disabled:function(){return!e.hasPermissions("auth.menu:add")}}],width:180,fixed:"right"},options:{height:"100%",highlightCurrentRow:!0,rowKey:"id"},columns:[{title:"菜单名称",key:"title",sortable:!0,search:{},form:{rules:[{required:!0,message:"请输入菜单名称"}],component:{props:{placeholder:"菜单名称"}}},width:200},{title:"图标",key:"icon",sortable:!1,type:"icon-selector",width:60},{title:"菜单代码",key:"name",sortable:!0,search:{},form:{component:{placeholder:"路由的name"}},width:170},{title:"权限代码",key:"permission",sortable:!0,search:{},form:{component:{placeholder:"aaa.bbb:ccc"}},width:170},{title:"路由地址",key:"path",sortable:!0,search:{},form:{component:{props:{placeholder:"permission/resource"}}},width:180},{title:"路由组件",key:"component",sortable:!0,search:{},form:{component:{props:{placeholder:""}},helper:"最顶层的菜单必须配置为layoutHeaderAside。子菜单配置组件路径，例如/permission/views/resource"},width:180},{title:"排序",key:"sort",sortable:!0},{title:"菜单类型",key:"type",type:"select",align:"center",width:100,search:{},dict:{data:[{value:1,color:"info",label:"菜单",name:"MENU"},{value:2,color:"success",label:"按钮",name:"BTN"},{value:3,color:"warning",label:"路由",name:"ROUTE"}]},form:{rules:[{required:!0,message:"请选择菜单类型"}]},sortable:!0},{title:"id",key:"id",form:{disabled:!0},sortable:!0},{title:"父节点",key:"parent_id",sortable:!0,width:100,type:"tree-selector",dict:{url:"/auth.menu/tree",isTree:!0,value:"id",label:"title",getData:function(e,t){return Object(i["b"])({url:e}).then((function(e){return[{id:0,title:"根节点",children:e.data}]}))}},form:{rules:[{required:!0,message:"请选择父节点"}],component:{props:{multiple:!1,elProps:{defaultExpandAll:!0},dict:{cache:!1}}}}},{title:"是否启用",key:"is_enable",type:"select",align:"center",width:80,search:{},dict:{data:[{value:!0,label:"是",color:"success"},{value:!1,label:"否",color:"danger"}]},form:{rules:[{required:!0,message:"请选择是否启用"}]},sortable:!0}]}}}}]);