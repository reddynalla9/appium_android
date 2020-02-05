
def logingate
  @landing_page ||= LoginScreen.new
end

class LoginScreen
  include AndroidScreens

  def login
    Login.new
  end


end








