module ApplicationHelper

  def emojify(content)
    h(content).to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
      else
        match
      end
    end.html_safe if content.present?
  end

  def online_status(user)
    content_tag :span, user.name,
                class: "user-#{user.id} online_status #{'online' if user.online?}"
  end


  #helper for profile_picture
  def has_profile_picture(picture)
    if picture.nil?
      image_tag 'default.png'
    else
      image_tag(picture.image_url.to_s, class: "fit-image")
    end
  end

end
