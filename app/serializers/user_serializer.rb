class UserSerializer < ActiveModel::Serializer

  attributes :first_name, :last_name, :email, :horoscope, :avatar_url
  has_one :profile

  def avatar_url
    instance_options[:get_image_url].call(object.avatar)
  end
end
