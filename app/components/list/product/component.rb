# frozen_string_literal: true

module List
  module Product
    class Component < ViewComponent::Base
      def initialize(products:, pagination:)
        super
        @products = products
        @pagination = pagination
      end
    end
  end
end
