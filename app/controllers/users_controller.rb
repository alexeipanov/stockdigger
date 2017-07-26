class UsersController < ApplicationController
    def create
        @user = User.create!(post_params)
    end

    def me
        render json: current_user
    end

    def show

    end

    private

    def post_params
        # params.permit(:email, :name, :password, :password_confirm)
        ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:email, :name, :password, :password_confirm])
    end
end
