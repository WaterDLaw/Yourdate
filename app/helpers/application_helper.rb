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

  #Function for getting the thumbnail image of a user
  def get_thumbnail(user)

    # Get the profile picture
    profile_picture = Photograph.find_profile_picture(user.gallery.id).first

    if profile_picture.nil?
      image_tag 'default.png', class: "fit-image circle default-thumb"
    else
      image_tag(profile_picture.image_url(:thumbnail).to_s, class: "fit-image circle")
    end
  end

end
