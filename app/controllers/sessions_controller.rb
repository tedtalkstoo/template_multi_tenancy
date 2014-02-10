class SessionsController < Devise::SessionsController

  def create

    email = params[:user][:email]

    if user = User.find_by_email(email)

      # if user type = remember, then automatically remember me
      if user.login_type == "remember"
        params[:user].merge!(remember_me: 1)
      end

    end

    super
    
  end

end