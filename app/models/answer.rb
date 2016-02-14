# == Schema Information
#
# Table name: answers
#
#  id            :integer          not null, primary key
#  assignment_id :integer          not null
#  text          :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Answer < ActiveRecord::Base
  belongs_to :assignment, counter_cache: true

  validates :text, presence: true
end
