Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # mount MusicStore::Base => '/'
  # mount MusicStore::V1::Song => '/'

  mount MusicStore::Base => '/'
  # mount Twitter::Api => '/'
  mount Converter::Currency => 'api'
  namespace 'api' do
    namespace 'v1' do
      resources :articles
    end
  end
end
