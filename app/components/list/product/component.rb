# frozen_string_literal: true

module List
  module Product
    class Component < ViewComponent::Base
      def initialize(products:)
        @products = products
      end
    end
  end
end
