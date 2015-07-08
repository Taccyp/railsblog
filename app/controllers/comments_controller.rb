class CommentsController < Actioncontroller::base

def index 
  @comments = Comment.all
end

def new
end

def create 
 @comments = Comment.new(post_params)
  @post.user_id = session[:user_id]
 if @comment.save
  redirect_to @post
end
end





end
