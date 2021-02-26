class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    
  end
  

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: '不正なアクセスです'
    end
  
  end
  def update
    @user = User.find(params[:id])#どのユーザーを更新するのか見つけてきて@userに入れる
    if @user.update(user_params)#@userを更新する
    redirect_to user_path(@user), notice: '更新に成功しました'#ユーザーの詳細画面に戻る
    else
      render :edit
    end
  end
  
  private#privateを書くことによってuserscontrollerの中でしか呼び出せなく、セキュリティーに強くなる。
  def user_params#定番の記述
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end

