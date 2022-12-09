class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    skip_before_action :authorize, only: [:create, :show]
    wrap_parameters format: []
    
    def index
        render json: User.all
    end


    def show
        @user = User.find_by(id: session[:user_id])
        render json: @user
    end

    # def show
    #     user = User.find_by(id: session[:user_id])
    #     if user
    #         render json: user
    #     else
    #         render json: { error: "Not authorized" }, status: :unauthorized
    #     end
    # end

    def create
        new_user = User.create!(new_user_params)
        if new_user.valid?
            render json: new_user, status: :created
        else
            render json: { errors: new_user.errors.full_messages }, status: :unprocessable_entity
        end
        
    end

    

    private

    def new_user_params
        params.permit(:first_name, :last_name, :email, :gender, :age, :password, :password_confirmation)
    end

    def record_not_found
        render json: { errors: ['User not found'] }, status: :not_found
    end

    # def authorize
    #     return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    # end
end
