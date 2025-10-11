local fortune_cookie = {
    object_type = "Joker",
    order = 272,
    
    key = "fortune_cookie",
    config = {
      extra = {
        packs_remaining = 5,
        packs = 5
      }
    },
    rarity = 1,
    pos = { x = 20, y = 10},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    pools = {
        Food = true
    },

    pixel_size = { w = 51, h = 95 },
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.packs_remaining,
                card.ability.extra.packs
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.open_booster then 
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local cardd = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'for')
                            cardd:add_to_deck()
                            G.consumeables:emplace(cardd)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
            end
            local remaining_mod = {}
            remaining_mod.num = 1
            if (card.ability.extra.packs_remaining - 1) <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                SMODS.scale_card(card, {
	                ref_table = card.ability.extra,
                    ref_value = "packs_remaining",
                    scalar_table = remaining_mod,
	                scalar_value = "num",
                    operation = '-',
                    scaling_message = {
	                    message = (card.ability.extra.packs_remaining-1).."/"..card.ability.extra.packs, 
                        colour = G.C.FILTER
                    }
                })
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {fortune_cookie} }
