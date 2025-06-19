local sot = {
    object_type = "Joker",
    order = 226,

    key = "sot",
    config = {
      extra = {modmult = 15, curmult = 0}
    },
    rarity = 2,
    pos = { x = 15, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        card.ability.extra.curmult = 0
        for i = 1, #G.GAME.tags do
            card.ability.extra.curmult = card.ability.extra.curmult + card.ability.extra.modmult
        end
        return { vars = {card.ability.extra.modmult, card.ability.extra.curmult}}
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        card.ability.extra.curmult = 0
        for i = 1, #G.GAME.tags do
            card.ability.extra.curmult = card.ability.extra.curmult + card.ability.extra.modmult
        end
        if card.ability.extra.curmult ~= 0 then
            return {
                mult = card.ability.extra.curmult
            }
        end
      end
    end
  
}
return { name = {"Jokers"}, items = {sot} }
