(function(){var t,e=function(t,e){return function(){return t.apply(e,arguments)}};jQuery(function(){return new t}),t=function(){function t(){this.updatePreview=e(this.updatePreview,this),this.update=e(this.update,this),$("#cropbox").Jcrop({aspectRatio:1,setSelect:[0,0,320,300],onSelect:this.update,onChange:this.update})}return t.prototype.update=function(t){return $("#feedback_crop_x").val(t.x),$("#feedback_crop_y").val(t.y),$("#feedback_crop_w").val(t.w),$("#feedback_crop_h").val(t.h),this.updatePreview(t)},t.prototype.updatePreview=function(t){return $("#preview").css({width:Math.round(100/t.w*$("#cropbox").width())+"px",height:Math.round(100/t.h*$("#cropbox").height())+"px",marginLeft:"-"+Math.round(100/t.w*t.x)+"px",marginTop:"-"+Math.round(100/t.h*t.y)+"px"})},t}()}).call(this);