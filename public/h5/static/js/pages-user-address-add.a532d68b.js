(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-user-address-add"],{"1a19":function(e,t,s){"use strict";var r=s("4ea4");Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var a=r(s("b4ad")),d={components:{pdsAddressItem:a.default},data:function(){return{}},methods:{addUserAddress:function(){var e=this,t={name:this.$refs.address.form.name,tel:this.$refs.address.form.tel,province:this.$refs.address.form.province,city:this.$refs.address.form.city,county:this.$refs.address.form.county,address:this.$refs.address.form.address,is_default:1==this.$refs.address.form.is_default?1:0,tag:this.$refs.address.form.tag};this.$u.api.addUserAddress(t).then((function(t){200==t.code?e.$refs.uToast.show({title:"添加成功",back:!0}):uni.showToast({title:t.msg})}))}}};t.default=d},"5b9f":function(e,t,s){"use strict";s.r(t);var r=s("5e60"),a=s("a177");for(var d in a)"default"!==d&&function(e){s.d(t,e,(function(){return a[e]}))}(d);s("804e");var n,u=s("f0c5"),f=Object(u["a"])(a["default"],r["b"],r["c"],!1,null,"1cec6f80",null,!1,r["a"],n);t["default"]=f.exports},"5e60":function(e,t,s){"use strict";s.d(t,"b",(function(){return a})),s.d(t,"c",(function(){return d})),s.d(t,"a",(function(){return r}));var r={uToast:s("873c").default,pdsAddressItem:s("b4ad").default,uButton:s("dc54").default},a=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("v-uni-view",[s("u-toast",{ref:"uToast"}),s("pds-address-item",{ref:"address"}),s("v-uni-view",{staticClass:"btn"},[s("u-button",{attrs:{type:"primary",shape:"circle"},on:{click:function(t){arguments[0]=t=e.$handleEvent(t),e.addUserAddress.apply(void 0,arguments)}}},[e._v("确定")])],1)],1)},d=[]},"804e":function(e,t,s){"use strict";var r=s("e385"),a=s.n(r);a.a},a177:function(e,t,s){"use strict";s.r(t);var r=s("1a19"),a=s.n(r);for(var d in r)"default"!==d&&function(e){s.d(t,e,(function(){return r[e]}))}(d);t["default"]=a.a},b29b:function(e,t,s){var r=s("24fb");t=r(!1),t.push([e.i,".btn[data-v-1cec6f80]{padding:%?20?%}",""]),e.exports=t},e385:function(e,t,s){var r=s("b29b");"string"===typeof r&&(r=[[e.i,r,""]]),r.locals&&(e.exports=r.locals);var a=s("4f06").default;a("15f8f16e",r,!0,{sourceMap:!1,shadowMode:!1})}}]);