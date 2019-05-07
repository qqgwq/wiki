module ApplicationHelper
  def active_class(link_path)
    request.fullpath == link_path ? 'active' : ""
  end

  def province_format(province)
    province.split(/(?=.{3}$)/).join(' ')
  end
end
