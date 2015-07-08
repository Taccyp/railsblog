class  PostsController < ActionController::Base

def index
	@posts = Post.all 
end

def new
end

def create 
  @post = Post.new(post_params)
  @post.user_id = session[:user_id]
  if @post.save
    redirect_to post_path @post
  else
  direct_to new_post_path
 end
end

def show
  @post = Post.find(params[:id])
end


def post_params
    params.require(:post).permit(:content)
  end


end