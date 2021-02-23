class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    
  end
  

  def edit
    @user = User.find(params[:id])
  
  end
  def update
    @user = User.find(params[:id])#どのユーザーを更新するのか見つけてきて@userに入れる
    @user.update(user_params)#@userを更新する
    redirect_to user_path(@user)#ユーザーの詳細画面に戻る
  end
  private#privateを書くことによってuserscontrollerの中でしか呼び出せなく、セキュリティーに強くなる。
  def user_params#定番の記述
    params.require(:user).permit(:username, :email, :profile_image)
  end
end

