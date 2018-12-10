class PostsController < ApplicationController
	# before_action :authenticate_user!
	# before_action :authenticate_stylist!




	def index
		@posts = Post.all

    end

    def rank
        @rank = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    end

    def new
    	@post = Post.new
    end

    def show 
        @post = Post.find(params[:id])

    end

    def create
        post = Post.new(post_params)
        post.stylist_id = current_stylist.id
        post.save
        redirect_to root_path
    end




    private
    def post_params
    params.require(:post).permit(:post_name, :post_opinion, :post_image, :stylist_id)
    end


end

