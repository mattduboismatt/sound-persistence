class User

  include ApplicationHelper

  attr_reader :first_name, :last_name, :gender, :favorite_color, :date_of_birth

  def initialize(user_params)
    @first_name = user_params.fetch(:first_name,nil)
    @last_name = user_params.fetch(:last_name,nil)
    @gender = user_params.fetch(:gender,nil)
    @favorite_color = user_params.fetch(:favorite_color,nil)
    @date_of_birth = date_to_str(user_params.fetch(:date_of_birth,nil))
  end

  def render
    "#{@last_name} #{@first_name} #{@gender} #{@favorite_color} #{date_of_birth}"
  end

end