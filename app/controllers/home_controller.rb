class HomeController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def create
    post = Post.new
    post.title = params[:title]
    post.content = params[:content]
    post.save
    redirect_to '/'
  end
  
  def create_comment
    comment = Comment.new
    comment.post_id = params[:id_of_post]
    comment.content = params[:content]
    comment.save
    redirect_to '/'
  end
  
  def edit_comment
    @comment = Comment.find(params[:comment_id])
  end
    
  def update_comment
    comment = Comment.find(params[:comment_id])
    comment.content = params[:content]
    comment.save
    redirect_to '/'
  end

  def delete_comment
    comment = Comment.find(params[:comment_id])
    comment.destroy
    redirect_to '/'
  end
  
end
