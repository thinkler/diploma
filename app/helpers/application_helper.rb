module ApplicationHelper

  def role_select
    Admin::ROLES.each_with_object([]) do |role, memo|
      memo.push ["#{role.to_s.humanize}", role]
    end
  end

  def to_string(arr)
    arr.each_with_object("") do |item, memo|
      memo.concat("#{item.title} ")
    end
  end

  def current_patient
    session[:patient]
  end

  def url_make_helper(url, type, id)
    if url.include? '?'
      return url + "&#{type}=#{id}"
    else
      return url + "?#{type}=#{id}"
    end
    byebug
  end

end
