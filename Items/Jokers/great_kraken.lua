local great_kraken = {
    object_type = "Joker",
    order = 219,

    key = "great_kraken",
    config = {
      extra = {
        xmult_mod = 1,
      }
    },
    rarity = 3,
    pos = { x = 8, y = 8},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local xmult = G.GAME.current_round.hands_left
        if xmult < 1 then
            xmult = 1
        end
        return {
            vars = {
                card.ability.extra.xmult_mod,
                xmult
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        local xmult = G.GAME.current_round.hands_left
        if xmult < 1 then
            xmult = 1
        end
        return {
            xmult = xmult
        }
      end
    end
  
}
return { name = {"Jokers"}, items = {great_kraken} }
