class AddAllocatedAndRetainedByClass < ActiveRecord::Migration
  def change
    add_column :memory_snapshots, :allocated_memory_by_class,  :text, default: '', null: false
    add_column :memory_snapshots, :allocated_objects_by_class, :text, default: '', null: false
    add_column :memory_snapshots, :retained_memory_by_class,   :text, default: '', null: false
    add_column :memory_snapshots, :retained_objects_by_class,  :text, default: '', null: false
  end
end
