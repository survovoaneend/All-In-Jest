local clay_joker = {
    object_type = "Joker",
    order = 102,

    key = "clay_joker",
    config = {
        extra = {

        }
    },
    rarity = 2,
    pos = { x = 22, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        if G.all_in_jest_clay_last_destroyed and G.all_in_jest_clay_last_destroyed.cards[1] then
            local other_joker = G.all_in_jest_clay_last_destroyed.cards[1]
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
                other_joker.config.center.specific_vars.aij_clay = true
            end
            info_queue[#info_queue + 1] = other_joker.config.center
        end
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if G.all_in_jest_clay_last_destroyed and G.all_in_jest_clay_last_destroyed.cards[1] then
            local other_joker = G.all_in_jest_clay_last_destroyed.cards[1]
            return SMODS.blueprint_effect(card, other_joker, context)
        end
    end

}
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
    local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
    if G.jokers and self.ability.set == 'Joker' then
        if not self.ability.jest_sold_self then
            G.all_in_jest_clay_last_destroyed.cards = {}
            if not (self.ability.name == 'j_aij_visage' or self.ability.name == 'j_aij_clay_joker') then
                local copied_card = copy_card(self, nil, 0) -- Creates a copy with 0 scale
                G.all_in_jest_clay_last_destroyed:emplace(copied_card)
            end
        end
    end
    return ref
end

return { name = { "Jokers" }, items = { clay_joker } }
