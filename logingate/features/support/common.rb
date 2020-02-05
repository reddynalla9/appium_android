class Common



  #finding elements
  def find_element (selector, locator_type)
    #wait_for_element_to_be_displayed(selector,locator_type)
    case locator_type
      when "xpath"
        driver.find_element(:xpath, selector)
      when "id"
        driver.find_element(:id, selector)
      when "class"
        driver.find_element(:class, selector)
      when "text"
        driver.find_elements(:text, selector)
      when "label"
        driver.find_elements(:label, selector)
    end
  end

  def find_elements (selector, locator_type)
    #wait_for_element_to_be_displayed(selector,locator_type)
    case locator_type
      when "xpath"
        driver.find_elements(:xpath, selector)
      when "id"
        driver.find_elements(:id, selector)
      when "class"
        driver.find_elements(:class, selector)
      when "text"
        driver.find_elements(:text, selector)
    end
  end


  #element operations
  def element_displayed? (selector)
    driver.find_element(:id, selector).displayed?
  end

  def element_xpath_displayed? (selector)
    driver.find_element(:xpath, selector).displayed?
  end

  def element_class_displayed? (selector)
    driver.find_element(:class, selector).displayed?
  end

  def enter_text( selector, locator_type,text)
    find_element(selector,locator_type).send_keys text
  end

  def click_element(selector,locator_type)
    find_element(selector,locator_type).click
  end



  def tap_element(selector,locator_type)
    driver.tap(find_element(selector,locator_type))
  end


  def driver_back
    driver.back
  end

  def tap_at_position
    driver.execute_script('mobile: tap', :x => 0.10, :y => 0.50)
  end

  def embed_screenshot(name)
    driver.screenshot File.join(Dir.pwd, "#{name}.jpg")
    # Set global flag to true (will embed screen shot at the end of the step)
    #$take_screen = true
  end

  def get_property(selector,locator_type,property)
    find_element(selector,locator_type).attribute(property)
  end

#misceleanous
  def random_string(length=10)
    chars = 'abcdefghjkmnpqrstuvwxyz'
    random_guff = ''
    length.times { |i| random_guff << chars[rand(chars.length)] }
    random_guff
  end

#device specific methods
  def send_adb(string)
    `adb #{string}`
  end

  def send_app_to_background
    driver.press_keycode Driver::KEYCODE_HOME
  end

  def click_text text
    #click_xpath(locator.text_xpath_for text)
    text(text).click
  end

  def text_displayed? text
    #xpath_displayed?(locator.text_xpath_for text)
    begin
      if text(text).displayed?
        return true
      end
    rescue
      return false
    end
  end


end