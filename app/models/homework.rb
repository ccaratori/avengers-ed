# == Schema Information
#
# Table name: homeworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  question   :text             not null
#  due_at     :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Homework < ActiveRecord::Base
  belongs_to :teacher, class_name: "User", foreign_key: "user_id"
  has_many :assignments

  validates :title, :question, :due_at, presence: true
end
