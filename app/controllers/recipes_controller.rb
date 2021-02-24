class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save#データベースに保存
    redirect_to recipe_path(@recipe)#投稿されたレシピの詳細画面にいく
  end

  def edit
    @recipe = Recipe.find(params[:id])#編集したいレシピの一つを@recipeという変数に入れる
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)#更新したレシピの詳細画面に戻る
  end
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
   end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image)#タイトル、ボディ、写真を許可してcreateで保存
  end
end
