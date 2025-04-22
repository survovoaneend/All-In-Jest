SMODS.Joker {
    key = "clowns_on_parade",
    config = {
      extra = {
        chips = 0,
        chip_mod = 20
      }
    },
    rarity = 2,
    pos = { x = 17, y = 4 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.chips,
          card.ability.extra.chip_mod
        }
      }
    end,
  
  calculate = function(self, card, context)
    local twos = 0
    if context.before and not context.blueprint then
      for k, v in ipairs(context.full_hand) do
        if v:get_id() == 2 then
          twos = twos + 1
        end
      end
      if twos >= 3 then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
        return {
          message = localize('k_upgrade_ex'),
          chips = card.ability.extra.chips
        }
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end
  }