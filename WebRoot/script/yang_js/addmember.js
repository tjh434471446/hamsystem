/**
 * 
 */

 setTimeout(findMember(), 300);
  function findMember(){
		
		var residentId = $("#residentId").val();
		
		
		$.post(
				
		"family_gainMember.action",
		{"residentId":residentId},
		function(data){
			
			var res = data;
			alert(name+" name ");
				 $("#message").append("<div><font color='red'>用户ID: "+res.name+"</font></div>");
// 				$("#residentName").val(name);
			
		}
		
		);
	}