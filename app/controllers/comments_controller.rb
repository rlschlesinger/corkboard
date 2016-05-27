class CommentsController < ApplicationController
  def create
      @tack = Tack.find(params[:tack_id])
      @comment = @tack.comments.create(comment_params)
      redirect_to tack_path(@tack)
    end

    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end

end
