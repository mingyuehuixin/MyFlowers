var check = 0;//该变量是记录当前选择的评分
var time = 0;//该变量是统计用户评价的次数，这个是我的业务要求统计的（改变评分不超过三次），可以忽略

/*over()是鼠标移过事件的处理方法*/
function over(param){
	if(param == 1){
		$("#star1").attr("src","../../static/image/star_red.png");//第一颗星星亮起来，下面以此类推
		$("#message").html("很差");//设置提示语，下面以此类推
		$("#describe").val("1");
	//	alert($("#describe").val());
	}else if(param == 2){
		$("#star1").attr("src","../../static/image/star_red.png");
		$("#star2").attr("src","../../static/image/star_red.png");
		$("#message").html("比较差");
		$("#describe").val("2");
	}else if(param == 3){
		$("#star1").attr("src","../../static/image/star_red.png");
		$("#star2").attr("src","../../static/image/star_red.png");
		$("#star3").attr("src","../../static/image/star_red.png");
		$("#message").html("一般");
		$("#describe").val("3");
	}else if(param == 4){
		$("#star1").attr("src","../../static/image/star_red.png");
		$("#star2").attr("src","../../static/image/star_red.png");
		$("#star3").attr("src","../../static/image/star_red.png");
		$("#star4").attr("src","../../static/image/star_red.png");
		$("#message").html("比较好");
		$("#describe").val("4");
	}else if(param == 5){
		$("#star1").attr("src","../../static/image/star_red.png");
		$("#star2").attr("src","../../static/image/star_red.png");
		$("#star3").attr("src","../../static/image/star_red.png");
		$("#star4").attr("src","../../static/image/star_red.png");
		$("#star5").attr("src","../../static/image/star_red.png");
		$("#message").html("很好");
		$("#describe").val("5");
	}
//	alert($("#describe").val());
}
/*out 方法是鼠标移除事件的处理方法，当鼠标移出时，恢复到我的打分情况*/
function out(){
	if(check == 1){//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
		$("#star1").attr("src","../../static/image/star_red.png");
		$("#star2").attr("src","../../static/image/star.png");
		$("#star3").attr("src","../../static/image/star.png");
		$("#star4").attr("src","../../static/image/star.png");
		$("#star5").attr("src","../../static/image/star.png");
		$("#message").html("");
		$("#describe").val("1");
	//	alert($("#describe").val());
	}else if(check == 2){
		$("#star1").attr("src","../../static/image/star_red.png");
		$("#star2").attr("src","../../static/image/star_red.png");
		$("#star3").attr("src","../../static/image/star.png");
		$("#star4").attr("src","../../static/image/star.png");
		$("#star5").attr("src","../../static/image/star.png");
		$("#message").html("");
		$("#describe").val("2");
	}else if(check == 3){
		$("#star1").attr("src","../../static/image/star_red.png");
		$("#star2").attr("src","../../static/image/star_red.png");
		$("#star3").attr("src","../../static/image/star_red.png");
		$("#star4").attr("src","../../static/image/star.png");
		$("#star5").attr("src","../../static/image/star.png");
		$("#message").html("");
		$("#describe").val("3");
	}else if(check == 4){
		$("#star1").attr("src","../../static/image/star_red.png");
		$("#star2").attr("src","../../static/image/star_red.png");
		$("#star3").attr("src","../../static/image/star_red.png");
		$("#star4").attr("src","../../static/image/star_red.png");
		$("#star5").attr("src","../../static/image/star.png");
		$("#message").html("");
		$("#describe").val("4");
	}else if(check == 5){
		$("#star1").attr("src","../../static/image/star_red.png");
		$("#star2").attr("src","../../static/image/star_red.png");
		$("#star3").attr("src","../../static/image/star_red.png");
		$("#star4").attr("src","../../static/image/star_red.png");
		$("#star5").attr("src","../../static/image/star_red.png");
		$("#message").html("");
		$("#describe").val("5");
	}else if(check == 0){
		$("#star1").attr("src","../../static/image/star.png");
		$("#star2").attr("src","../../static/image/star.png");
		$("#star3").attr("src","../../static/image/star.png");
		$("#star4").attr("src","../../static/image/star.png");
		$("#star5").attr("src","../../static/image/star.png");
		$("#message").html("");
		$("#describe").val("0");
	}
//	alert($("#describe").val());
}


/*over()是鼠标移过事件的处理方法*/
function over1(param){
	if(param == 11){
		$("#star11").attr("src","../../static/image/star_red.png");//第一颗星星亮起来，下面以此类推
		$("#message1").html("很差");//设置提示语，下面以此类推
		$("#storeservice").val("1");
	}else if(param == 22){
		$("#star11").attr("src","../../static/image/star_red.png");
		$("#star22").attr("src","../../static/image/star_red.png");
		$("#message1").html("比较差");
		$("#storeservice").val("2");
	}else if(param == 33){
		$("#star11").attr("src","../../static/image/star_red.png");
		$("#star22").attr("src","../../static/image/star_red.png");
		$("#star33").attr("src","../../static/image/star_red.png");
		$("#message1").html("一般");
		$("#storeservice").val("3");
	}else if(param == 44){
		$("#star11").attr("src","../../static/image/star_red.png");
		$("#star22").attr("src","../../static/image/star_red.png");
		$("#star33").attr("src","../../static/image/star_red.png");
		$("#star44").attr("src","../../static/image/star_red.png");
		$("#message1").html("比较好");
		$("#storeservice").val("4");
	}else if(param == 55){
		$("#star11").attr("src","../../static/image/star_red.png");
		$("#star22").attr("src","../../static/image/star_red.png");
		$("#star33").attr("src","../../static/image/star_red.png");
		$("#star44").attr("src","../../static/image/star_red.png");
		$("#star55").attr("src","../../static/image/star_red.png");
		$("#message1").html("很好");
		$("#storeservice").val("5");
	}
}
/*out 方法是鼠标移除事件的处理方法，当鼠标移出时，恢复到我的打分情况*/
function out1(){
	if(check == 11){//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
		$("#star11").attr("src","../../static/image/star_red.png");
		$("#star22").attr("src","../../static/image/star.png");
		$("#star33").attr("src","../../static/image/star.png");
		$("#star44").attr("src","../../static/image/star.png");
		$("#star55").attr("src","../../static/image/star.png");
		$("#message1").html("");
		$("#storeservice").val("1");
	}else if(check == 22){
		$("#star11").attr("src","../../static/image/star_red.png");
		$("#star22").attr("src","../../static/image/star_red.png");
		$("#star33").attr("src","../../static/image/star.png");
		$("#star44").attr("src","../../static/image/star.png");
		$("#star55").attr("src","../../static/image/star.png");
		$("#message1").html("");
		$("#storeservice").val("2");
	}else if(check == 33){
		$("#star11").attr("src","../../static/image/star_red.png");
		$("#star22").attr("src","../../static/image/star_red.png");
		$("#star33").attr("src","../../static/image/star_red.png");
		$("#star44").attr("src","../../static/image/star.png");
		$("#star55").attr("src","../../static/image/star.png");
		$("#message1").html("");
		$("#storeservice").val("3");
	}else if(check == 44){
		$("#star11").attr("src","../../static/image/star_red.png");
		$("#star22").attr("src","../../static/image/star_red.png");
		$("#star33").attr("src","../../static/image/star_red.png");
		$("#star44").attr("src","../../static/image/star_red.png");
		$("#star55").attr("src","../../static/image/star.png");
		$("#message1").html("");
		$("#storeservice").val("5");
	}else if(check == 55){
		$("#star11").attr("src","../../static/image/star_red.png");
		$("#star22").attr("src","../../static/image/star_red.png");
		$("#star33").attr("src","../../static/image/star_red.png");
		$("#star44").attr("src","../../static/image/star_red.png");
		$("#star55").attr("src","../../static/image/star_red.png");
		$("#message1").html("");
		$("#storeservice").val("5");
	}else if(check == 0){
		$("#star11").attr("src","../../static/image/star.png");
		$("#star22").attr("src","../../static/image/star.png");
		$("#star33").attr("src","../../static/image/star.png");
		$("#star44").attr("src","../../static/image/star.png");
		$("#star55").attr("src","../../static/image/star.png");
		$("#message1").html("");
		$("#storeservice").val("0");
	}
}


/*over()是鼠标移过事件的处理方法*/
function over2(param){
	if(param == 111){
		$("#star111").attr("src","../../static/image/star_red.png");//第一颗星星亮起来，下面以此类推
		$("#message2").html("很差");//设置提示语，下面以此类推
		$("#logistics").val("1");
	}else if(param == 222){
		$("#star111").attr("src","../../static/image/star_red.png");
		$("#star222").attr("src","../../static/image/star_red.png");
		$("#message2").html("比较差");
		$("#logistics").val("2");
	}else if(param == 333){
		$("#star111").attr("src","../../static/image/star_red.png");
		$("#star222").attr("src","../../static/image/star_red.png");
		$("#star333").attr("src","../../static/image/star_red.png");
		$("#message2").html("一般");
		$("#logistics").val("3");
	}else if(param == 444){
		$("#star111").attr("src","../../static/image/star_red.png");
		$("#star222").attr("src","../../static/image/star_red.png");
		$("#star333").attr("src","../../static/image/star_red.png");
		$("#star444").attr("src","../../static/image/star_red.png");
		$("#message2").html("比较好");
		$("#logistics").val("4");
	}else if(param == 555){
		$("#star111").attr("src","../../static/image/star_red.png");
		$("#star222").attr("src","../../static/image/star_red.png");
		$("#star333").attr("src","../../static/image/star_red.png");
		$("#star444").attr("src","../../static/image/star_red.png");
		$("#star555").attr("src","../../static/image/star_red.png");
		$("#message2").html("很好");
		$("#logistics").val("5");
	}
}
/*out 方法是鼠标移除事件的处理方法，当鼠标移出时，恢复到我的打分情况*/
function out2(){
	if(check == 111){//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
		$("#star111").attr("src","../../static/image/star_red.png");
		$("#star222").attr("src","../../static/image/star.png");
		$("#star333").attr("src","../../static/image/star.png");
		$("#star444").attr("src","../../static/image/star.png");
		$("#star555").attr("src","../../static/image/star.png");
		$("#message2").html("");
		$("#logistics").val("1");
	}else if(check == 222){
		$("#star111").attr("src","../../static/image/star_red.png");
		$("#star222").attr("src","../../static/image/star_red.png");
		$("#star333").attr("src","../../static/image/star.png");
		$("#star444").attr("src","../../static/image/star.png");
		$("#star555").attr("src","../../static/image/star.png");
		$("#message2").html("");
		$("#logistics").val("2");
	}else if(check == 333){
		$("#star111").attr("src","../../static/image/star_red.png");
		$("#star222").attr("src","../../static/image/star_red.png");
		$("#star333").attr("src","../../static/image/star_red.png");
		$("#star444").attr("src","../../static/image/star.png");
		$("#star555").attr("src","../../static/image/star.png");
		$("#message2").html("");
		$("#logistics").val("3");
	}else if(check == 444){
		$("#star111").attr("src","../../static/image/star_red.png");
		$("#star222").attr("src","../../static/image/star_red.png");
		$("#star333").attr("src","../../static/image/star_red.png");
		$("#star444").attr("src","../../static/image/star_red.png");
		$("#star555").attr("src","../../static/image/star.png");
		$("#message2").html("");
		$("#logistics").val("4");
	}else if(check == 555){
		$("#star111").attr("src","../../static/image/star_red.png");
		$("#star222").attr("src","../../static/image/star_red.png");
		$("#star333").attr("src","../../static/image/star_red.png");
		$("#star444").attr("src","../../static/image/star_red.png");
		$("#star555").attr("src","../../static/image/star_red.png");
		$("#message2").html("");
		$("#logistics").val("5");
	}else if(check == 0){
		$("#star111").attr("src","../../static/image/star.png");
		$("#star222").attr("src","../../static/image/star.png");
		$("#star333").attr("src","../../static/image/star.png");
		$("#star444").attr("src","../../static/image/star.png");
		$("#star555").attr("src","../../static/image/star.png");
		$("#message2").html("");
		$("#logistics").val("0");
	}
}



/*click()点击事件处理，记录打分*/
function click(param){
	time++;//记录打分次数
	check = param;//记录当前打分
	out();//设置星星数
}