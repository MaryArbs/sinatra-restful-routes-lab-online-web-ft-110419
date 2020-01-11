class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do #index
   @recipes = Recipe.all
   erb :index
  end

  get '/recipes/:id' do  #show instance of recipe
   @recipe = Recipe.find_by_id(params[:id])
   erb :show
  end

  delete '/articles/:id' do #delete a recipe
   @article = Article.find_by_id(params[:id])
   @article.delete
   redirect to '/articles'
  end

  get '/recipes/:id/edit' do  #load edit form
    @recipee = Recipe.find_by_id(params[:id])
    erb :edit
  end

#   patch '/articles/:id' do #edit action
#   @recipe = Recipe.find_by_id(params[:id])
#   @recipe.name = params[:title]
#   @recipe.ingredients = params[:ingredients]
#   @recipe.cook_time = params[:cook_time]
#   @recipe.save
#   redirect to "/articles/#{@recipe.id}"
# end
end
