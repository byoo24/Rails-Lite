class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if user
            # session[:session_token] = user.reset_session_token!
            login!(user)
            
            redirect_to user_url(user)
        else
            flash[:errors] = ["Invalid email and/or password"]
            render :new
        end
    end

    def destroy
        # user = User.find_by(session_token: session[:session_token])
        # user.reset_session_token!
        # session[:session_token] = nil
        # user = nil
        logout!

        redirect_to new_session_url
    end

end