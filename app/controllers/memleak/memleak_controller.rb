module Memleak
  class MemleakController < ApplicationController

    def index
    end

    def snapshots
      render json: MemorySnapshot.all
    end

  end
end
