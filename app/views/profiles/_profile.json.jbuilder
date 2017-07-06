json.extract! profile, :id, :user_id, :firstname, :lastname, :nickname, :age, :profession, :about, :catchphrase, :introduction, :created_at, :updated_at
json.url profile_url(profile, format: :json)
