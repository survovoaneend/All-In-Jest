local zenzizenzizenzic = {
    object_type = "Joker",
    order = 575,
    key = "zenzizenzizenzic",
  
    config = {
        extra = {
            chips = 0,
            mod = 0,
            mod_mod = 2
        }
    },
    attributes = { 'chips', 'scaling' },
    rarity = 3,
    pos = { x = 14, y = 27 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    pixel_size = { w = 68, h = 68 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mod,
                card.ability.extra.mod_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and #context.scoring_hand == 4 and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mod",
                scalar_value = "mod_mod",
                no_message = true,
            })
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chips",
                scalar_value = "mod",
                no_message = true,
            })
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
        if context.joker_main and #context.scoring_hand == 4 then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}


return { name = { "Jokers" }, items = { zenzizenzizenzic } }