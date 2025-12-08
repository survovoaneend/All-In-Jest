local saltimbanco = {
    object_type = "Joker",
    order = 108,
    key = "saltimbanco",
    config = {
      extra = {
          trigger = false
      }
    },
    rarity = 1,
    pos = { x = 3, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.after then
            card.ability.extra.trigger = false
        end
        if context.initial_scoring_step then
            card.ability.extra.trigger = true
        end
        if context.pseudorandom_result and G.play ~= nil and G.play.cards ~= nil and card.ability.extra.trigger then
            if context.numerator > 0 and context.denominator > 0 and #G.play.cards > 0 then
                local xmlt = 1 + (1 - (context.numerator/context.denominator))
                if context.result and context.trigger_obj and (context.trigger_obj.config and context.trigger_obj.config.center and (context.trigger_obj.config.center.set == 'Joker' or context.trigger_obj.config.center.set == 'Default' or context.trigger_obj.config.center.set == 'Enhanced' or context.trigger_obj.config.center.consumeable)) and xmlt > 1 then
                    return {
                        xmult = xmlt
                    }
                end
            end
        end
    end
}
return { name = {"Jokers"}, items = {saltimbanco} }
