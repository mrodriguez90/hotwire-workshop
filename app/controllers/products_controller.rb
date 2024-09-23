# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @pagy, @products = pagy(policy_scope(Product).includes(picture_attachment: :blob), items: 1)
  end
end
