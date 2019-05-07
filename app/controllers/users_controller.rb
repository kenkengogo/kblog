class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
  end

  def created

  end

  def destroy
    user = User.blog.find(params[:id])
      if user.id == current_user.id
        user.blog.destroy
      end
  end
  
end
