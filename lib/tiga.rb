require_relative "page/elements"

class Tiga
  def initialize(action)
    @action = action
  end

  def call
    set_elements

    @driver.navigate.to ENV['URL']

    find_elements
    send_input

    submit
    # To do:
    # Check for incorrect password or username
  end

  private

  # sets @url, @username, @password, @clock_in_btn, @clock_out_btn
  def set_elements
    @elements ||= Page::Elements.load

    @elements.instance_variables.each do |inst_var|
      instance_variable_set(:"#{inst_var}", @elements.instance_variable_get(inst_var)&.attrs)
    end

    driver
  end

  def find_elements
    @username_input = @driver.find_element @username
    @password_input = @driver.find_element @password
    @clock_in_btn = @driver.find_element @clock_in_btn
    @clock_out_btn = @driver.find_element @clock_out_btn
  end

  def send_input
    @username_input.send_keys ENV['USERNAME']
    @password_input.send_keys ENV['PASSWORD']
  end

  def submit
    if @action == "in"
      @clock_in_btn.click
      puts "Locked In! 🤞"
    else
      @clock_out_btn.click
      puts "Bye! Enjoy👋"
    end
  end

  def driver
    @driver ||=
      begin
        args = ['--no-sandbox']
        options = Selenium::WebDriver::Chrome::Options.new

        args.each do |arg|
          options.add_argument(arg)
        end

        Selenium::WebDriver.for :chrome, options:
      end
  end
end
