class UsersController < ApplicationController
  def index
    users = User.all
    if params[:name].present?
      users = users.get_by_name params[:name]
    end
    if params[:gender].present?
      users = users.get_by_gender params[:gender]
    end
    if params[:hometown].present?
      users = users.get_by_hometown params[:hometown]
    end
    @users = users.page(params[:page]).per(5)

  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def edit
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(users_params)
    if @user.save
      # 会員登録の場合は同時にログインしたいので下の1行が必要
      # session[:user_id] = @user.id
      flash[:notice] = "会員登録完了"
      redirect_to("/")
  else
      reder("users/new")
  end
  end
  def update
    @user = User.find(params[:id]) 
    @user.update_attributes(users_params)
    redirect_to @user
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def users_params
    params.require(:user).permit(:name, :gender, :birthday, :hometown, :remarks)
  end
end
