module Memleak
  module ApplicationHelper

    def snapshot_request(snapshot) 
        "#{snapshot.controller}##{snapshot.action}"
    end

  end
end
