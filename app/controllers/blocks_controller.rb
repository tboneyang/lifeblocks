class BlocksController < ApplicationController

#authenticate for deleting
	http_basic_authenticate_with name: "tom", password: "freska1234", except: [:index, :show]

#makes a new block object
	def new
		@block = Block.new
	end

#creates a block ; if saves, make new block; if not, just render 'new' view page.
	def create
		@block = Block.new(block_params)

		if @block.save
			redirect_to @block
		else
			render 'new'
		end

	end

#destroying article appropriately
	def destroy
		@block = Block.find(params[:id])
		@block.destroy

		redirect_to blocks_path
	end

#update action after edit is made
	def update
		@block = Block.find(params[:id])

		if @block.update(block_params)
			redirect_to @block
		else
			render 'edit'
		end
	end

#creates listing of blocks
	def index
		@blocks = Block.all
	end

#edits existing blocks
	def edit
		@block = Block.find(params[:id])
	end

#shows individual block
	def show
		@block = Block.find(params[:id])
	end

#defines strong block parameters so only appropriate data is passed
	private
		def block_params
			params.require(:block).permit(:title, :text)
		end

end
