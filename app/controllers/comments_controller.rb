class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_params)
    if @comment.save
      redirect_to [@post.topic, @post], notice: "Comment was saved successfully."
    else 
      flash[:error] = "Error creating comment. Please try again."
      render :new
    end 
  end 
  
  def edit
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
  end
  
   def update
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
     
    authorize @comment

     if @comment.update_attributes(comments_params)
      flash[:notice] = "Comment was updated."
       redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error updating the comment. Please try again."
      render :new
    end
   end
  
   def destroy
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
 
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      #redirect_to [@post.topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      #redirect_to [@post.topic, @post]
    end
     
      respond_to do |format|
        format.html
        format.js
      end
   end
  
  private
  
  def comments_params
    params.require(:comment).permit(:body)
  end
  
end
