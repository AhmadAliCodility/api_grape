class MusicStore::V1::Songs < Grape::API
  version 'v1', using: :path
  format :json
  prefix :api

=begin
  resource :ali do
    get :ahmad do
      params
    end
  end
=end



  resource :songs do
    desc 'Return list of songs'
    get do
      song = Article.order('created_at DESC')
      present song
    end
  end
  # articles = Article.order('created_at DESC')
end
