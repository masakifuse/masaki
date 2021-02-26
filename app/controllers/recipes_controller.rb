class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
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
   if @recipe.save#データベースに保存
    redirect_to recipe_path(@recipe), notice: '投稿に成功しました。'#投稿されたレシピの詳細画面にいく
   else
    render :new
   end
  end

  def edit
    @recipe = Recipe.find(params[:id])#編集したいレシピの一つを@recipeという変数に入れる
    if @recipe.user != current_user
      redirect_to recipes_path, alert: '不正なアクセスです'#javascript使用で環境構築失敗
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe), notice: '更新に成功しました'#更新したレシピの詳細画面に戻る
    else
      render :edit
    end
  end
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path#javascript使用で環境構築失敗
   end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image)#タイトル、ボディ、写真を許可してcreateで保存
  end
end
