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

require 'test_helper'

class HomeworkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
