class PostForm
  include ActiveModel::Model

  attr_accessor :status, :translation_title, :translation_content, :language_id, :user

  validates :status, presence: true
  validates :translation_title, presence: true
  validates :translation_content, presence: true

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

  private
  def create_post
    @post = Post.create! status: status
  end

  def create_post_translation
    PostTranslation.create! post: @post, user: user, language_id: language_id,
      title: translation_title, content: translation_content
  end
end
