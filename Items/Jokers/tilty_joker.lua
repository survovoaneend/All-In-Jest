local tilty_joker = {
    object_type = "Joker",
    order = 273,
    key = "tilty_joker",
    config = {
      extra = {
          semi_x_chips = 2
      }
    },
    rarity = 1,
    pos = { x = 21, y = 10},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    pixel_size = { w = 43, h = 95 },
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.semi_x_chips,
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.before and G.play then
        for _, temp_card in ipairs(G.play.cards) do
          jest_ability_calculate(temp_card, "*", card.ability.extra.semi_x_chips, nil, {"nominal"}, false, true, "base")
          temp_card.ability.all_in_jest = temp_card.ability.all_in_jest or {}
          temp_card.ability.all_in_jest.tilty_joker_affected = true
        end
        return nil, true
      end

      if context.after and G.playing_cards then
        for _, temp_card in ipairs(G.playing_cards) do
          if temp_card.ability.all_in_jest and temp_card.ability.all_in_jest.tilty_joker_affected then
            jest_ability_calculate(temp_card, "/", card.ability.extra.semi_x_chips, nil, {"nominal"}, false, true, "base")
            temp_card.ability.all_in_jest.tilty_joker_affected = nil
          end
        end
        return nil, true
      end
    end
  
}
return { name = {"Jokers"}, items = {tilty_joker} }
