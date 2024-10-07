# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = policy_scope(Product).includes(picture_attachment: :blob)
    if params[:q].present?
      @products = @products.where('name ILIKE ? OR description ILIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
    end
    @products = @products.where(status: params[:status]) if params[:status].present?

    @pagy, @products = pagy(@products, items: 2)
  end

  private

  def product_params
    params
  end
end
