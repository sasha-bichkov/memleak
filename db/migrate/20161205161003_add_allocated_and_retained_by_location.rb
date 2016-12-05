class AddAllocatedAndRetainedByLocation < ActiveRecord::Migration
  def change
    add_column :memory_snapshots, :allocated_memory_by_location,  :text,  default: '', null: false
    add_column :memory_snapshots, :allocated_objects_by_location, :text,  default: '', null: false
    add_column :memory_snapshots, :retained_memory_by_location,   :text,  default: '', null: false
    add_column :memory_snapshots, :retained_objects_by_location,  :text,  default: '', null: false
  end
end
