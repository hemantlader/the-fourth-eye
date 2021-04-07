var formValid = false;
var passValid= false;
//var emailValid= false;
var usernameValid= false;

// var nameValid = false;
// var signUpEmailValid = false;
var signUpPassValid = false;
var UpusernameValid =true
var nameValid = false;
var signUpFormValid = false;

function chkFormValid(){
	var formValid = false;
	if(usernameValid == true && passValid == true){//if(emailValid==true && passValid == true){
		formValid = true;
	}
	return formValid;
}
function chkSignUpFormValid(){
	var signUpFormValid = false;
	// if(signUpEmailValid==true && signUpPassValid == true && nameValid==true){
	// 	signUpFormValid = true;
	// }
	if(UpusernameValid ==true && signUpPassValid == true && nameValid==true){
		signUpFormValid = true;
	}
	return signUpFormValid;
}
function checkFill(some){
	var text=$(some).val();
	text=text.trim();
	if(text.length >0){
		$(some).addClass("filled");
	}
	else{
		$(some).removeClass("filled");
	}
}

///// Sign In Email check 
function checkSignInEmail(some){    
	checkFill(some);
	emailValid =  validateEmail(some);
}

/// Sign Up email check
function checkSignUpEmail(some){
	checkFill(some);
	signUpEmailValid =  validateEmail(some);
}
/// Sign in Username check
function checkSignInUsername(some){
	checkFill(some);
	usernameValid =  validateEmail(some);
}


/// Check name
function checkName(some){ //// Name Validater 
	checkFill(some);

	var name= $(some).val();
	name= name.trim();
	if(name.length==0){///Nothing entered
		$(some).val('');
		$(some).siblings('.msgIcon').removeClass('fa-check-circle').addClass('fa-exclamation-circle').css("color","#c62a2a");
		$(some).siblings(".msg").text("Name cannot be empty!").slideDown();
		$(some).removeClass('correct').addClass("wrong");
		nameValid = false;
	}
	else{
		var name_regex = /^[a-zA-Z ]*$/;
			if (name_regex.test(name)) {
			    $(some).siblings('.msg').slideUp();
			    $(some).siblings('.msgIcon').removeClass('fa-exclamation-circle').addClass('fa-check-circle').css("color","#005e00");
			    $(some).removeClass('wrong').addClass('correct');
			    nameValid = true;
			} else {
			    $(some).siblings('.msg').text("Only alphabets please !!").slideDown();
			    $(some).siblings('.msgIcon').removeClass('fa-check-circle').addClass('fa-exclamation-circle').css("color","#c62a2a");
			    $(some).removeClass('correct').addClass('wrong');
			    nameValid = false;
			}
	}
}

/// Check Usernamename
function checkUsername(some){ //// UserName Validater 
	checkFill(some);

	var name= $(some).val();
	name= name.trim();
	if(name.length==0){///Nothing entered
		$(some).val('');
		$(some).siblings('.msgIcon').removeClass('fa-check-circle').addClass('fa-exclamation-circle').css("color","#c62a2a");
		$(some).siblings(".msg").text("Username cannot be empty!").slideDown();
		$(some).removeClass('correct').addClass("wrong");
		usernameValid = false;
	}
	else{
		var name_regex = /^[a-zA-Z ]*$/;
			if (name_regex.test(name)) {
			    $(some).siblings('.msg').slideUp();
			    $(some).siblings('.msgIcon').removeClass('fa-exclamation-circle').addClass('fa-check-circle').css("color","#005e00");
			    $(some).removeClass('wrong').addClass('correct');
			    usernameValid = true;
			} else {
			    $(some).siblings('.msg').text("Only alphabets please !!").slideDown();
			    $(some).siblings('.msgIcon').removeClass('fa-check-circle').addClass('fa-exclamation-circle').css("color","#c62a2a");
			    $(some).removeClass('correct').addClass('wrong');
			    usernameValid = false;
			}
	}
}

/// Check Up Usernamename
function checkUpUsername(some){ //// UserName Validater 
	checkFill(some);

	var name= $(some).val();
	name= name.trim();
	if(name.length==0){///Nothing entered
		$(some).val('');
		$(some).siblings('.msgIcon').removeClass('fa-check-circle').addClass('fa-exclamation-circle').css("color","#c62a2a");
		$(some).siblings(".msg").text("Username cannot be empty!").slideDown();
		$(some).removeClass('correct').addClass("wrong");
		UpusernameValid = false;
	}
	else{
		var name_regex = /^[a-zA-Z ]*$/;
			if (name_regex.test(name)) {
			    $(some).siblings('.msg').slideUp();
			    $(some).siblings('.msgIcon').removeClass('fa-exclamation-circle').addClass('fa-check-circle').css("color","#005e00");
			    $(some).removeClass('wrong').addClass('correct');
			    UpusernameValid = true;
			} else {
			    $(some).siblings('.msg').text("Only alphabets please !!").slideDown();
			    $(some).siblings('.msgIcon').removeClass('fa-check-circle').addClass('fa-exclamation-circle').css("color","#c62a2a");
			    $(some).removeClass('correct').addClass('wrong');
			    UpusernameValid = false;
			}
	}
}


/// Sign Up pass check 
function checkSignUpPassword(some){
	checkFill(some);
	signUpPassValid = checkPass(some);
}

/////  Sign in pass check 
function checkSignInPassword(some){
	checkFill(some);
	passValid = checkPass(some);
}

function validateEmail(some) { //// Email Validate AND RETURN
    var email = $(some).val();
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/igm;
	if (re.test(email)) {
	    $(some).siblings('.msg').slideUp();
	    $(some).siblings('.msgIcon').removeClass('fa-exclamation-circle').addClass('fa-check-circle').css("color","#005e00");
	    $(some).removeClass('wrong').addClass('correct');
	    return true;
	} else {
	    $(some).siblings('.msg').text("Please enter a valid email address").slideDown();
	   $(some).siblings('.msgIcon').removeClass('fa-check-circle').addClass('fa-exclamation-circle').css("color","#c62a2a");
	    $(some).removeClass('correct').addClass('wrong');
	    return false;
	}
}

function checkPass(some){ ///validate Pass and return 
	var pass= $(some).val();
	pass=pass.trim();
	if(pass.length==0){///Nothing entered
		$(some).val('');
		$(some).siblings('.msg').text("Password cannot be empty!").slideDown();
		$(some).removeClass('correct').addClass("wrong");
		return false;
	}
	else{

	     var re1 = /[0-9]/;
	     var re2 = /[a-z]/;
	     var re3 = /[A-Z]/;


	     // if(pass.length < 6) {
	     //   $(some).siblings('.msg').text("Password must contain at least six characters!").slideDown();
	     //   $(some).removeClass('correct').addClass("wrong");
	     //   return false;
	     // }
	     if(pass.length < 4) {
	       $(some).siblings('.msg').text("Password must contain at least four characters!").slideDown();
	       $(some).removeClass('correct').addClass("wrong");
	       return false;
	     }
	     // else if(!re1.test(pass)) {
	     //   $(some).siblings('.msg').text("Password must contain at least one number (0-9)").slideDown();
	     //   $(some).removeClass('correct').addClass("wrong");
	     //   return false;
	     // }
	     // else if(!re2.test(pass)) {
	     //   $(some).siblings('.msg').text("Password must contain at least one lowercase letter (a-z)!").slideDown();
	     //   $(some).removeClass('correct').addClass("wrong");
	     //   return false;
	     // }
	     // else if(!re3.test(pass)) {
	     //    $(some).siblings('.msg').text("Password must contain at least one uppercase letter (A-Z)!").slideDown();
	     //    $(some).removeClass('correct').addClass("wrong");
	     //    return false;
	     // }
	     else{
	     	$(some).siblings('.msg').slideUp('fast');
	     	$(some).removeClass('wrong').addClass("correct");
	     	return true;
	     }
	}
}

$("#password").blur(function(){
	checkSignInPassword(this);
});
$("#email").blur(function(){
	checkSignInEmail(this);
});

$("#name").blur(function(){
	checkName(this);
});
$("#InUsername").blur(function(){
	checkUsername(this);
});
$("#UpUsername").blur(function(){
	checkUpUsername(this);
});
$("#signUpemail").blur(function(){
	checkSignUpEmail(this);
});
$("#signUppassword").blur(function(){
	checkSignUpPassword(this);
});

/// show pass for sign in 
function showSignInPassword(some){
	if($(some).hasClass('showing')){
		$("#password").prop("type","password");
		$(some).removeClass("showing").removeClass('fa-eye-slash').addClass('fa-eye');
	}
	else{
		$("#password").prop("type","text");
		$(some).addClass("showing").removeClass('fa-eye').addClass('fa-eye-slash');
	}
}
//sign up show pass 
function showSignUpPassword(some){
	if($(some).hasClass('showing')){
		$("#signUppassword").prop("type","password");
		$(some).removeClass("showing").removeClass('fa-eye-slash').addClass('fa-eye');
	}
	else{
		$("#signUppassword").prop("type","text");
		$(some).addClass("showing").removeClass('fa-eye').addClass('fa-eye-slash');
	}
}


$("#inSubmit").click(function(event){
	// event.preventDefault();
	// alert("prevented");
	onSubmitForm($("inSubmit"));
});
function onSubmitForm(some){
	checkSignInPassword($("#password"));
	//checkSignInEmail($("#email"));
	checkUsername($("#InUsername"));
	if(chkFormValid() == true){//// Form Validation Successful 
		
		//$("#signInMsg").text("Successfully Submitted.").css("color","#090").slideDown();
		//$("#signInForm")[0].reset();

		var username = $("#InUsername").val();
		var password = $("#password").val();
		var dataString = 'username=' + username +'&upass='+ password;
		$.ajax({
					url: 'signin.php',
					type: 'POST',
					data: dataString,
					success: function (data){
						console.log(data);
						if(data == "1")
						{
							$("#signInMsg").text("Successfully Loged in").css("color","#090").slideDown();	
							$("#signInForm")[0].reset();
							
							$("#signInForm").find('input').removeClass('filled correct wrong');							
							$("#signInForm").find('msg').val("");
							$("#signInForm").find('.msgIcon').removeClass('fa-eye-slash fa-exclamation-circle fa-check-circle');
							$("#signInForm").find('.msgIcon').css("color",'#333333');
							setTimeout(function(){
							$("#signinCloser").trigger('click');
							$("#signInMsg").text("").css("color","#090").slideUp();
							},1300);
							location.href = "chat.php";
						}
						else if(data == "2")
						{
							$("#signInMsg").text("Password incorrect").css("color","#900").slideDown();
							$("#password").removeClass('correct').addClass("wrong");
						}
						else if(data == "0")
						{
							$("#signInMsg").text("Invalid username and password").css("color","#900").slideDown();
			    			$("#InUsername").siblings('.msgIcon').removeClass('fa-check-circle').addClass('fa-exclamation-circle').css("color","#c62a2a");
			    			$("#InUsername").removeClass('correct').addClass('wrong');
			    			$("#password").removeClass('correct').addClass("wrong");
						}
					}
				})
				.done(function() {
					console.log("success");
				})
				.fail(function() {
					console.log("error");
				})
				.always(function() {
					console.log("complete");
				});
	}

	else{ ////Form validation Unsuccessful 
		$("#signInMsg").text("Remove form errors.").css("color","#900").slideDown();
	}
}


$("#upSubmit").click(function(event){
	// event.preventDefault();
	// alert("prevented");
	// onSignUpSubmitForm($("upSubmit"));
});

function onSignUpSubmitForm(some){
	checkName($("#name"));
	checkSignUpPassword($("#signUppassword"));
	checkUpUsername($("#UpUsername"));
	// checkSignUpEmail($("#signUpemail"));
	console.log(UpusernameValid);
	console.log(nameValid);
	console.log(signUpPassValid);
	
	if(chkSignUpFormValid() == true){ //// Form Validation Successful 
		var name = $("#name").val();
		var username = $("#UpUsername").val();
		var password = $("#signUppassword").val();
		
		var dataString = 'name='+ name + '&username=' + username +'&upass='+ password;
		$.ajax({
					url: 'signup.php',
					type: 'POST',
					data: dataString,
					success: function (data){
						//alert("Registered Successfully !"+ data);
						$("#signUpMsg").text("Successfully Registered. Log in to continue.").css("color","#090").slideDown();

						$("#signUpForm")[0].reset(function(){
						});
						$("#signUpForm").find('input').removeClass('filled correct wrong');							
							$("#signUpForm").find('msg').val("");
							$("#signUpForm").find('.msgIcon').removeClass('fa-eye-slash fa-exclamation-circle fa-check-circle');
							$("#signUpForm").find('.msgIcon').css("color",'#333333');
						setTimeout(function(){
							$("#signupCloser").trigger('click');
							$("#signUpMsg").text("").css("color","#090").slideUp();
						},1400);
						
					}
				})
				.done(function() {
					console.log("success");
				})
				.fail(function() {
					console.log("error");
				})
				.always(function() {
					console.log("complete");
				});

		
	}

	else{ ////Form validation Unsuccessful 
		$("#signUpMsg").text("Remove form errors.").css("color","#900").slideDown();
	}
}
function inSwitch(){
	$("#signUpModalCenter").modal("hide");
	$("#exampleModalCenter").modal("show");
}
function upSwitch(){
	$("#exampleModalCenter").modal("hide");
	$("#signUpModalCenter").modal("show");
}

$("body").keypress(function(e) {
    if(e.which === 13 && e.shiftKey === false ) {
      if($(".emoji-wysiwyg-editor").is(":focus"))
      {
          // alert('You pressed enter!' + $("#comment").val());
          e.preventDefault();
          var message = $(".emoji-wysiwyg-editor").text();
          message = message.trim(); 
          if(message.length){
          	$(".emoji-wysiwyg-editor").empty();
          			sendMessage(message);
          }
          // console.log(message.length);
      }
    }
});