class PostsController < ApplicationController
  before_action :load_language

  def index
  end

  def new
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new post_params.merge! language_id: @language.id
    if @post_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @post_form = PostForm.new id: params[:id], language_id: @language.id
  end

  def update
    @post_form = PostForm.new post_params.merge! language_id: @language.id,
      id: params[:id]
    if @post_form.update
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post_form).permit(:status, :translation_title, :translation_content)
      .merge! user_id: current_user.id
  end

  def load_language
    @language = Language.find_by(short_name: params[:language]) || Language.vietnamese
  end
end
