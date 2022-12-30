module ApplicationHelper
  def profile_avatar account
    thumb = account.avatar.present? ? account.avatar : "default-profile.jpg"
    image_tag thumb, class: "profile-pic img-circle", style: "border-radius:90px;, width:100px; height:100px;"
  end

  def flash_notifications
    flash_messages = []

    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert' || type == 'danger'
      text = "toastr['#{type}']('#{message}');"
      flash_messages << text.html_safe unless message.blank?
    end

    "<script>$(function(){ #{ flash_messages.join("\n") } });</script>".html_safe if flash_messages.any?
  end

end
