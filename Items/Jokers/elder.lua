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
        local target_joker = All_in_Jest.get_longest_held_joker()


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
                target_joker.config.center.specific_vars.aij_elder = target_joker
            end

            info_queue[#info_queue + 1] = target_joker.config.center

            return { vars = { localize{type="name_text", set="Joker", key = target_joker.config.center.key} } }
        end

        return { vars = { "None" } }
    end,

    calculate = function(self, card, context)
        local target_joker = All_in_Jest.get_longest_held_joker()
        if target_joker then
            return SMODS.blueprint_effect(card, target_joker, context)
        end
    end
}

local card_add_to_deck_ref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if not from_debuff and not self.added_to_deck then
        local max_index = -1
        if G.jokers and G.jokers.cards then
            for _, v in ipairs(G.jokers.cards) do
                if v.ability.jest_held_order then
                    if tonumber(v.ability.jest_held_order) > max_index then
                        max_index = tonumber(v.ability.jest_held_order)
                    end
                end
            end
        end
        self.ability.jest_held_order = tostring(max_index + 1)
    end
    return card_add_to_deck_ref(self, from_debuff)
end
return { name = { "Jokers" }, items = { elder } }
