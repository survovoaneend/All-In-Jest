local stock_photo = {
    object_type = "Joker",
    order = 187,

    key = "stock_photo",
    config = {
        extra = {
            trigger = false,
            pseudo_trigger = false,
            odds = 2
        }
    },
    rarity = 2,
    pos = { x = 1, y = 7},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,
  
    calculate = function(self, card, context)
       if context.starting_shop or (card.ability.extra.pseudo_trigger and context.ending_booster) then
          stop_use() 
          G.E_MANAGER:add_event(Event({
              trigger = 'after',
              func = (function() 
                  if G.STATE ~= G.STATES.SMODS_BOOSTER_OPENED then
                      local key = 'p_standard_mega_' .. (math.random(1, 2))
                      local cardd = Card(G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
                          G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2, G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
                          G.P_CENTERS[key], { bypass_discovery_center = true, bypass_discovery_ui = true })
                      cardd.cost = 0
                      G.FUNCS.use_card({ config = { ref_table = cardd } })
                      cardd:start_materialize()
                      card.ability.extra.trigger = true
                      card.ability.extra.pseudo_trigger = false
                      return true 
                  else
                      card.ability.extra.pseudo_trigger = true
                      return true 
                  end
              end)
          }))
       end
       if context.skipping_booster and card.ability.extra.trigger and not context.blueprint then
           card.ability.extra.trigger = false
           if SMODS.pseudorandom_probability(card, 'stock_photo', 1, card.ability.extra.odds) then
               SMODS.destroy_cards(card)
               return
           end
           card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_safe_ex'),colour = message_colour})
       end
    end
}
return { name = {"Jokers"}, items = {stock_photo} }
