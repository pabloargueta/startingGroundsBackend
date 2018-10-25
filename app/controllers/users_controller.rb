class UsersController < ApplicationController

  skip_before_action :authorized, only: [:create]
  def create
    user = User.create(user_params)
    # user.id = 1
    if user.valid?
      token = encode_token(user_id: user.id)
      render json: { user: user,
        jwt: token }, status: :created
      else
        render json: {error: 'failed to create user'}, status: :not_acceptable
      end
    end

    def profile

      render json: current_user, get_image_url: get_image_url
    end



    def attachImage
      current_user.avatar.attach(params[:image])
      render json: {image: url_for(current_user.avatar)}
    end

    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
    end

    def image_params
      params.permit(:image)
    end

  




end
