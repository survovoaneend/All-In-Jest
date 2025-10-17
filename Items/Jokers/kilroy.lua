local kilroy = {
    object_type = "Joker",
    order = 132,

    key = "kilroy",
    config = {
      extra = {modchips = 50, curchips = 0}
    },
    rarity = 1,
    pos = { x = 1, y = 5 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.modchips, card.ability.extra.curchips}}
    end,
  
    calculate = function(self, card, context)

        if context.selling_card and not context.blueprint then
            if (context.card == card) then
                SMODS.scale_card(card, {
                    ref_table = G.P_CENTERS["j_aij_kilroy"].config.extra,
                    ref_value = "curchips",
                    scalar_value = "modchips",
                    no_message = true,
                })
            else
                -- If this card was not sold, copy current values with config
                -- In case a duplicate Kilroy was sold
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card.ability.extra.modchips = G.P_CENTERS["j_aij_kilroy"].config.extra.modchips
                        card.ability.extra.curchips = G.P_CENTERS["j_aij_kilroy"].config.extra.curchips
                        return true
                    end
                }))
            end
        end

        if context.joker_main then
            if card.ability.extra.curchips ~= 0 then
                return {
                  chips = card.ability.extra.curchips,
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {kilroy} }
