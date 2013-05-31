class Person < MotionDataWrapper::Model
  # first_name
  # last_name
  
  def full_name
    "#{first_name} #{last_name}"
  end
end