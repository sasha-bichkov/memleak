class MemorySnapshot < ActiveRecord::Base

  scope :between, -> from, to { where('id >= ? AND id <= ?', from, to) }

  serialize :allocated_memory_by_gem, Array
  serialize :allocated_objects_by_gem, Array
  serialize :retained_memory_by_gem, Array
  serialize :retained_objects_by_gem, Array
  serialize :allocated_memory_by_file, Array
  serialize :allocated_objects_by_file, Array
  serialize :retained_memory_by_file, Array
  serialize :retained_objects_by_file, Array
  serialize :allocated_memory_by_location, Array
  serialize :allocated_objects_by_location, Array
  serialize :retained_memory_by_location, Array
  serialize :retained_objects_by_location, Array
  serialize :allocated_memory_by_class, Array
  serialize :allocated_objects_by_class, Array
  serialize :retained_memory_by_class, Array
  serialize :retained_objects_by_class, Array

end
