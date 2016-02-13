class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :title
      t.text :question
      t.datetime :due_at

      t.timestamps null: false
    end
  end
end
