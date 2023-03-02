UserCard.destroy_all
StampCard.destroy_all
Shop.destroy_all
User.destroy_all

shop_owner = User.create(email: "cafe@web.com", password: "password")
customer = User.create(email: "customer@web.com", password: "password")

cafe = Shop.create(
  name: "Central Perk",
  description: "Enjoyed Best With Friends",
  address: "New York",
  user: shop_owner
)

stamp_card = StampCard.create(
  max_amount: 10,
  discount_item: "1 Medium Cappuccino",
  shop: cafe
)

user_card = UserCard.create(
  amount: 2,
  user: customer,
  stamp_card: stamp_card
)
