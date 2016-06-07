module ApplicationHelper

  def role_select
    Admin::ROLES.each_with_object([]) do |role, memo|
      memo.push ["#{role.to_s.humanize}", role]
    end
  end

  def to_string(arr, doc = false)
    arr.each_with_object("") do |item, memo|
      doc ? memo.concat("#{item.last_name} ") : memo.concat("#{item.title},")
    end
  end

  def current_patient
    Patient.find(session[:patient]["id"]) if session[:patient]
  end

  def url_make_helper(url, type, id)
    if url.include? '?'
      return url + "&#{type}=#{id}"
    else
      return url + "?#{type}=#{id}"
    end
    byebug
  end

  def free_time(times)
    times.select { |k, v| v == "false" }
  end

end
