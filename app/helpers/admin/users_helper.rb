module Admin::UsersHelper
  def hide_middle_number(phone)
    phone[3..6] = '****'
    phone
  end
end
