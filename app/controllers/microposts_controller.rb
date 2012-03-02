class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy, :show, :rate_up]
  before_filter :authorized_user, :only => :destroy

  def show
		@user = User.find_by_id(current_user.id)
	  	@micropost = Micropost.find_by_id(params[:id])
  end

def create
    @micropost  = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end
 

  def destroy
    @micropost.destroy
    redirect_back_or root_path  
  end

def rate_up
   @micropost = Micropost.find(params[:id])
   @comment = @micropost.comments.find(params[:format])
   @comment.rating += 1;
  #@user_karma = @comment.user
   @comment.save;
   #user_karma.karma += 1;
   #user_karma.save!
   redirect_to @micropost
     end

def rate_down
  @micropost = Micropost.find(params[:id])
  @comment = @micropost.comments.find(params[:format])
   @comment.rating -= 1;
   @comment.save;
   
   redirect_to @micropost;
 end
    
  
  private

  def authorized_user
	@micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
	 

  end
end

