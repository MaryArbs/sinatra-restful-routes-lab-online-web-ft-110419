class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/get' do
  @recipes = Recipe.all
  erb :index
end

end
