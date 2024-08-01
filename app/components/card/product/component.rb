# frozen_string_literal: true

module Card
  module Product
    class Component < ViewComponent::Base
      def initialize(product:)
        @product = product
      end
    end
  end
end
