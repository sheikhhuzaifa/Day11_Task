# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @posts = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path }
      else
        format.html { render 'new' }
      end
      format.js
    end
  end

  def edit
    @posts = Post.find(params[:id])
  end

  def update
    @posts = Post.find(params[:id])
    if @posts.update(post_params)
      redirect_to @posts
    else
      render 'edit'
    end
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
