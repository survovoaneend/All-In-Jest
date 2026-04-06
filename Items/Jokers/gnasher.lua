local gnasher = {
    object_type = "Joker",
    order = 166,

    key = "gnasher",
    config = {
        extra = {
            active = true,
        }
    },
    rarity = 2,
    pos = { x = 10, y = 6 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    all_in_jest = {
        can_use_ability = function(self, card, context)
            local viable_options = {}
            for i, v in ipairs(G.consumeables.cards) do
                local area = G.consumeables.cards[i].area
                G.consumeables.cards[i].area = nil
                if G.consumeables.cards[i]:can_use_consumeable() then
                    viable_options[#viable_options + 1] = i
                end
                G.consumeables.cards[i].area = area
            end
            if card.ability.extra.active and #viable_options > 0 then
                return true
            end
        end,

        use_ability = function(self, card)
            local viable_options = {}
            for i, v in ipairs(G.consumeables.cards) do
                local area = G.consumeables.cards[i].area
                G.consumeables.cards[i].area = nil
                if G.consumeables.cards[i]:can_use_consumeable() then
                    viable_options[#viable_options + 1] = i
                end
                G.consumeables.cards[i].area = area
            end
            local copied_consumeable = copy_card(G.consumeables.cards[pseudorandom_element(viable_options, pseudoseed('gnasher_consumeable'))])

            -- Without this will crash with Wheel of Fortune, Ectoplasm and Hex
            copied_consumeable:update(0)
            G.FUNCS.use_card({ config = { ref_table = copied_consumeable } })

            card.ability.extra.active = false
        end,
    },

    loc_vars = function(self, info_queue, card)
        local active_text = ""
        if not card.ability.extra.active then
            active_text = "(" .. localize('k_inactive') .. ")"
        else
            active_text = "(" .. localize('k_active') .. ")"
        end
        return {
            vars = {
                active_text,
                colours = {
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    calculate = function(self, card, context)
        if context.ante_change and context.ante_change ~= 0 and context.ante_end and not context.blueprint then
            card.ability.extra.active = true
        end
    end
}
return { name = { "Jokers" }, items = { gnasher } }
