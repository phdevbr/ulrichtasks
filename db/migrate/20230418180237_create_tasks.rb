class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :title
      t.text :description
      t.boolean :checked
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.timestamps
    end
  end
end
