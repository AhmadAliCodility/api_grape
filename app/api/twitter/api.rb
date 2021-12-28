module Twitter
  class Api < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    resource :ahmad do
      get :ali do
        params
      end
    end

  end
end