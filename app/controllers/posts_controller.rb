class PostsController < ApplicationController
 include RowHelper
 before_action :find_post, except: [:index, :new, :create]
	def index
		@array = []
	posts = Post.all.shuffle
	row_split(posts)
	end


    def new
 		@post = Post.new
 	end
 
 	def create
 		@post = Post.new(post_params)
 		if @post.save
 			redirect_to posts_path
 		else
 			render :new
 		end
 	end
 
 	private
 
 	def post_params
 		params.require(:post).permit(:title, :image)
 	end
 
    def find_post
		@post = Post.find(params[:id])
	end 
	
end