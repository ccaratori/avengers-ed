class AddUserIdToHomework < ActiveRecord::Migration
  def change
    change_table(:homeworks) do |t|
      t.belongs_to :user, index: true
    end
  end
end
