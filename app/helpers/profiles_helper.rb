module ProfilesHelper

  # Helper method for the checkboxes
  def checked(area)
    @profile.looking_for.include? area
  end


  # Helper methods for the selects

  def options_eye_color
    [
      ['Blue', 'Blue'],
      ['Brown', 'Brown'],
      ['Green', 'Green'],
      ['Grey', 'Grey'],
      ['Darkbrown', 'Darkbrown']
    ]
  end

  def options_hair_color
    [
      ['Black', 'Black'],
      ['Brown', 'Brown'],
      ['Blonde', 'Blonde'],
      ['Dark blonde', 'Dark blonde'],
      ['Dyed', 'Dyed'],
      ['Grey', 'Grey'],
      ['Red', 'Red']
    ]
  end

  def options_has_children
    [
      ['No', 'No'],
      ['Yes (lives with)', 'Yes (lives with)'],
      ["Yes (Don't lives with)", "Yes (Don't lives with)"]
    ]
  end

  def options_wants_children
    [
      ['Yes', 'Yes'],
      ['No', 'No'],
      ['Maybe', 'Maybe']
    ]
  end

  def options_smoking
    [
      ['Yes', 'Yes'],
      ['No', 'No'],
      ['Social smoker', 'Social Smoker']
    ]
  end

  def options_drinking
    [
      ['Yes', 'Yes'],
      ['No', 'No'],
      ['Social drinker', 'Social dinker']
    ]
  end

  def options_religion
    [
      ['Agnostic', 'Agnostic'],
      ['Atheist', 'Atheist'],
      ["Baha'ist", "Baha'ist"],
      ['Buddhist', 'Buddhist'],
      ['Caodaism', 'Caodaism'],
      ['Christian - Protestant', 'Christian - Protestant'],
      ['Christian - Catholic', 'Christian - Catholic'],
      ['Christian - Mormon', 'Christian - Mormon'],
      ['Christian - Orthodox', 'Christian - Orthodox'],
      ['Christian - Other', 'Christian - Other'],
      ['Confucianism', 'Confucianism'],
      ['Hindu', 'Hindu'],
      ['Iscon', 'Iscon'],
      ['Islam Shiite', 'Islam Shiite'],
      ['Islam Sunni', 'Islam Sunni'],
      ['Jainism', 'Jainism'],
      ['Jewish', 'Jewish'],
      ['No Religion', 'No Religion'],
      ['Other', 'Other'],
      ['Pentecostal', 'Pentecostal'],
      ['Shintoism', 'Shintoism'],
      ['Sikhism', 'Sikhism'],
      ['Taoism', 'Taoism'],
    ]
  end

  def options_relationship_status
    [
      ['Single', 'Single'],
      ['Taken', 'Taken'],
      ['Married', 'Married'],
      ['Divorced', 'Divorced'],
      ['Complicated', 'Complicated'],
      ['Separated', 'Separated'],
      ['Widow / Widower', 'Widow / Widower']
    ]
  end

  def options_education
    [
      ['No education', 'No education'],
      ['Elementary School', 'Elementary School'],
      ['Highschool', 'Highschool'],
      ['College', 'College'],
      ['University - Bachelors Degree', 'University - Bachelors Degree'],
      ['University - Masters Degree', 'University - Masters Degree'],
      ['Phd / Doctorate', 'Phd Doctorate'],
      ['Other', 'Other']
    ]
  end

  def options_ethnicity
    [
      ['African (Black)', 'African (Black)'],
      ['African American', 'African American'],
      ['Arab (Middle Eastern)', 'Arab (Middle Eastern)'],
      ['Asian', 'Asian'],
      ['Caucasian (White)', 'Caucasian (White)'],
      ['East Indian', 'East Indian'],
      ['Hispanic', 'Hispanic'],
      ['Latino', 'Latino'],
      ['Mixed', 'Mixed'],
      ['Other', 'Other']
    ]
  end

  def options_gender
    [
      ['Male', 'Male'],
      ['Female', 'Female']
    ]
  end

  def options_looking_gender
    [
      ['Male', 'Male'],
      ['Female', 'Female'],
      ['Both', 'Both']
    ]
  end

end
