module SoundPersistence
  class API < Grape::API
    format :json
    prefix :records

    c = Controller.new
    c.seed($seed_directory)
    directory = c.directory

    desc "Create a record."
    params do
      requires :record, type: String, desc: "User data input."
    end
    post do
      line_parser = LineParser.new(params[:record])
      user = User.new(line_parser.user_params)
      directory.add_user(user)
      return "Added record.\n"
    end

    desc "Output 1 – sorted by gender, then last name ascending"
    get :gender do
      directory.sort_by_gender!
      return directory.inspect
    end

    desc "Output 2 – sorted by birth date, ascending"
    get :birthdate do
      directory.sort_by_date_of_birth!
      return directory.inspect
    end

    desc "Output 3 – sorted by last name, descending"
    get :name do
      directory.sort_by_last_name!
      return directory.inspect
    end

  end
end