var baseInvoke=require("./_baseInvoke"),baseRest=require("./_baseRest"),method=baseRest(function(r,s){return function(e){return baseInvoke(e,r,s)}});module.exports=method;