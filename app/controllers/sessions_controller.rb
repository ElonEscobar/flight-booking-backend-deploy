class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create, :destroy]
    # before_action :authorize, only: [:destroy]

    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            
            render json: user, status: :created
        else
            render json: { error: ["Not authorized", "Invalid email or password"] }, status: :unauthorized
        end
    end

    def destroy
        if session[:user_id]
          session.delete(:user_id)
          head :no_content, status: :no_content
        else
          render json: {errors: ["Not authorized", "You are currently not logged in"]}, status: :unauthorized
        end
    end
end
