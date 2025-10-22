local clowns_on_parade = {
    object_type = "Joker",
    order = 123,

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
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
  
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
        SMODS.scale_card(card, {
	        ref_table = card.ability.extra,
            ref_value = "chips",
	        scalar_value = "chip_mod",
        })
      end
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end
  
}
return { name = {"Jokers"}, items = {clowns_on_parade} }
