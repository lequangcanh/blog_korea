class PostForm
  include ActiveModel::Model

  attr_accessor :status, :translation_title, :translation_content, :language_id, :user_id,
    :post, :post_translation

  validates :status, presence: true
  validates :translation_title, presence: true
  validates :translation_content, presence: true

  def initialize args = {}
    if args[:id]
      @post = Post.find_by id: args[:id]
      @post_translation = @post.post_translations.find_by language_id: args[:language_id]
      @status = args[:status] || @post.status
      @translation_title = args[:translation_title] || @post_translation&.title
      @translation_content = args[:translation_content] || @post_translation&.content
      @language_id = args[:language_id] || @post_translation.language_id
      @user_id = args[:user_id] || @post_translation&.user&.id
    else
      super args
    end
  end

  def persisted?
    @post&.persisted?
  end

  def id
    @post&.id
  end

  def save
    ActiveRecord::Base.transaction do
      if valid?
        create_post
        create_post_translation
        true
      else
        false
      end
    end
  rescue
    false
  end

  def update
    ActiveRecord::Base.transaction do
      if valid?
        update_post
        if @post_translation
          update_post_translation
        else
          create_post_translation
        end
        true
      else
        false
      end
    end
  rescue
    false
  end

  private
  def create_post
    @post = Post.create! status: status
  end

  def create_post_translation
    @post.post_translations.create! user_id: user_id, language_id: language_id,
      title: translation_title, content: translation_content
  end

  def update_post
    @post.update! status: status
  end

  def update_post_translation
    @post_translation.update! user_id: user_id, language_id: language_id,
      title: translation_title, content: translation_content
  end
end
