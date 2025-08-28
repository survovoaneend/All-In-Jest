local saltimbanco = {
    object_type = "Joker",
    order = 108,
    key = "saltimbanco",
    config = {
      
    },
    rarity = 1,
    pos = { x = 3, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.pseudorandom_result and G.play ~= nil and G.play.cards ~= nil and G.play.cards[1].highlighted then
            if context.numerator > 0 and context.denominator > 0 and #G.play.cards > 0 then
                local xmlt = 1 + (1 - (context.numerator/context.denominator))
                if context.trigger_obj and (context.trigger_obj.config and context.trigger_obj.config.center and (context.trigger_obj.config.center.set == 'Joker' or context.trigger_obj.config.center.set == 'Default' or context.trigger_obj.config.center.set == 'Enhanced' or context.trigger_obj.config.center.consumeable)) then
                    return {
                        message = localize{type='variable',key='a_xmult',vars={xmlt}},
                        Xmult_mod = xmlt,
                    }
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {saltimbanco} }
