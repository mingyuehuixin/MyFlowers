<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
        <title>Animated Form Switching with jQuery</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Expand, contract, animate forms with jQuery wihtout leaving the page" />
        <meta name="keywords" content="expand, form, css3, jquery, animate, width, height, adapt, unobtrusive javascript"/>
		<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon"/>
		<link rel="stylesheet" type="text/css" href="../static/css/style.css" />
		<script src="../static/js/cufon-yui.js" type="text/javascript"></script>
		<script src="../static/js/ChunkFive_400.font.js" type="text/javascript"></script>
		<script type="text/javascript">
		</script>
    </head>
    <body>
		<div class="wrapper">
			<div class="content">
				<div id="form_wrapper" class="form_wrapper">
					<form class="register active">
						<h3>Register</h3>
						<div class="column">
							<div>
								<label>First Name:</label>
								<input type="text" />
								<span class="error">This is an error</span>
							</div>
							<div>
								<label>Last Name:</label>
								<input type="text" />
								<span class="error">This is an error</span>
							</div>
						</div>
						<div class="column">
							<div>
								<label>Username:</label>
								<input type="text"/>
								<span class="error">This is an error</span>
							</div>
							<div>
								<label>Email:</label>
								<input type="text" />
								<span class="error">This is an error</span>
							</div>
							<div>
								<label>Password:</label>
								<input type="password" />
								<span class="error">This is an error</span>
							</div>
						</div>
						<div class="bottom">
							<div class="remember">
								<input type="checkbox" />
								<span>Send me updates</span>
							</div>
							<input type="submit" value="Register" />
							<a href="login.html" rel="login" class="linkform">You have an account already? Log in here</a>
							<div class="clear"></div>
						</div>
					</form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		

		<!-- The JavaScript -->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
		<script type="text/javascript">
        </script>
    </body>
</html>