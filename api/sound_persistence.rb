module SoundPersistence
  class API < Grape::API
    format :json
    prefix :records

    desc "Create a record."
    params do
      requires :record, type: String, desc: "User data input."
    end
    post do

    end

    desc "Output 1 – sorted by gender, then last name ascending"
    get :gender do

    end

    desc "Output 2 – sorted by birth date, ascending"
    get :birth_date do

    end

    desc "Output 3 – sorted by last name, descending"
    get :name do

    end

  end
end