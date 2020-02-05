module AndroidScreens
  class Login

    def initialize

      @username_field = 'test.sdet.com.simpleapp:id/et_email'
      @password_field = 'test.sdet.com.simpleapp:id/et_password'
      @sign_in_btn = 'test.sdet.com.simpleapp:id/btn_signin'
      @signedin_msg ='test.sdet.com.simpleapp:id/tv_message'
    end


    def assert_username_field_displayed
      common.element_displayed? @username_field
    end

    def enter_credentials
      common.enter_text(@username_field,'id','admin@ctm.com')
      common.enter_text(@password_field,'id', 'password123')
    end


    def tap_enabled_login_button
       common.click_element(@sign_in_btn,'id')
    end

    def assert_message_displayed?
      common.element_displayed?(@signedin_msg)
    end
    #   common.scroll_down until common.element_displayed?('Save')
    #   # common.click_element(@save,'id')
    # end
  end
end