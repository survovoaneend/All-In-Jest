local infuriating_note = {
    object_type = "Joker",
    order = 191,

    key = "infuriating_note",
    config = {
        extra = {
            xmult = 1.25
        }
    },
    rarity = 1,
    pos = { x = 5, y = 7 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    in_pool = function(self, args)
        return true, { allow_duplicates = true }
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.open_booster then
            card.ability.extra.trigger = true
        end
    end,
    update = function(self, card, dt)
        if G.jokers then
            local has_note = next(SMODS.find_card("j_aij_infuriating_note"))
            if has_note then
                if G.shop_jokers and G.shop_jokers.cards then
                    for i = 1, #G.shop_jokers.cards do
                        if G.shop_jokers.cards[i].ability.set == "Joker" then
                            if G.shop_jokers.cards[i].config.center_key == 'j_aij_infuriating_note' and ((G.shop_jokers.cards[i].edition and G.shop_jokers.cards[i].edition.key ~= 'e_negative') or G.shop_jokers.cards[i].edition == nil) then
                                G.shop_jokers.cards[i]:set_edition({ negative = true })
                                G.shop_jokers.cards[i]:set_cost()
                            end
                        end
                    end
                end
                if G.pack_cards and card.ability.extra.trigger then
                    if G.pack_cards.cards then
                        for i = 1, #G.pack_cards.cards do
                            if G.pack_cards.cards[i].ability.set == "Joker" then
                                if G.pack_cards.cards[i].config.center_key == 'j_aij_infuriating_note' and ((G.shop_jokers.cards[i].edition and G.shop_jokers.cards[i].edition.key ~= 'e_negative') or G.shop_jokers.cards[i].edition == nil) then
                                    G.pack_cards.cards[i]:set_edition({ negative = true })
                                    G.pack_cards.cards[i]:set_cost()
                                    card.ability.extra.trigger = false
                                end
                            end
                        end
                    end
                end
            end
        end
    end,
    get_weight = function(self)
        local has_note = next(SMODS.find_card("j_aij_infuriating_note"))
        if has_note then
            return 5
        end
        return 0
    end,
}
return { name = { "Jokers" }, items = { infuriating_note } }
