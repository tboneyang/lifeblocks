class CommentsController < ApplicationController

	#authenticate deleting comments
	http_basic_authenticate_with name: "tom", password: "freska1234", only: :destroy

	#creating comment
	def create
		@block = Block.find(params[:block_id])
		@comment = @block.comments.create(comment_params)
		redirect_to block_path(@block)
	end

	def destroy
		@block = Block.find(params[:block_id])
		@comment = @block.comments.find(params[:id])
		@comment.destroy
		redirect_to block_path(@block)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
