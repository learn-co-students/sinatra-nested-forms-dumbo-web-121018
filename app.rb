require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      # @ship1 = Ship.new(params["pirate"]["ship1"])
      # @ship2 = Ship.new(params["pirate"]["ship2"])
      params[:pirate][:ships].each do |details|
        # binding.pry
        Ship.new(details)
      end
      #
      @ships = Ship.all
      #
      erb :'pirates/show'
    end
  end
end
