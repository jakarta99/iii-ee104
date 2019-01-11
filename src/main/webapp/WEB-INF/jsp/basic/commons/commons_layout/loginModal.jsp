<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Login Modal-->
      <div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="login-modalLabel" aria-hidden="true" class="modal fade">
        <div role="document" class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 id="login-modalLabel" class="modal-title">Customer Login</h4>
              <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
              <form action="/login"  method="post" id="login-modal">
                <div class="form-group">
                  <input id="sourceUrl" type="hidden" name="sourceUrl" class="form-control">
                </div>  
                <div class="form-group">
                  <input id="volunteerApply" type="hidden" name="volunteerApply" class="form-control">
                </div>
                <div class="form-group">
                  <input id="email_modal" type="text" placeholder="username" name="username" class="form-control">
                </div>
                <div class="form-group">
                  <input id="password_modal" type="password" placeholder="password" name="password" class="form-control">
                </div>
                <p class="text-center">
                  <button class="btn btn-template-outlined"><i class="fa fa-sign-in"></i> Log in</button>
                </p>
              </form>
              <p class="text-center text-muted">Not registered yet?</p>
              <p class="text-center text-muted"><a href="/commons/sign-up/type"><strong>Register now</strong></a>! It is easy and done in 1 minute and gives you access to special discounts and much more!</p>
            </div>
          </div>
        </div>
      </div>
      <!-- Login modal end-->
      
      
      <script>
       	var parentUrl = parent.window.location.href.substring(10);
       	var index = parentUrl.indexOf("/");
      	$("#sourceUrl").val(parentUrl.substring(index));
      	console.log($("#sourceUrl").val());
      </script>