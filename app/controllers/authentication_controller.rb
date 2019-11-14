class AuthenticationController < ApplicationController
 def sign_in
    @user = User.new
  end
 def register
   @user = User.new(params[:user])

   if @user.valid?
     @user.save
     session[:user_id] = @user.id
     flash[:notice] = 'Welcome.'
     redirect_to :root
   else
     render :action => "new_user"
   end
 end
 def new_user
   @user = User.new
 end

 def login
    username_or_email = params[:user][:email]
    password = params[:user][:password]

    if username_or_email.rindex("@")
      printf("In email")
      email=username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
    end

    if user
      session[:userid] = user.userid
      flash[:notice] = 'Welcome.'
      redirect_to :root
    else
	  flash.now[:error] = 'Unknown user. Please check your username and password.'
    puts "in auth controller login user has not found in DB."
    redirect_to :root
    end

  end

 def signed_out
  session[:userid] = nil
  flash[:notice] = "You have been signed out."
 end
end
