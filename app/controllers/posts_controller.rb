class PostsController < ApplicationController
  def index
  end

  def new
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new post_params
    if @post_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post_form).permit(:status, :translation_title, :translation_content,
      :language_id).merge! user: current_user
  end
end
