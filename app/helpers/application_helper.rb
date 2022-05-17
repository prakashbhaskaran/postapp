module ApplicationHelper

    def is_active?(name)
        if current_page?(name)
            "active"
        else
            ""
        end
    end
end
