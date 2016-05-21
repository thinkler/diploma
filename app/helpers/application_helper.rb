module ApplicationHelper

  def role_select
    Admin::ROLES.each_with_object([]) do |role, memo|
      memo.push ["#{role.to_s.humanize}", role]
    end
  end


end
