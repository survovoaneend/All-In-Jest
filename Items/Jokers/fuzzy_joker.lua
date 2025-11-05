local fuzzy_joker = {
    object_type = "Joker",
    order = 259,
    key = "fuzzy_joker",
    config = {
        extra = {
           power = 2
        }
    },
    rarity = 1,
    pos = { x = 6, y = 10},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.power}}
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            if to_big(mult) <= to_big(0) then return 1 end
            local power = math.ceil(math.log(mult, card.ability.extra.power))
            local new_mult = card.ability.extra.power ^ power
            if (new_mult - mult) == to_big(0) then -- Makes Fuzzy Joker always round up
                new_mult = new_mult * card.ability.extra.power
            end
            if (new_mult - mult) > to_big(0) then
                return {
                    mult = new_mult - mult,
                    remove_default_message = true,
                    message = localize{type='variable',key='a_aij_mult_equal',vars={new_mult}},
                    colour = G.C.RED,
                    sound = 'multhit1'
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {fuzzy_joker} }
