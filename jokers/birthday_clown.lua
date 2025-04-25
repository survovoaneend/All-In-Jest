SMODS.Joker {
    key = "birthday_clown",
    config = {
      extra = {
        xmult = 2,
        active = true
      }
    },
    rarity = 1,
    pos = { x = 2, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.xmult
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.end_of_round then
        --sets to true if boss blind is defeated, and then resets it when it's played again
        if G.GAME.blind.boss then
          card.ability.extra.active = true
        else
          card.ability.extra.active = false
        end
      end
      --gives the xmult only if its active
      if card.ability.extra.active and context.joker_main then
        return {
          xmult = card.ability.extra.xmult
        }
      end
    end
  }