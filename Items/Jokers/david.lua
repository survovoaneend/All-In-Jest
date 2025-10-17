local david = {
    object_type = "Joker",
    order = 184,

    key = "david",
    config = {
      extra = {
        chips = 0,
        chip_mod = 50
      }
    },
    rarity = 3,
    pos = { x = 18, y = 9},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return {
          vars = {
            card.ability.extra.chip_mod,
            card.ability.extra.chips
          }
        }
    end,
  
    calculate = function(self, card, context)
      local spade_kings, all_cards = 0, 0
      if context.before then
        for k, v in ipairs(context.full_hand) do
          all_cards = all_cards + 1
          if v:get_id() == 13 and v:is_suit('Spades') then
            spade_kings = spade_kings + 1
          end
        end
       if spade_kings == all_cards and not context.blueprint then 
          SMODS.scale_card(card, {
	        ref_table = card.ability.extra,
            ref_value = "chips",
	        scalar_value = "chip_mod",
            operation = '+',
          })
        end
      end
      if context.joker_main then
        return {
            chips = card.ability.extra.chips,
        }
      end
    end
  
}
return { name = {"Jokers"}, items = {david} }
