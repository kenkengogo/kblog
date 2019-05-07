class BlogsController < ApplicationController
  before_action :authenticate_user!, only: :search
 

 

  def index
    @blogs = Blog.order('created_at DESC').page(params[:page])
  end

  def new
    @blog = Blog.new
   

  end

  def show

  end

  def create
    Blog.create(title: create_params[:title],text: create_params[:text], user_id: current_user.id)
    redirect_to action: :index
    
  end


    def edit
      @blog = Blog.find(params[:id])
     
      
    end

    def update
      @blog = Blog.find(params[:id])
      if @blog.user_id == current_user.id
        @blog.update(create_params)
      end
      redirect_to action: :index

    end



  def destroy
    blog = Blog.find(params[:id])
      if blog.user_id == current_user.id
        blog.destroy
      end
      redirect_to action: :index

  end

  

  private
  def blog_params
    params.permit(:title, :text)
  end


  def create_params
    params.require(:blog).permit(:title, :text)

  end

  
end
