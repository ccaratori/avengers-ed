# == Schema Information
#
# Table name: homeworks
#
#  id         :integer          not null, primary key
#  title      :string
#  question   :text
#  due_at     :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Homework < ActiveRecord::Base
end
