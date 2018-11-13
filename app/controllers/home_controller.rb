class HomeController < ApplicationController
  def index
    @items = Item.where.not(:id => Rental.where(buyer_checkin_confirm: false).or(Rental.where(seller_checkin_confirm: false)))
  end
end
