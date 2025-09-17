local kilroy = {
    object_type = "Joker",
    order = 132,

    key = "kilroy",
    config = {
      extra = {modchips = 50, curchips = 0}
    },
    rarity = 1,
    pos = { x = 1, y = 5 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
        SMODS.scale_card(card, {
	        ref_table = card.ability.extra,
            ref_value = "curchips",
	        scalar_value = "modchips",
            operation = function(ref_table, ref_value, initial, change)
	            ref_table[ref_value] = change * G.GAME.jest_kilroy_sold
            end,
            no_message = true,
        })
        return { vars = {card.ability.extra.modchips, card.ability.extra.curchips}}
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "curchips",
	            scalar_value = "modchips",
                operation = function(ref_table, ref_value, initial, change)
	                ref_table[ref_value] = change * G.GAME.jest_kilroy_sold
                end,
                no_message = true,
            })
            if card.ability.extra.curchips ~= 0 then
                return {
                  chips = card.ability.extra.curchips,
                }
            end
        end
    end
}
local sell_card_ref = Card.sell_card
function Card:sell_card()
  local ref = sell_card_ref(self)
  if self.config.center_key == "j_aij_kilroy" then
    G.GAME.jest_kilroy_sold = G.GAME.jest_kilroy_sold + 1
  end
  return ref
end
return { name = {"Jokers"}, items = {kilroy} }
