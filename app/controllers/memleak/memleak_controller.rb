module Memleak
  class MemleakController < ApplicationController

    def index
      @memory_snapshots = get_memory_snapshots
    end

    def snapshots
      render json: get_memory_snapshots
    end

    private

    def get_memory_snapshots
      from, to = snapshots_params[:snapshots_from], snapshots_params[:snapshots_to]

      if from and to
        MemorySnapshot.between from, to
      else
        MemorySnapshot.all
      end
    end

    def snapshots_params
      params.permit :snapshots_from, :snapshots_to
    end

  end
end
