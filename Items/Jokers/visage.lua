local visage = {
    object_type = "Joker",
    order = 232,
    ignore = true,
    key = "visage",
    config = {
        extra = {

        }
    },
    rarity = 2,
    pos = { x = 21, y = 8 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        if G.all_in_jest_visage_last_sold and G.all_in_jest_visage_last_sold.cards[1] then
            local other_joker = G.all_in_jest_visage_last_sold.cards[1]
            local other_vars = nil
            if other_joker.config.center.loc_vars then
                local ret = other_joker.config.center:loc_vars({}, other_joker)
                if ret then
                    other_vars = ret.vars
                end
            else
                other_vars, _, _ = other_joker:generate_UIBox_ability_table(true)
            end
            if other_vars then
                other_joker.config.center.specific_vars = other_vars
                other_joker.config.center.specific_vars.aij_visage = true
            end
            info_queue[#info_queue + 1] = other_joker.config.center
        end
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if G.all_in_jest_visage_last_sold and G.all_in_jest_visage_last_sold.cards[1] then
            local other_joker = G.all_in_jest_visage_last_sold.cards[1]
            return SMODS.blueprint_effect(card, other_joker, context)
        end
    end

}

return { name = { "Jokers" }, items = { visage } }
