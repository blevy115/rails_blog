class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.create(params.require(:blog).permit(:title, :content))
    if @blog.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(params.require(:blog).permit(:title, :content))
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to root_path
  end
end
