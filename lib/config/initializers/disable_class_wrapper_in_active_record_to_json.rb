ActiveRecord::Base.include_root_in_json = false

ActiveRecord::Base.class_eval do
  def class_name
    self.class.name
  end
end
