module CommentsHelper
  def show_comments
    Petsitting.find_by(petsitter_id: params[:id],petowner_id: current_petowner.id)
  end

  def comments_petsitter(id)
    Comment.where(ps_id: id)
  end
end
