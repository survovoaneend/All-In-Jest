local minus_world = {
    object_type = "Joker",
    order = 533,
    key = "minus_world",
    config = {
        extra = {
            ante_mod = 1,
            win_ante = 1,
            prev_ante_mod = "1"
        }
    },
    attributes = {},
    rarity = 3,
    pos = { x = 24, y = 24 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.win_ante,
                card.ability.extra.ante_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.selling_self then
            ease_ante(-card.ability.extra.ante_mod)
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.win_ante = G.GAME.win_ante - card.ability.extra.win_ante
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.win_ante = G.GAME.win_ante + card.ability.extra.win_ante
    end,

    update = function(self, card, dt)
        if G.GAME and G.GAME.round_resets.ante then
            local has_card = false
            if next(SMODS.find_card("j_aij_scarab")) then
                for k, v in pairs(SMODS.find_card("j_aij_scarab")) do
                    if v == card then
                        has_card = true
                    end
                end
            end
            if has_card then
                local ante_mod = 0
                ante_mod = ante_mod + card.ability.extra.win_ante
                card.ability.extra.prev_ante_mod = tostring(tonumber(card.ability.extra.prev_ante_mod) or 0)
                if ante_mod ~= tonumber(card.ability.extra.prev_ante_mod) and (G.GAME.win_ante + (tonumber(card.ability.extra.prev_ante_mod) - ante_mod)) >= G.GAME.round_resets.ante then
                    card.ability.extra.prev_ante_mod = tostring(ante_mod)
                    G.GAME.win_ante = G.GAME.win_ante + (tonumber(card.ability.extra.prev_ante_mod) - ante_mod)
                end
            end
        end
    end,

    in_pool = function(self, args)
        if G.GAME.round_resets.ante < G.GAME.win_ante and not (MP and MP.LOBBY.code) then
            return true
        else
            return false
        end
    end,
}

return { name = { "Jokers" }, items = { minus_world } }
