class CreateMemorySnapshot < ActiveRecord::Migration
  def change
    create_table :memory_snapshots do |t|
      t.string :controller, null: false
      t.string :action, null: false
      t.timestamps null: false
    end
  end
end
