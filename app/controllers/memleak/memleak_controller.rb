module Memleak
  class MemleakController < ApplicationController

    def index
      @memory_snapshots = MemorySnapshot.all
    end

  end
end
