class AddUniquessToRating < ActiveRecord::Migration
  def self.up
   add_index  :ratings , [:user_id, :comment_id], :unique => true
  end

  def self.down
  end
end
