# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  homework_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Assignment < ActiveRecord::Base
  belongs_to :student, class_name: "User", foreign_key: "user_id"
  belongs_to :homework
  has_many :answers
end
