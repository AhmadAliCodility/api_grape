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
      song = Song.order('created_at DESC')
      present song
    end

    desc 'create a new song'
    params do
      requires :name, type: String
      requires :singer, type: String
      requires :rating, type: Float
    end
    post do
      Song.create!({ name: params[:name], singer: params[:singer], rating: params[:rating] })
    end

    desc 'Return a specific song'
    route_param :id do
      get do
        song = Song.find(params[:id])
        present song
      end
    end

    desc 'Update a specific song'
    route_param :id do
      put do
        Song.find(params[:id]).update({ rating: params[:rating] })
      end
    end

    desc 'Delete a specific song'
    route_param :id do
      delete do
        song = Song.find(params[:id])
        song.destroy
      end
    end


  end

end
