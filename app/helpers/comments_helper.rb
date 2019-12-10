module CommentsHelper
  def show_comments
    Petsitting.find_by(petsitter_id: params[:id],petowner_id: current_petowner.id)
  end
end
