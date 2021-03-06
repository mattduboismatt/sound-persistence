class Directory

  include ApplicationHelper

  attr_reader :users

  def initialize(users = [])
    @users = users
  end

  def add_user(user)
    @users << user
  end

  def sort_by_gender!
    @users.sort_by!{ |u| [u.gender, u.last_name, u.first_name] }
  end

  def sort_by_date_of_birth!
    @users.sort_by!{ |u| [str_to_date(u.date_of_birth), u.last_name, u.first_name] }
  end

  def sort_by_last_name!
    @users.sort_by!{|u| [u.last_name, u.first_name] }.reverse!
  end

  def render
    rendering = ""
    @users.each do |u|
      rendering << u.render
      rendering << "\n" unless @users.last == u
    end
    rendering
  end

end