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
#

class Homework < ActiveRecord::Base
  validates :title, :question, :due_at, presence: true
end
