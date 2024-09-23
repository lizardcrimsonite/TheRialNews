class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully added.'
    else
      flash.now[:alert] = 'Unable to add comment.'
      render 'posts/show' # o la vista que desees mostrar
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user || current_user.admin?
      @comment.destroy
      redirect_to post_path(@comment.post), notice: 'Comment was successfully deleted.'
    else
      redirect_to post_path(@comment.post), alert: 'You are not authorized to delete this comment.'
    end
  end
  

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def authorize_admin!
    redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user.admin?
  end
end
