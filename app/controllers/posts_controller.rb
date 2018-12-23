class PostsController < ApplicationController
	# before_action :authenticate_user!
	# before_action :authenticate_stylist!
    before_action :logged_in , only: [:index, :rank, :show]
    before_action :authenticate_stylist!, :only => [:create, :edit]
    impressionist only: [:show]




	def index
		@posts = Post.all
        @men = Post.where(category: 0 )
        @short = Post.where(category: 1)
        @medium = Post.where(category: 2 )
        @long = Post.where(category: 3 )

    end

    def rank
        @rank = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(20).pluck(:post_id))
        @most_viewed = Post.order('impressions_count DESC').take(10)
    end

    def new
    	@post = Post.new
    end

    def show 
        @post = Post.find(params[:id])
        @post_comment = PostComment.new
        impressionist(@post, nil, unique: [:session_hash])

    end

    def create
        post = Post.new(post_params)
        post.stylist_id = current_stylist.id
        post.save
        redirect_to posts_path
    end

    def edit
        @post = Post.find(params[:id])
        


    end 

    def update
         @post = Post.find(params[:id])
         @post.update(post_params)
         redirect_to post_path(@post.id)
        
    end




    private
    def post_params
    params.require(:post).permit(:post_name, :post_opinion, :post_image, :stylist_id, :category)
    end

    def logged_in
        unless user_signed_in? || stylist_signed_in?
            redirect_to root_path
            
        end
        
    end

    




end

