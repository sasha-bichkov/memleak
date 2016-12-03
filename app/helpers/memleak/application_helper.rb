module Memleak
  module ApplicationHelper

    def snapshot_request(snapshot) 
      "#{snapshot.controller}##{snapshot.action}"
    end

    def format_time(time)
      time.strftime '%d %b %H:%M'
    end

  end
end
