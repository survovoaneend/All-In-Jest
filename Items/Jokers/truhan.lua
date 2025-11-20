local truhan = {
    object_type = "Joker",
    order = 220,

    key = "truhan",
    config = {
      extra = {
        xmult = 1,
        xmult_mod = 0.1
      }
    },
    rarity = 2,
    pos = { x = 9, y = 8},
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
                card.ability.extra.xmult,
                card.ability.extra.xmult_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.jest_destroying_or_selling_joker then
        if context.jest_destroyed_joker.ability.jest_held_for and tonumber(context.jest_destroyed_joker.ability.jest_held_for) > 0 then
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "xmult",
	            scalar_value = "xmult_mod",
                operation = function(ref_table, ref_value, initial, change)
	                ref_table[ref_value] = initial + (change * (tonumber(context.jest_destroyed_joker.ability.jest_held_for) or 0))
                end,
            })
        end
      end
      if context.joker_main then
        return {
          xmult = card.ability.extra.xmult,
        }
      end
    end
}

local ease_roundref = ease_round
function ease_round(mod)
    local ref = ease_roundref(mod)
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].ability.jest_held_for ~= nil then
            G.jokers.cards[i].ability.jest_held_for = tostring(mod + tonumber(G.jokers.cards[i].ability.jest_held_for))
        else
            G.jokers.cards[i].ability.jest_held_for = tostring(mod)
        end
    end
    return ref
end
-- Unnecessary for Truhan, but needed for other effects
local card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    local ret = card_set_ability_ref(self, center, initial, delay_sprites)

    self.ability.jest_held_for = "0"

    return ret
end
return { name = {"Jokers"}, items = {truhan} }
