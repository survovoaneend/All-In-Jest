local stock_broker = {
    object_type = "Joker",
    order = 253,
    key = "stock_broker",
    config = {
      extra = {
          minvalue = 0.75,
          maxvalue = 3
      }
    },
    rarity = 2,
    pos = { x = 0, y = 10},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.minvalue,
                card.ability.extra.maxvalue,
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.end_of_round and context.cardarea == G.jokers then
        local room_saver = math.random() * (card.ability.extra.maxvalue - card.ability.extra.minvalue) + card.ability.extra.minvalue
        local ran_amount = math.floor(room_saver / 0.05 + 0.5) * 0.05
        apply_multiplier(G.GAME, "interest_amount", ran_amount, tostring(card).."stock_broker")
        local string = "X"..tostring(ran_amount.." Interest")
		card_eval_status_text(card, 'extra', nil, nil, nil, {message = string, colour = G.C.FILTER})
      end
      if context.cashing_out then
        remove_multiplier(G.GAME, "interest_amount", tostring(card).."stock_broker")
      end
    end, 
    remove_from_deck = function(self, card, from_debuff)
        remove_multiplier(G.GAME, "interest_amount", tostring(card).."stock_broker")
    end,
  
}
return { name = {"Jokers"}, items = {stock_broker} }
