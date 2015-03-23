class Directory

  attr_reader :users

  def initialize(users = [])
    @users = users
  end

  def add_user(user)
    @users << user
  end

  def sort_by_gender
    @users.sort_by{ |u| [u.gender, u.last_name] }
  end

  def sort_by_date_of_birth
    @users.sort_by{ |u| u.date_of_birth}
  end

  def sort_by_last_name
    @users.sort_by{|u| u.last_name}.reverse
  end
end