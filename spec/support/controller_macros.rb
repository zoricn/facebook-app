module ControllerMacros
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  def sign_in_as_person(person)
    controller.stub(:current_person).and_return(person)
    controller.stub(:graph).and_return({"id"=>"1506246046", "name"=>"Vladimir Kitic", "first_name"=>"Vladimir", "last_name"=>"Kitic", "link"=>"http://www.facebook.com/profile.php?id=1506246049", "birthday"=>"12/19/1975", "gender"=>"male", "timezone"=>2, "locale"=>"en_US", "verified"=>true, "updated_time"=>"2012-03-28T21:32:08+0000"})
    controller.stub(:verify_access_token).and_return(true)
  end

  def as_signed_out_visitor
    controller.stub(:verify_access_token).and_return(false)
  end
end
