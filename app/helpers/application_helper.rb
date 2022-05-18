module ApplicationHelper

    def is_active?(name)
        if current_page?(name)
            "active"
        else
            ""
        end
    end
    def current_time_zone
        off_set = Time.now.gmt_offset
        ActiveSupport::TimeZone[off_set].name
    end
end
