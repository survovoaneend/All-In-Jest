local ambrosius = {
    object_type = "Joker",
    order = 186,
    
    key = "ambrosius",
    config = {
        extra = {
            odds = 3,
            pack_size = 0,
            prev_pack_size = "0",
            pack_mod = 1
        }
    },
    attributes = { 'booster', 'scaling', 'rank', 'suit', 'king', 'crowns', 'chance' },
    rarity = 3,
    pos = { x = 0, y = 37},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    jest_rec_paperback = true,
    
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
                card.ability.extra.pack_size,
                card.ability.extra.pack_mod
            }
        }
    end,
    
    calculate = function(self, card, context)
        local crown_kings, all_cards = 0, 0
        if context.before then
            for k, v in ipairs(context.full_hand) do
                all_cards = all_cards + 1
                if v:get_id() == 13 and v:is_suit('paperback_Crowns', false, true) then
                    crown_kings = crown_kings + 1
                end
            end
            if crown_kings == all_cards and not context.blueprint then 
                if SMODS.pseudorandom_probability(card, 'ambrosius', 1, card.ability.extra.odds) then
                    SMODS.scale_card(card, {
	                    ref_table = card.ability.extra,
                        ref_value = "pack_size",
	                    scalar_value = "pack_mod",
                    })
                else
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), colour = G.C.SECONDARY_SET.Tarot})
                    return true end }))
                end
            end
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.modifiers.arcana_booster_size_mod = (G.GAME.modifiers.arcana_booster_size_mod or 0) + tonumber(card.ability.extra.prev_pack_size)
    end,
    
    update = function(self, card, dt)
        if G.GAME and G.GAME.round_resets.ante and G.hand then
            local has_card = false
            if next(SMODS.find_card("j_aij_ambrosius")) then
                for k, v in pairs(SMODS.find_card("j_aij_ambrosius")) do
                    if v == card then
                        has_card = true
                    end
                end
            end
            if has_card then
                local pack_size = 0
                pack_size = pack_size + card.ability.extra.pack_size
                card.ability.extra.prev_pack_size = tostring(tonumber(card.ability.extra.prev_pack_size) or 0)
                if pack_size ~= prev_pack_size then
                    G.GAME.modifiers.arcana_booster_size_mod = (G.GAME.modifiers.arcana_booster_size_mod or 0) + (pack_size - tonumber(card.ability.extra.prev_pack_size))
                    card.ability.extra.prev_pack_size = tostring(pack_size)
                end
            end
        end
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.arcana_booster_size_mod = (G.GAME.modifiers.arcana_booster_size_mod or 0) - tonumber(card.ability.extra.prev_pack_size)
    end,
}
return { name = {"Jokers"}, items = {ambrosius} }
