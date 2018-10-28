class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.date :date
      t.numeric :user_id
      t.numeric :points

      t.timestamps
    end
  end
end
