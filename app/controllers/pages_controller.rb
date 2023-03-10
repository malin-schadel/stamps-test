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

  def qr_code
    @user = current_user

    qrcode = RQRCode::QRCode.new(stamp_cards_path(@shop, customer_id: current_user.id))
    @svg = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
  end

  def map
    @shops = Shop.all
    # The `geocoded` scope filters only shops with coordinates
    @markers = @shops.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
