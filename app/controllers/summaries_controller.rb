class SummariesController < ApplicationController
  
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    if @summary = @post.create_summary(params.require(:summary).permit(:name, :description))
     redirect_to topic_post_summary_path(@topic, @post), notice: "Summary was saved successfully."
    else 
      flash[:error] = "Error creating summary. Please try again."
      render :new
    end 
  end 

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    if @summary.update_attributes(params.require(:summary).permit(:name, :description))
      redirect_to [@topic, @post, @summary]
    else 
      flash[:error] = "Error saving summary.  Please try again."
      render :edit
    end 
  end 
  
end