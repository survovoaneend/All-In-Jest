--originally in paperback
function add_booster_pack(key,price)
    if not G.shop then return end

    local pack = Card(
        G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
        G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
        G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
        G.P_CENTERS[key],
        { bypass_discovery_center = true, bypass_discovery_ui = true }
  )
  if price then
    pack.cost = price
  end

  -- Create the price tag above the pack
  create_shop_card_ui(pack, 'Booster', G.shop_booster)

  -- Add the pack to the shop
  pack:start_materialize()
  G.shop_booster:emplace(pack)
end