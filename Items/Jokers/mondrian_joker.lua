local mondrian_joker = {
    object_type = "Joker",
    order = 214,

    key = "mondrian_joker",
    config = {
      extra = {
        mult = 0,
        mult_mod = 4
      }
    },
    rarity = 2,
    pos = { x = 3, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    
    loc_vars = function(self, info_queue, card)
      local four_count = 0
        if G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card:get_id() == 4 and not SMODS.has_no_rank(card) then
                    four_count = four_count + 1
                end
            end
        end
        SMODS.scale_card(card, {
	        ref_table = card.ability.extra,
            ref_value = "mult",
	        scalar_value = "mult_mod",
            operation = function(ref_table, ref_value, initial, change)
	            ref_table[ref_value] = four_count * change
            end,
            no_message = true,
        })
        local current_mult = card.ability.extra.mult
        return { vars = {card.ability.extra.mult_mod, current_mult} }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
          local four_count = 0
          if G.playing_cards then
              for _, deck_card in ipairs(G.playing_cards) do
                  if deck_card:get_id() == 4 and not SMODS.has_no_rank(deck_card) then
                      four_count = four_count + 1
                  end
              end
          end

          SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "mult",
	            scalar_value = "mult_mod",
                operation = function(ref_table, ref_value, initial, change)
	                ref_table[ref_value] = four_count * change
                end,
                no_message = true,
          })
          local total_mult = card.ability.extra.mult

          if total_mult > 0 then
              return {
                  mult = total_mult, 
              }
          end
      end
  end

  
}
return { name = {"Jokers"}, items = {mondrian_joker} }
