class PicsController < ApplicationController
	before_action :find_pic, only: [:show, :destroy, :edit, :update, :upvote]

	def index
		if params[:search]
			@pics = Pic.where('title LIKE ?', "%#{params[:search]}%")
		else
			@pics = Pic.all.order("created_at DESC")
		end
	end

	def show
	end

	def new
		if current_user
			@pic = current_user.pics.build
		else
			redirect_to login_path, notice: "Please sign in before posting"
		end
	end

	def create
		@pic = current_user.pics.build(pic_params)
			if @pic.save
				redirect_to @pic, notice: "Created successfully"
			else
				render "new"
			end	
	end

	def edit
	end

	def update
		if @pic.update(pic_params)
			redirect_to @pic, notice: "Updated Pic!"
		else
			render 'edit'
		end
	end

	def destroy
		@pic.destroy
		redirect_to root_path, notice: "Pic Deleted!"
	end

	def upvote
		if current_user
			@pic.upvote_by current_user
			redirect_back fallback_location: root_path
		else
			redirect_to login_path, notice: "Please sign in before upvoting"
		end
	end

	private
		def pic_params
			params.require(:pic).permit(:title, :description, :image)
		end

		def find_pic
			@pic = Pic.find(params[:id])
		end



end
