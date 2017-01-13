function changeCode() {
	$("#vCode").attr("src", "../user/getVerifyCode?abc=" + new Date().getTime());
}