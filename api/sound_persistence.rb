class UserEntity < Grape::Entity

  include ApplicationHelper

  expose :last_name
  expose :first_name
  expose :gender
  expose :favorite_color
  expose :date_of_birth
end

class DirectoryEntity < Grape::Entity
  expose :users, using: UserEntity
end

module SoundPersistence
  class API < Grape::API
    format :json
    prefix :records

    helpers do
      def directory
        controller.directory
      end
      def controller
        controller ||= new_controller
      end
      def new_controller
        controller = Controller.new
        controller.seed($seed_directory)
        controller
      end
    end

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
      present directory, with: DirectoryEntity
    end

    desc "Output 2 – sorted by birth date, ascending"
    get :birthdate do
      directory.sort_by_date_of_birth!
      present directory, with: DirectoryEntity
    end

    desc "Output 3 – sorted by last name, descending"
    get :name do
      directory.sort_by_last_name!
      present directory, with: DirectoryEntity
    end

  end
end