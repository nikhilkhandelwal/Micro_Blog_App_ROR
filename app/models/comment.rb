class Comment < ActiveRecord::Base
	belongs_to :micropost
default_scope :order => 'comments.rating DESC'	
end

