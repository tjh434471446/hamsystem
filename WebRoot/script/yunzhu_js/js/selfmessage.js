
$(document).ready(function(){
	
	
   $(".exhave").click(function(){
  if($(this).attr("value")=="1"){
   $(".expose").show();
  }else{
   $(".expose").hide();
  }
});
   $(".allergy").click(function(){
		if($(this).attr("value")=="1"){
		$(".tallergy").show();
		}else{
			$(".tallergy").hide();
			}
			});
     $(".genetic").click(function(){
		if($(this).attr("value")=="1"){
		$(".tgene").show();
		}else{
			$(".tgene").hide();
			}
			});
$(".mingzu").change(function(){
		if($(this).find("option:selected").val()=="1"){
			$(".tfew").show();
			}else{
				$(".tfew").hide();}});
 
$(".sickRadio").click(function() {
	if($(this).attr("value")=="1"){
		$(".sickList").show();
	}else {
		$(".sickList").hide();
	}
	
	});
 
$(".ckcancer").click(function() {
	if(this.checked){
		$(".tcancer").show();
	}else{
		$(".tcancer").hide();
	}
});	
$(".ckoccupDis").click(function() {
	if(this.checked){
		$(".toccupDis").show();
	}else{
		$(".toccupDis").hide();
	}
});
$(".ckother").click(function() {
	if(this.checked){
		$(".tother").show();
	}else{
		$(".tother").hide();
	}
});

$(".fsickRadio").click(function() {
	if($(this).attr("value")=="1"){
		$(".fsickList").show();
	}else {
		$(".fsickList").hide();
	}
	
	});
 
$(".fckcancer").click(function() {
	if(this.checked){
		$(".ftcancer").show();
	}else{
		$(".ftcancer").hide();
	}
});	
$(".fckoccupDis").click(function() {
	if(this.checked){
		$(".ftoccupDis").show();
	}else{
		$(".ftoccupDis").hide();
	}
});
$(".fckother").click(function() {
	if(this.checked){
		$(".ftother").show();
	}else{
		$(".ftother").hide();
	}
});


$(".msickRadio").click(function() {
	if($(this).attr("value")=="1"){
		$(".msickList").show();
	}else {
		$(".msickList").hide();
	}
	
	});
 
$(".mckcancer").click(function() {
	if(this.checked){
		$(".mtcancer").show();
	}else{
		$(".mtcancer").hide();
	}
});	
$(".mckoccupDis").click(function() {
	if(this.checked){
		$(".mtoccupDis").show();
	}else{
		$(".mtoccupDis").hide();
	}
});
$(".mckother").click(function() {
	if(this.checked){
		$(".mtother").show();
	}else{
		$(".mtother").hide();
	}
});

$(".brosickRadio").click(function() {
	if($(this).attr("value")=="1"){
		$(".brosickList").show();
	}else {
		$(".brosickList").hide();
	}
	
	});
 
$(".brockcancer").click(function() {
	if(this.checked){
		$(".brotcancer").show();
	}else{
		$(".brotcancer").hide();
	}
});	
$(".brockoccupDis").click(function() {
	if(this.checked){
		$(".brotoccupDis").show();
	}else{
		$(".brotoccupDis").hide();
	}
});
$(".brockother").click(function() {
	if(this.checked){
		$(".brotother").show();
	}else{
		$(".brotother").hide();
	}
});
$(".childsickRadio").click(function() {
	if($(this).attr("value")=="1"){
		$(".childsickList").show();
	}else {
		$(".childsickList").hide();
	}
	
	});
 
$(".childckcancer").click(function() {
	if(this.checked){
		$(".childtcancer").show();
	}else{
		$(".childtcancer").hide();
	}
});	
$(".childckoccupDis").click(function() {
	if(this.checked){
		$(".childtoccupDis").show();
	}else{
		$(".childtoccupDis").hide();
	}
});
$(".vckother").click(function() {
	if(this.checked){
		$(".childtother").show();
	}else{
		$(".childtother").hide();
	}
});

$(".disabledRatio").click(function() {
	if($(this).attr("value")==1){
		$(".disabledList").show();
	}else{
		$(".disabledList").hide();
	}
});

$(".disckother").click(function() {
	if(this.checked){
		$(".distother").show();
		}else{
			$(".distother").hide();
		}
});


$(".payother").click(function(){
	$(".payo").show();})
$(".badc").click(function(){
	$(".badcan").show();})
$(".ots").click(function(){
	$(".otsick").show();})
$(".pros").click(function(){
	$(".prosick").show();})
$(".badc1").click(function(){
	$(".badcan1").show();})
$(".ots1").click(function(){
	$(".otsick1").show();})
$(".pros1").click(function(){
	$(".prosick1").show();})
$(".badc2").click(function(){
	$(".badcan2").show();})
$(".ots2").click(function(){
	$(".otsick2").show();})
$(".pros2").click(function(){
	$(".prosick2").show();})
$(".badc3").click(function(){
	$(".badcan3").show();})
$(".ots3").click(function(){
	$(".otsick3").show();})
$(".pros3").click(function(){
	$(".prosick3").show();})
$(".badc4").click(function(){
	$(".badcan4").show();})
$(".ots4").click(function(){
	$(".otsick4").show();})
$(".pros4").click(function(){
	$(".prosick4").show();})
$(".otdis").click(function(){
	$(".otdisabled").show();})

 var i=2;
 var rowCount=2;
 var rowBloodCount=1;
 var surgeryCount=1;
 var traumasCount=1;
/* function delRow(rowIndex){ 
	 	console.log("进入");
	    $("#option"+rowIndex).remove();  
	};*/

function eachBlo(){
		var num=0;
		   $(".blo-reason").each(function(){
			   var value="txBlood"+num;
			   $(this).attr("name",value);
			   num++;
		   });
	}
 //输血添加按钮
       $(function(){
   $(".addblood").click(function(){
	   
	   var newRow='<tr class="txBlood" id="option'+rowBloodCount+'"><td>输血'+rowBloodCount+'：</td><td><input type="text" name="txBlood" class="blo-reason" style="width:300px"></td><td><input id="btn'+rowBloodCount+'" name="btnDelete" type="button" value="删除" onclick="delRow('+rowBloodCount+')" ></td></tr>'; 
	   $(".blood_1").append(newRow);
	   rowBloodCount++;
	  // eachBlo();
	  // onclick="delRow('+rowBloodCount+')"
	   /*
	   var newRow='<tr id="option'+rowBloodCount+'"><td class="oz-form-topLabel">输血'+rowBloodCount+'：</td><td class="oz-property" ><input type="text" name="txBlood'+rowBloodCount+'" style="width:300px"></td><td><a href="#" onclick=delRow('+rowBloodCount+')>删除</a></td></tr>';   
		 $(".blood_1").after(newRow);
		 var x='txBlood'+rowBloodCount;
	   		var dateT=$("input[name=txBlood2]").val();
	   		$.post(
	   				//url
				"archive_test.action",
					//数据传输
				{"dateT":dateT},
				//返回值方法
				function(){
					alert('传送回来成功');
					
				}
			);	
		 rowBloodCount++; 
         */

	   }); 
/*   $(".form-save").click(function(){
		  var myform=$("#all-form").serialize();
		  $.post("archive_test.action",myform);
	   });*/
   		
   
      });
       
 //外伤添加按钮
	    $(function(){
   $(".addbloo").click(function(){
	   var newRow='<tr class="txTraumas" id="optionTraumas'+traumasCount+'"><td class="oz-form-topLabel">外伤'+traumasCount+'：</td><td><input type="text" name="txTraumas" class="traumas-reason" style="width:300px"></td><td><input id="btn" name="btnDelete" type="button" value="删除" onclick="delTraumasRow('+traumasCount+')" ></td></tr>'; 
	   $(".bloo_1").append(newRow);
	   traumasCount++;
	   
	   /*
             var ss = $(".bloo_1").clone();
             ss.attr("class","bloo_"+i);
             ss.find("input[type='radio']").attr("name","radio_"+i);
             $(".bloo_1 input[type=radio]").each(function(i){
              var sel=$(this).attr("checked");
              ss.find("input[type='radio']").eq(i).attr("checked",sel);
             });
             $(".bloo_1").after(ss);
             i++;
         */});       
      });
  //手术添加按钮
		$(function(){
   $(".addblo").click(function(){
	   var newRow='<tr class="txSurgery" id="optionSugery'+surgeryCount+'"><td class="">手术'+surgeryCount+'：</td><td><input type="text" name="txSurgery" class="surgery-reason" style="width:300px"></td><td><input id="btn" name="btnDelete" type="button" value="删除" onclick="delSugeryRow('+surgeryCount+')" ></td></tr>'; 		
	   $(".blo_1").append(newRow);
	   surgeryCount++;
           
         });       
      });
	//输血有无判断	  
   $(".rblood").click(function(){
		if($(this).attr("value")=="1"){
		$(".tblood").show();
		$(".addblood").show();
		} else {
			$(".tblood").hide();
			$(".addblood").hide();
			 $(".blood_1").removeClass("txBlood");
			rowBloodCount=1;
		}
	})
	//外伤有无
   $(".rbloo").click(function(){
		if($(this).attr("value")=="1"){
		$(".tbloo").show();
		$(".addbloo").show();
		}else{
			$(".tbloo").hide();
			$(".addbloo").hide();
			$(".bloo_1").removeClass("txTraumas");
			traumasCount=1;
		}
	})
	
	//手术有无
   $(".rblo").click(function(){
		if($(this).attr("value")=="1"){
		$(".tblo").show();
		$(".addblo").show();
		}else{
			$(".tblo").hide();
			$(".addblo").hide();
			$(".blo_1").removeClass("txSurgery");
			surgeryCount=1;
		}
	})
   Calendar.setup({ 
trigger : "calendar-trigger", 
inputField : "calendar-inputField", 
onSelect : function(){this.hide()} 
}); 
   Calendar.setup({ 
trigger : "calendar-trigger1", 
inputField : "calendar-inputField1", 
onSelect : function(){this.hide()} 
}); 
   Calendar.setup({ 
trigger : "calendar-trigger2", 
inputField : "calendar-inputField2", 
onSelect : function(){this.hide()} 
}); 
   Calendar.setup({ 
trigger : "calendar-trigger3", 
inputField : "calendar-inputField3", 
onSelect : function(){this.hide()} 
}); 
   Calendar.setup({ 
trigger : "calendar-trigger4", 
inputField : "calendar-inputField4", 
onSelect : function(){this.hide()} 
}); 
  
   Calendar.setup({ 
trigger : "calendar-trigger5", 
inputField : "calendar-inputField5", 
onSelect : function(){this.hide()} 
}); 

   });