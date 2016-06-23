class CommentsController < ApplicationController
  def create
      @tack = Tack.find(params[:tack_id])
      c_params = comment_params
      c_params[:user_id] = current_user.id
      @comment = @tack.comments.create(c_params)
      redirect_to tack_path(@tack)
    end

    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end

end
