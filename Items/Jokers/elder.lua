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
            local copied_center = target_joker.config.center
            local info_queue_center = { -- Create a simplified "fake" center that can be used without referencing/modifying the actual center object
                key = copied_center.key,
                name = copied_center.name,
                config = copied_center.config,
                blueprint_compat = copied_center.blueprint_compat,
                discovered = true,
                set = "Joker",
                create_fake_card = copied_center.create_fake_card,
                generate_ui = copied_center.generate_ui,
                loc_vars = copied_center.loc_vars
            }

            local other_vars = nil
            if copied_center.loc_vars then
                local ret = copied_center:loc_vars({}, target_joker)
                if ret then
                    other_vars = ret.vars
                end
            else
                other_vars, _, _ = target_joker:generate_UIBox_ability_table(true)
            end

            if other_vars then
                info_queue_center.specific_vars = other_vars
                info_queue_center.specific_vars.aij_elder = target_joker
            end

            info_queue[#info_queue + 1] = info_queue_center

            card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ''
            card.ability.blueprint_compat_check = nil
            local main_end = (card.area and card.area == G.jokers) and {
                {n=G.UIT.C, config={align = "bm", minh = 0.4}, nodes={
                    {n=G.UIT.C, config={ref_table = card, align = "m", colour = G.C.JOKER_GREY, r = 0.05, padding = 0.06, func = 'blueprint_compat'}, nodes={
                        {n=G.UIT.T, config={ref_table = card.ability, ref_value = 'blueprint_compat_ui',colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.8}},
                    }}
                }}
            } or nil

            return { vars = { localize{type="name_text", set="Joker", key = copied_center.key} }, main_end = main_end }
        end

        return { vars = { "None" } }
    end,

    update = function(self, card, dt)
        local target_joker = All_in_Jest.get_longest_held_joker()
        if target_joker and target_joker ~= card and (target_joker.ability.aij_blueprint_compat or target_joker.config.center.blueprint_compat) then
            card.ability.blueprint_compat = 'compatible'
        else
            card.ability.blueprint_compat = 'incompatible'
        end
    end,

    calculate = function(self, card, context)
        local target_joker = All_in_Jest.get_longest_held_joker(SMODS.find_card("j_aij_elder"))
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
