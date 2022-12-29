module ApplicationHelper
  def profile_avatar account
    thumb = account.avatar.present? ? account.avatar : "default-profile.jpg"
    image_tag thumb, class: "profile-pic img-circle", style: "border-radius:90px;, width:100px; height:100px;"
  end
end
