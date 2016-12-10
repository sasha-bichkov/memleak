module Memleak
  class MemleakController < ApplicationController

    def index
      @memory_snapshots = MemorySnapshot.all
    end

    def snapshots
      render json: MemorySnapshot.all
    end

  end
end
