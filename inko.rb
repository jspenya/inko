require "selenium-webdriver"
require "dotenv/load"
Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }

class Inko
  def run
    begin
      send :"clock_#{ in_or_out }"
    rescue NeitherError
      puts "You deserve rest!"
    end
  end

  private

  def clock_in
    Tiga.new("in").call
  end

  def clock_out
    Tiga.new("out").call
  end

  def in_or_out
    InOrOut.which
  end
end

Inko.new.run
