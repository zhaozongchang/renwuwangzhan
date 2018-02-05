class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.text :unacommpolished
      t.integer :buckle
      t.integer :deduction
      t.integer :score

      t.timestamps
    end
  end
end
