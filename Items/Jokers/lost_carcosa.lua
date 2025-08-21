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
        if context.all_in_jest and context.all_in_jest.before_using_consumeable then
            if context.all_in_jest.consumeable.ability.set == 'Planet' then
                context.all_in_jest.consumeable.ability.lost_carcosa_mult = math.random(5,20) * 0.1
                local ran_amount = context.all_in_jest.consumeable.ability.lost_carcosa_mult * 100
		        local string = tostring(ran_amount).."%"
		        card_eval_status_text(card, 'extra', nil, nil, nil, {message = string, colour = G.C.SECONDARY_SET.Planet})
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {lost_carcosa} }
