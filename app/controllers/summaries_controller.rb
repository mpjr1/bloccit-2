class SummariesController < ApplicationController
  def index
  end

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
    @summary = Summary.find(params[:summary_id])
  end

  def create
        @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:body))
    if @summary.save
      redirect_to [@topic, @post, @summary], notice: "Summary was saved successfully."
    else 
      flash[:error] = "Error creating summary. Please try again."
      render :new
    end 
  end 

  def update
    @summary = Summary.find(params[:id])
    if @summary.update_attributes(params.require(:summary).permit(:body))
      redirect_to [@topic, @post, @summary]
    else 
      flash[:error] = "Error saving summary.  Please try again."
      render :edit
    end 
  end 
end 