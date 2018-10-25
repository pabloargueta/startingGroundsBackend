class ProfilesController < ApplicationController

  def profiles
   compatibility_array = User.all.select {|user| user.horoscope == params[:horoscope][:compatibility]}
      reduced_array = compatibility_array.sample(6)
      render json: {profiles: reduced_array}
    end



    private
      def compatibility_params
      params.require(:horoscope).permit(:compatibility)
    end

end