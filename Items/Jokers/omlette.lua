local omlette = {
    object_type = "Joker",
    order = 256,
    key = "omlette",
    config = {
      extra = {
          sell_gain = 3
      }
    },
    rarity = 2,
    pos = { x = 3, y = 10},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    pools = {
        Food = true
    },
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.sell_gain,
            }
        }
    end,
  
    calculate = function(self, card, context)
          if context.pre_discard and context.cardarea ~= G.play then
                card.ability.extra_value = card.ability.extra_value + card.ability.extra.sell_gain
                card:set_cost()
                return {
                    message = localize('k_val_up'),
                    colour = G.C.MONEY
                }
          end
          if context.before and context.scoring_hand then
                card.ability.extra_value = card.ability.extra_value + card.ability.extra.sell_gain
                card:set_cost()
                return {
                    message = localize('k_val_up'),
                    colour = G.C.MONEY
                }
          end
    end,
    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.jest_omlette_appearence_eggs >= 2 then
                return true
            end
        end
        return false
    end,
}
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
  if G.jokers and (self.config.center.key == "j_egg" or self.ability.set == 'j_aij_egg_cc') then
      G.GAME.jest_omlette_appearence_eggs = G.GAME.jest_omlette_appearence_eggs + 1
  end
  return ref
end
return { name = {"Jokers"}, items = {omlette} }
