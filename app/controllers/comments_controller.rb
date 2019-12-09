class CommentsController < ApplicationController
  def new
    @comment = Comment.all
  end

  def create
    if already_commented.nil? == true
      @comment = Comment.new(comments_form)
      @comment.ps_id = params[:id]
      @comment.petowner_id = current_petowner.id
      @comment.save

      if @comment.save
        redirect_to petsitter_path(page_id)
      end
    else
      flash[:alert] = "Vous avez déjà laissé un commentaire à ce Pet sitter !"
      redirect_to petsitter_path(page_id)
    end
  end

  def index
  end

  private

  def comments_form
    params.permit(:title, :content)
  end

  def page_id
    params.require(:id)
  end

  def already_commented
    Comment.find_by(ps_id: params[:id], petowner_id: current_petowner.id)
  end
end
