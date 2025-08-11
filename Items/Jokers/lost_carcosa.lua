local lost_carcosa = {
    object_type = "Joker",
    order = 201,

    key = "lost_carcosa",
    config = {
      
    },
    rarity = 2,
    pos = { x = 16, y = 7},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.using_consumeable then
            if context.consumeable.ability.set == 'Planet' and context.consumeable.ability.lost_carcosa_mult then
                local ran_amount = context.consumeable.ability.lost_carcosa_mult * 100
		        local string = tostring(ran_amount).."%"
		        card_eval_status_text(card, 'extra', nil, nil, nil, {message = string, colour = G.C.SECONDARY_SET.Planet})
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {lost_carcosa} }
