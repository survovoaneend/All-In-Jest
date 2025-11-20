local get_longest_held = function()
    local longest_joker = nil
    local max_rounds = -1
    if G.jokers and G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
            local is_elder = (v.config.center.key == "j_aij_elder")
            if not is_elder and v.ability.jest_held_for then
                if v.ability.jest_held_for > max_rounds then
                    max_rounds = v.ability.jest_held_for
                    longest_joker = v
                end
            end
        end
    end
    return longest_joker
end

local elder = {
    object_type = "Joker",
    order = 513,

    key = "elder",
    config = {
        extra = {

        }
    },
    rarity = 3,
    pos = { x = 4, y = 21 },
    atlas = 'joker_atlas',
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local target_joker = get_longest_held()


        if target_joker then
            local other_vars = nil
            if target_joker.config.center.loc_vars then
                local ret = target_joker.config.center:loc_vars({}, target_joker)
                if ret then
                    other_vars = ret.vars
                end
            else
                other_vars, _, _ = target_joker:generate_UIBox_ability_table(true)
            end

            if other_vars then
                target_joker.config.center.specific_vars = other_vars
                target_joker.config.center.specific_vars.aij_elder = true
            end

            info_queue[#info_queue + 1] = target_joker.config.center

            return { vars = { target_joker.config.center.name } }
        end

        return { vars = { "None" } }
    end,

    calculate = function(self, card, context)
        local target_joker = get_longest_held()
        if target_joker then
            return SMODS.blueprint_effect(card, target_joker, context)
        end
    end
}
return { name = { "Jokers" }, items = { elder } }
