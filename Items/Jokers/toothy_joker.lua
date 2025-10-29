local toothy_joker = {
    object_type = "Joker",
    order = 213,

    key = "toothy_joker",
    config = {
      extra = { chips = 25 }
    },
    rarity = 1,
    pos = { x = 2, y = 8},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.chips * G.GAME.jest_toothy_joker_tarots}}
    end,
  
    calculate = function(self, card, context)
        if not context.blueprint then
            if context.using_consumeable then
                if context.consumeable.ability.set == 'Tarot' then
                    G.GAME.jest_toothy_joker_tarots = G.GAME.jest_toothy_joker_tarots + 1
                    return {
                        extra = {message = localize('k_upgrade_ex'), colour = G.C.FILTER},
                        colour = G.C.FILTER,
                        card = card
                    }
                end
            end
            if context.ante_change and context.ante_change ~= 0 and context.ante_end and G.GAME.jest_toothy_joker_tarots > 0 then
                G.GAME.jest_toothy_joker_tarots = 0
                return {
                    message = localize('k_reset')
                }
            end
        end
        if context.joker_main then
            if G.GAME.jest_toothy_joker_tarots ~= 0 then
                return {
                    chips = card.ability.extra.chips * G.GAME.jest_toothy_joker_tarots,
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {toothy_joker} }
