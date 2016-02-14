class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :title, null:false
      t.text :question, null:false
      t.datetime :due_at, null:false

      t.timestamps null: false
    end
  end
end
