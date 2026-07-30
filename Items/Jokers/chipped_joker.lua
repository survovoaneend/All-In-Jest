local chipped_joker = {
    object_type = "Joker",
    order = 478,
    key = "chipped_joker",
    config = {
        extra = {
            chips_mod = 10,
            chips = 0,
        }
    },
    attributes = { 'chips', 'scaling', 'modify_card', 'enhancements', },
    rarity = 1,
    pos = { x = 19, y = 23 },
    ignore = true,
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips_mod,
                card.ability.extra.chips,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for k, v in pairs(context.scoring_hand) do
                if SMODS.has_enhancement(v, 'm_stone') then
                    local ability_table = (v.config.center.key == 'm_stone' and v.ability) or (v.config.aij_other_center and v.config.aij_other_center.center.key == 'm_stone' and v.config.aij_other_center.ability) or nil
                    local chip_increase = 0
                    local base_ability_table = v.ability
                    if ability_table and (ability_table.bonus - card.ability.extra.chips_mod) >= 0 then
                        chip_increase = card.ability.extra.chips_mod
                        ability_table.bonus = ability_table.bonus - chip_increase
                        base_ability_table.chipped_joker_chips_taken = base_ability_table.chipped_joker_chips_taken or 0
                        base_ability_table.chipped_joker_chips_taken = base_ability_table.chipped_joker_chips_taken + chip_increase
                    elseif ability_table  then
                        chip_increase = ability_table.bonus
                        base_ability_table.chipped_joker_chips_taken = base_ability_table.chipped_joker_chips_taken or 0
                        base_ability_table.chipped_joker_chips_taken = base_ability_table.chipped_joker_chips_taken + chip_increase
                        ability_table.bonus = 0
                    end
                    if chip_increase > 0 then
                        local table = {chip_increase = chip_increase}
                        SMODS.scale_card(card, {
	                        ref_table = card.ability.extra,
                            ref_value = "chips",
                            scalar_table = table,
	                        scalar_value = "chip_increase",
                        })
                    end
                end
            end
        end
        if context.destroy_card then
            for k, v in pairs(context.scoring_hand) do
                if SMODS.has_enhancement(v, 'm_stone') then
                    local ability_table = (v.config.center.key == 'm_stone' and v.ability) or (v.config.aij_other_center and v.config.aij_other_center.center.key == 'm_stone' and v.config.aij_other_center.ability) or nil
                    if ability_table and ability_table.bonus <= 0 and v == context.destroy_card then 
                        return {
                            remove = true
                        }
                    end
                end
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
            }
        end
    end
}

return { name = { "Jokers" }, items = { chipped_joker } }
