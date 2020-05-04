class PostsController < ApplicationController
before_action :authenticate_account!, except: [ :index, :show ]
before_action :set_post, only: [:show]



def index
  @posts = Post.all
end

def show
  @post = Post.find(params[:id])
end

def new
  @community = Community.find(params[:community_id])
  @post = Post.new
end

def create

    @post = Post.new (post_params)
    @post.account_id = current_account.id

     if @post.save
       redirect_to community_path(@post.community_id)
     else
       render :new
      end
  end
#   @community = Community.new(community_params)
#
#   respond_to do |format|
#     if @community.save
#       format.html { redirect_to @community, notice: 'Communite was successfully created.' }
#       format.json { render action: 'show', status: :created, location: @community }
#     else
#       format.html { render action: 'new' }
#       format.json { render json: @community.errors, status: :unprocessable_entity }
#     end
#   end
# end

private

def set_post
  @post = Post.find(params[:id])
end

def post_params
   params.require(:post).permit(:title, :body)
end

end
