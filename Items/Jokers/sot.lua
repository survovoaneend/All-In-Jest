local sot = {
    object_type = "Joker",
    order = 226,

    key = "sot",
    config = {
      extra = {modxmult = 1, curxmult = 1}
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
        card.ability.extra.curxmult = 1
        for i = 1, #G.GAME.tags do
            card.ability.extra.curxmult = card.ability.extra.curxmult + card.ability.extra.modxmult 
        end
        return { vars = {card.ability.extra.modxmult, card.ability.extra.curxmult}}
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        card.ability.extra.curxmult = 1
        for i = 1, #G.GAME.tags do
            card.ability.extra.curxmult = card.ability.extra.curxmult + card.ability.extra.modxmult 
        end
        if card.ability.extra.curxmult ~= 1 then
            return {
                xmult = card.ability.extra.curxmult
            }
        end
      end
    end
  
}
return { name = {"Jokers"}, items = {sot} }
