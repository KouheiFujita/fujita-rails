module ApplicationHelper
    def sortable(entry_date, title = nil)
        title ||= entry_date.titleize
        css_class = (entry_date == sort_column) ? "current #{sort_direction}" : nil
        direction = (entry_date == sort_column && sort_direction == "asc") ? "desc" : "asc"
        link_to title, {:sort => entry_date, :direction => direction}, {:class => css_class}
    end
end
