class StaticPagesController < ApplicationController
  def index
    @products = Product.limit(3)
  end
end