module ApplicationHelper
  def active_class(link_path)
    request.fullpath == link_path ? 'active' : ""
  end
end
