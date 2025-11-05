
table.insert(SMODS.calculation_keys, "aij_grim_joker_bluepurple_seal_negative_mod")
table.insert(SMODS.other_calculation_keys, "aij_grim_joker_bluepurple_seal_negative_mod")
local aij_original_smods_calculate_individal_effect = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    
    if key == "aij_grim_joker_bluepurple_seal_negative_mod" then
        return { [key] = amount }
    end

    return aij_original_smods_calculate_individal_effect(effect, scored_card, key, amount, from_edition)
end

local the_grim_joker = {
    object_type = "Joker",
    order = 321,
    key = "the_grim_joker",
    config = {
      extra = {
          odds = 2,
      }
    },
    rarity = 2,
    pos = { x = 17, y = 12},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    pixel_size = { w = 63, h = 95 },
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'blue_seal'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'purple_seal'}
        info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.aij_grim_joker_bluepurple_seal and not context.negative_guaranteed then
            if SMODS.pseudorandom_probability(card, 'the_grim_joker', 1, card.ability.extra.odds) then
                context.negative_guaranteed = true -- Set to prevent multiple Grim Jokers from juicing up
                return {
                    juice_card = context.blueprint_card or card,
                    aij_grim_joker_bluepurple_seal_negative_mod = true
                }
            end
        end
    end,

    in_pool = function(self, args)
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.seal and (card.seal == 'Purple' or card.seal == 'Blue') then
                    return true
                end
            end
        end
        return false
    end,
}
return { name = {"Jokers"}, items = {the_grim_joker} }
