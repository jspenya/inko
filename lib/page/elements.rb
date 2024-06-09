require_relative "element"

module Page
  class Elements
    def initialize(username, password, clock_in_btn, clock_out_btn)
      @username      = Page::Element.new(id: username)
      @password      = Page::Element.new(name: password)
      @clock_in_btn  = Page::Element.new(css: clock_in_btn)
      @clock_out_btn = Page::Element.new(css: clock_out_btn)
    end

    attr_accessor :url, :username, :password, :clock_in_btn, :clock_out_btn

    class << self
      def load
        new(
          ENV["USERNAME_BUTTON_NAME"],
          ENV["PASSWORD_BUTTON_NAME"],
          ENV["CLOCK_IN_BUTTON_CSS"],
          ENV["CLOCK_OUT_BUTTON_CSS"]
        )
      end
    end
  end
end
