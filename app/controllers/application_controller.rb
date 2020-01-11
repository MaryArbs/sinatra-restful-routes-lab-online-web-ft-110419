class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
   @recipes = Recipe.all
   erb :index
  end

  get '/recipes/:id' do  #show
   @recipe = Recipe.find_by_id(params[:id])
   erb :show
  end

  delete '/articles/:id' do #delete action
   @article = Article.find_by_id(params[:id])
   @article.delete
   redirect to '/articles'
  end

end
