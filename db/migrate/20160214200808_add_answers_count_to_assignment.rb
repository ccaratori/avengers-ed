class AddAnswersCountToAssignment < ActiveRecord::Migration
  def self.up
   add_column :assignments, :answers_count, :integer, default: 0
 end

 def self.down
   remove_column :assignments, :answers_count
 end
end
