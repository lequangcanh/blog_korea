module PostHelper
  def language_select
    Language.all.collect {|language| [language.lang, language.id]}
  end

  def status_select
    Post.statuses.keys.collect {|stt| [stt, stt]}
  end
end
