class CommentsController < ApplicationController
  def create
  @micropost = Micropost.find(params[:micropost_id])
  @comment = @micropost.comments.build(params[:comment])
  @comment.save
redirect_to @micropost
  end

  def ajaxdestroy
  new_rating = self.rating +1
  update_attribute :rating, new_rating
  end


  def destroy
  end

end
