class UsersController < ApplicationController
    def create
        @user = User.create(post_params)
    end

    def me
        render json: current_user
    end

    def show

    end

    private

    def post_params
        params.require(:user).permit(:email, :name, :password, :password_confirm)
    end
end
