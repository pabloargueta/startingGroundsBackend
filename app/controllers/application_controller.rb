class ApplicationController < ActionController::API
  before_action :authorized


  def encode_token(payload)
    JWT.encode(payload, 'starting_grounds_is_awesome')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'starting_grounds_is_awesome', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: {message: 'Please log in'},
    status: :unauthorized unless logged_in?
  end



  def get_image_url
    # This method `get_imge_url` returns a callback or LAMBDA that
    # takes in an image/attachment, tries to return the URL for the
    # image, and if it runs into an error, returns an empty string
    -> (image) do
      begin
        url_for(image)
      rescue Module::DelegationError
        ""
      end
    end
  end


end
