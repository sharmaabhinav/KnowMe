class Api::V1::UsersController < ApplicationController
  def index
    render_200(@users.active)
  end

  def show
    if @user.present?
      render_200(@user)
    else
      render_404("#{resource_name} was not found")
    end
  end

  def create
    if @user.save
      render_200(@user)
    else
      render_422(@user.errors)
    end
  end
  
  def update
    if @user.present?
      if @user.update(user_params)
        render_200(@user)
      else
        render_422(@user.errors)
      end
    else
      render_404("#{resource_name} was not found")
    end
  end
  

  def destroy
    if @user.present?
      @user.active = false
      @user.save
    else
      render_404("#{resource_name} was not found")
    end
  end

  private

  def user_create_params
    params.permit(:username, :password)
  end
end
