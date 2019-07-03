  //时间
  function getTime(){
     var week=["日","一","二","三","四","五","六"];
     
     var date=new Date;
     var y=date.getFullYear();
     var mon=date.getMonth()+1;
     if(mon<10){
        mon="0"+mon;
     }
     var d=date.getDate();
     if(d<10){
         d="0"+d;
     }
     var h=date.getHours();
     if(h<10){
         h="0"+h;
     }
     var m=date.getMinutes();
     if(m<10){
         m="0"+m;
     }
     var s=date.getSeconds();
     if(s<10){
         s="0"+s;
     }
     var w=date.getDay();
     
     var currentTime=y+" 年 "+mon+" 月 "+d+" 日  "+h+":"+m+":"+s+"    <b>星期"+week[w]+"</b>";
     
     var shijianduan="";
     if(0<h && h<12){
        shijianduan="早上好";
     }else if(12<h && h<13){
        shijianduan="中午好";
     }else if(13<h && h<18){
        shijianduan="下午好";
     }else if(18<h && h<23){
        shijianduan="晚上好";
        $('#timeIcon').attr('src','/ggfp/images/moon.png');
     }else if(h==0){
        shijianduan="凌晨好";
        $('#timeIcon').attr('src','/ggfp/images/moon.png');
     }
     $('#shijianduan').html(shijianduan);
     $('#time').html(currentTime);
  }
  
  $(function(){
     getTime();
     setInterval(function(){
       getTime();
     },1000);
  }); 