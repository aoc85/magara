class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    @house = House.find(params[:house_id])
  end

  def create
    @comment = Comment.new comment_params
    @comment.user_id = current_user.id
    @comment.house_id = comment_params[:house_id]
    if @comment.save
      flash[:notice] = "Thanks for your comment"
      redirect_back fallback_location: houses_url
    else
      flash[:error] = "Unable to save your comment"
      redirect_back fallback_location: houses_url
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if author? and @comment.update comment_params
      flash[:success] = "Comment updated"
      redirect_to House.find(@comment.house_id)
    else
      flash[:error] = "Unable to update your comment"
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if author? and @comment.destroy
      flash[:success] = 'Comment has been deleted successfully'
      redirect_back fallback_location: houses_url
    else
      flash[:error] = "Unable to delete your comment"
      redirect_back fallback_location: houses_url
    end
  end

  private

  def author?
    true if @comment.user == current_user
  end


  def comment_params
    params.require(:comment).permit :content, :house_id, :comment_id
  end

end
