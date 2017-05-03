module Homeland::Press::Admin
  class PostsController < ::Admin::ApplicationController
    layout '/layouts/admin'

    before_action :set_post, only: [:destroy, :published, :rejected]

    def index
      @posts = Post.includes(:user).order("id desc").page(params[:page])
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_path
    end

    def published
      @post.published!
      redirect_to admin_posts_path
    end

    def rejected
      @post.rejected!
      redirect_to admin_posts_path
    end

    private
    def set_post
      @post = Post.find_by_slug!(params[:id])
    end
  end
end
