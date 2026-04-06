local planetarium = {
    object_type = "Joker",
    order = 314,
    ignore = not All_in_Jest.config.moons_enabled,
    key = "planetarium",
    config = {
      extra = {
          chips = 100,
          mult = 15,
      }
    },
    rarity = 2,
    pos = { x = 11, y = 12},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if
            context.other_consumeable and
            context.other_consumeable.ability.set == 'Planet' and
            context.other_consumeable.ability.consumeable.hand_type == context.scoring_name
        then
            local chips = 0
            local mult = 0
            if context.other_consumeable.ability.consumeable.hand_type and context.scoring_name == context.other_consumeable.ability.consumeable.hand_type then
                if context.other_consumeable.ability.consumeable.mult then
                    mult = mult + card.ability.extra.mult
                end
                if context.other_consumeable.ability.consumeable.chips then
                    chips = chips + card.ability.extra.chips
                end
            end
            if chips > 0 and mult > 0 then
                return {
                    mult = mult,
                    chips = chips,
                    message_card = context.other_consumeable
                }
            elseif chips > 0 then
                return {
                    chips = chips,
                    message_card = context.other_consumeable
                }
            elseif mult > 0 then
                return {
                    mult = mult,
                    message_card = context.other_consumeable
                }
            end
        end
    end,
  
    -- calculate = function(self, card, context)
    --     if context.joker_main and context.scoring_name then
    --         local chips = 0
    --         local mult = 0
    --         if G.consumeables and #G.consumeables.cards > 0 then
    --             for k, v in pairs(G.consumeables.cards) do
    --                 if v.ability.set == 'Planet' and v.config.center.config.hand_type and context.scoring_name == v.config.center.config.hand_type then
    --                     if v.config.center.config.mult then
    --                         mult = mult + card.ability.extra.mult
    --                     end
    --                     if v.config.center.config.chips then
		--                     chips = chips + card.ability.extra.chips
    --                     end
    --                 end
    --             end
    --         end
    --         if chips > 0 and mult > 0 then
    --             return {
    --                 mult = mult,
    --                 chips = chips
    --             }
    --         elseif chips > 0 then
    --             return {
    --                 chips = chips
    --             }
    --         elseif mult > 0 then
    --             return {
    --                 mult = mult
    --             }
    --         end
    --     end
    -- end,
}
return { name = {"Jokers"}, items = {planetarium} }
