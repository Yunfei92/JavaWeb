/**
 * 实现二级菜单显示
 */
$(function(){  
    $(".nav .list li").hover(function(){  
        $(this).find(".down").stop().slideDown({duration:800,easing:'easeOutBounce'})    
    },function(){  
        $(this).find(".down").stop().slideUp({duration:200,easing:'easeOutBounce'})      
    })    
}) 