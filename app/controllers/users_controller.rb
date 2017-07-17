class UsersController < ApplicationController
    def create
        @user = User.create(post_params)
    end

    private

    def post_params
        params.require(:user).permit(:email, :name, :password, :password_confirm)
    end
end
