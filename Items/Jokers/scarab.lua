local scarab = {
    object_type = "Joker",
    order = 972,
    ignore = true,
    key = "scarab",
    config = {
        extra = {
            ante_mod = 1,
            prev_ante_mod = "1"
        }
    },
    attributes = { 'passive' },
    rarity = 3,
    pos = { x = 21, y = 44},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.ante_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if (context.joker_type_destroyed and context.card == card) then
            if G.GAME.round_resets.ante == G.GAME.win_ante then
                return {
                    no_destroy = true
                }
            end
        end
    end,

    can_sell = function(self, context)
        if G.GAME.round_resets.ante == G.GAME.win_ante then
            return false
        end
        return true
    end,

    add_to_deck = function(self, card, from_debuff)
        ease_ante(-card.ability.extra.ante_mod)
    end,

    remove_from_deck = function(self, card, from_debuff)
        ease_ante(card.ability.extra.ante_mod)
        if G.GAME.round_resets.ante + card.ability.extra.ante_mod == G.GAME.win_ante then
            G.from_boss_tag = true
            G.FUNCS.reroll_boss()
        end
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
                ante_mod = ante_mod + card.ability.extra.ante_mod
                card.ability.extra.prev_ante_mod = tostring(tonumber(card.ability.extra.prev_ante_mod) or 0)
                if ante_mod ~= tonumber(card.ability.extra.prev_ante_mod) and (G.GAME.round_resets.ante + (tonumber(card.ability.extra.prev_ante_mod) - ante_mod)) <= G.GAME.win_ante then
                    card.ability.extra.prev_ante_mod = tostring(ante_mod)
                    ease_ante(tonumber(card.ability.extra.prev_ante_mod) - ante_mod)
                end
            end
        end
    end,

    in_pool = function(self, args)
        if G.GAME.round_resets.ante ~= G.GAME.win_ante+1 and not (MP and MP.LOBBY.code) then
            return true
        else
            return false
        end
    end,
}
return { name = {"Jokers"}, items = {scarab} }