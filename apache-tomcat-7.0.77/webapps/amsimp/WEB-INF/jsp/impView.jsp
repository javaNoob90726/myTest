<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title></title>
	<link href="css/navbar.css" rel="stylesheet">
</head>
<body>

	<form>
		<span id="loading"></span>
		<div id="impResult" role="alert"></div>
		<br>
		<button type="button" id="impBtn"> 导 入  </button>
	</form>
	
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#impBtn").click(function(){
				$("#impBtn").attr("disabled", true);
				var choice = confirm("点击【确定】按钮开始导入。\n导入的电子文件稍后将转换为 pdf格式\n点击【取消】按钮取消本次导入！");
				if (choice) {
					
					$("#loading").html("<img alt='正在导入' src='img/loading.gif'>");
					$(this)
					$.get("imp.do?cmd=doImp&timestamp=" + new Date().getTime(), function(result) {
						$("#loading").html("");
						alert("本次归档导入完成");
						var s = result.split(",");
						$("#impResult").html( "本次同步项目级共 " + s[0] + "条，文件条目共 " + s[1] + "条，电子文件共"+s[2]+"条");
						$("#impBtn").attr("disabled", false);
					});

				}
			});
		});
	</script>
</body>
</html>