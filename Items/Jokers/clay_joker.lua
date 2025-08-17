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
        if G.jest_clay_last_destroyed and G.jest_clay_last_destroyed.cards[1] then
            local other_joker = G.jest_clay_last_destroyed.cards[1]
            info_queue[#info_queue + 1] = G.P_CENTERS[other_joker.config.center.key]
        end
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        local other_joker = G.jest_clay_last_destroyed.cards[1]
        return SMODS.blueprint_effect(card, other_joker, context)
    end

}
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
    local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
    if G.jokers and self.ability.set == 'Joker' then
        if not self.ability.jest_sold_self then
            G.jest_clay_last_destroyed.cards = {}
            if not (self.ability.name == 'j_aij_visage' or self.ability.name == 'j_aij_clay_joker') then
                local copied_card = copy_card(self, nil, 0) -- Creates a copy with 0 scale
                G.jest_clay_last_destroyed:emplace(copied_card)
            end
        end
    end
    return ref
end

return { name = { "Jokers" }, items = { clay_joker } }
