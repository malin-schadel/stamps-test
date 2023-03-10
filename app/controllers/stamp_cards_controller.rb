class StampCardsController < ApplicationController
  before_action :set_customer, only: [:index]

  def index
    @stamp_cards = current_user.stamp_cards
  end

  def stamp_it
    @customer = User.find(params[:customer_id])
    @stamp_card = StampCard.find(params[:stamp_card_id])
    @user_card = UserCard.find_by(user_id: @customer.id, stamp_card_id: @stamp_card.id)
    @user_card.amount += 1
    @user_card.save
    redirect_to stamp_cards_path(current_user.stamp_cards, customer_id: @customer.id)
  end

  def create_card
  end

  private

  def set_customer
    @customer = User.find(params[:customer_id]) if params[:customer_id]
  end
end
