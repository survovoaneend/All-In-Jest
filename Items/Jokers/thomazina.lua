local thomazina = {
    object_type = "Joker",
    order = 1024,

    key = "thomazina",
    config = {
      chips = 0,
      chip_mod = 2
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 3, y = 4},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    soul_pos = { x = 3, y = 5},
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.chips,
          card.ability.chip_mod
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
        if not context.other_card:is_face() and not context.other_card.no_rank then
          if not context.blueprint then
            card.ability.chips = card.ability.chips + card.ability.chip_mod
          end
          return {
            extra = not context.blueprint and {focus = card, message = localize('k_upgrade_ex')},
            chips = card.ability.chips,
          }
        end
      end
    end
  
}
return { name = {"Jokers"}, items = {thomazina} }
