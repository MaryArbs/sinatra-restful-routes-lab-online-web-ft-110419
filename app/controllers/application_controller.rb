class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do #index allows access to all the recipes in the database via the instance variable @recipes
   @recipes = Recipe.all
   erb :index
  end

  get '/articles/new' do
  erb :new
  end

  post '/articles' do
   @article = Article.create(:title => params[:title], :content => params[:content])
   redirect to "/articles/#{@article.id}"
  end

  get '/recipes/:id' do  #show instance of recipe
   @recipe = Recipe.find_by_id(params[:id])
   erb :show
  end

  delete '/articles/:id' do #delete a recipe
   @recipe = Recipe.find_by_id(params[:id])
   @recipe.delete
   redirect to '/recipes'
  end

  get '/recipes/:id/edit' do  #load edit form
    @recipe = Recipe.find_by_id(params[:id])
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
