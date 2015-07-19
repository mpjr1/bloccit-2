class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    if @comment = @post.comments.new(comments_params)
      redirect_to topic_post_comments_path(@topic, @post), notice: "Comment was saved successfully."
    else 
      flash[:error] = "Error creating comment. Please try again."
      render :new
    end 
  end 
  
   def destroy
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end
  
  private
  
  def comments_params
    params.require(:comment).permit(:body)
  end
  
end
