module Page
  class Element
    def initialize(attrs)
      attrs.each do |field_name, value|
        next if value.nil?

        hash = {}; hash[:"#{field_name}"] = value
        instance_variable_set(:@attrs, hash)
      end
    end

    attr_reader :attrs
  end
end
