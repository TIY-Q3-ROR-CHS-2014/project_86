class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :workflow_state
      t.string :season
      t.timestamps
    end
  end
end
