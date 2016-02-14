# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  role       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :homeworks

  enum role: [:teacher, :student]

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true
end
