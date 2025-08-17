local columbina = {
    object_type = "Joker",
    order = 116,

    key = "columbina",
    config = {
      extra = {
        percent = 0,
        percent_mod = 5
      }
    },
    rarity = 2,
    pos = { x = 11, y = 4 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent,
                card.ability.extra.percent_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.using_consumeable and not context.blueprint then
        if context.consumeable.ability.set == 'Spectral' then
            card.ability.extra.percent = card.ability.extra.percent + card.ability.extra.percent_mod
            return {
                message = card.ability.extra.percent .. "%"
            }
        end
      end

      if context.joker_main then
        if card.ability.extra.percent > 0 then
            -- return balance_percent(card,(card.ability.extra.percent*0.01))
            return {
                aij_balance_percent = card.ability.extra.percent * 0.01
            }
        end
      end
    end,
    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.selected_back.effect.center.key ~= 'b_plasma' then
                return true
            end
        end
        return false
    end,
  
}
return { name = {"Jokers"}, items = {columbina} }
