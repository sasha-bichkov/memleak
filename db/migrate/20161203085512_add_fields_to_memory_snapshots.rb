class AddFieldsToMemorySnapshots < ActiveRecord::Migration
  def change
    add_column :memory_snapshots, :total_allocated_objects, :bigint,  default: 0, null: false
    add_column :memory_snapshots, :total_allocated_memsize, :bigint,  default: 0, null: false
    add_column :memory_snapshots, :total_retained_objects,  :bigint,  default: 0, null: false
    add_column :memory_snapshots, :total_retained_memsize,  :bigint,  default: 0, null: false
  end
end
