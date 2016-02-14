class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :user_id, null: false
      t.integer :homework_id, null: false

      t.timestamps null: false
    end

    add_index :assignments, [:user_id, :homework_id], unique: :true
  end
end
