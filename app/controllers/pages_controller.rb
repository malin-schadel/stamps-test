class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @cards = @user.user_cards
    @stamp_card_hashes = @cards.map do |card|
      {
        shop: card.stamp_card.shop.name,
        max: card.stamp_card.max_amount,
        actual: card.amount
      }
    end
  end
end
