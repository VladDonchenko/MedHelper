module CommentsHelper
  def recommendent_count(bool)
    @expert.comments.where(recommendation: bool).count
  end
end
