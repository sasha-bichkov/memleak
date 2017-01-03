class MemorySnapshot < ActiveRecord::Base

  scope :between, -> from, to { where('id >= ? AND id <= ?', from, to) }

end
