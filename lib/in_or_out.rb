  class NeitherError < StandardError; end
  class InOrOut
    class << self
      def which
        print "Clocking in or out? (in/out) "
        clocking_in_or_not = gets.chomp.downcase

        unless ['in', 'out'].include?(clocking_in_or_not.downcase.strip)
          raise NeitherError
        end

        clocking_in_or_not
      end
    end
  end
