class BlogsController < ApplicationController
  def index
    @blogs = Blog.includes(:student)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: 'Blog has been created successfully'
    else
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    debugger
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: 'Blog has been updated successfully'
    else
      render :edit 
    end
  end


  private

  def blog_params
    params.require(:blog).permit(:title, :content, :student_id)
  end


end
