class SummariesController < ApplicationController
  
  def show
    @post = Post.find(params[:post_id])
    @summary = @post.summary
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
   # authorize @summary
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:title, :body))
     #@summary.user = current_user
     #authorize @summary
     if @summary.save
       flash[:notice] = "Summary was saved."
       redirect_to [@topic, @post, @summary]
     else
       flash[:error] = "There was an error saving the summary. Please try again."
       render :new
     end
   end
  
  def edit
    @topic = Topic.find(params[:topic_id])
   @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:summary])
  # authorize @summary
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:summary])
    #authorize @summary
     if @summary.update_attributes(params.require(:summary).permit(:title, :body))
       flash[:notice] = "Summary was updated."
       redirect_to [@topic, @post, @summary]
     else
       flash[:error] = "There was an error saving the summary. Please try again."
       render :edit
     end
   end
end
