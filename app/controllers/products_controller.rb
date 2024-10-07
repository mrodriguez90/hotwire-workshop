# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = policy_scope(Product).includes(picture_attachment: :blob)
    @products = filter_by_query(@products)
    @products = filter_by_status(@products)
    @pagy, @products = pagy(@products, items: 2)
  end

  private

  def filter_by_query(products)
    return products if params[:q].blank?

    products.where('name ILIKE ? OR description ILIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
  end

  def filter_by_status(products)
    return products if params[:status].blank?

    products.where(status: params[:status])
  end
end
