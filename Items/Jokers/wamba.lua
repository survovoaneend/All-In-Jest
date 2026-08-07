local wamba = {
    object_type = "Joker",
    order = 10007,

    key = "wamba",
    config = {
        extra = {
            current_mult = 'mult',
            multiplier = 5,
            list = {
                'mult',
                'chips',
                'xmult',
                'balance',
                'retrigger',
                'scaling',
                'diamonds',
                'hearts',
                'spades',
                'clubs',
                'hand_type',
                'ace',
                'two',
                'three',
                'four',
                'five',
                'six',
                'seven',
                'eight',
                'nine',
                'ten',
                'jack',
                'queen',
                'king',
                'face',
                'economy',
                'generation',
                'destroy_card',
                'hand_size',
                'discard',
                'hands',
                'chance',
                'mod_chance',
                'tarot',
                'planet',
                'spectral',
                'food',
            }
        }
    },
    attributes = { 'activated', 'passive' },
    rarity = 4,
    unlock_condition = { hidden = true },
    pos = { x = 0, y = 18},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 0, y = 19},
    ignore = true,

    loc_vars = function(self, info_queue, card)
        local localized = localize('aij_wanba_attributes')[card.ability.extra.current_mult]
        return { 
            vars = {
                localized,
                card.ability.extra.multiplier,
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    all_in_jest = {
        can_use_ability = function(self, card, context)
            return true
        end,

        use_ability = function(self, card, args)
            args = args or {}
            if not args.retriggered then 
                G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] = G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] - card.ability.extra.multiplier
                for k, v in pairs(card.ability.extra.list) do
                    if v == card.ability.extra.current_mult then
                        card.ability.extra.current_mult = card.ability.extra.list[k+1] or card.ability.extra.list[1]
                        break
                    end
                end
                G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] = G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] or 0
                G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] = G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] + card.ability.extra.multiplier
            end
        end,
    },

    add_to_deck = function(self, card, from_debuff)
        G.GAME.aij_modify_weight = G.GAME.aij_modify_weight or {}
        G.GAME.aij_modify_weight['attributes'] = G.GAME.aij_modify_weight['attributes'] or {}
        G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] = G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] or 0
        G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] = G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] + card.ability.extra.multiplier
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.aij_modify_weight = G.GAME.aij_modify_weight or {}
        G.GAME.aij_modify_weight['attributes'] = G.GAME.aij_modify_weight['attributes'] or {}
        G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] = G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] or 0
        G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] = G.GAME.aij_modify_weight['attributes'][card.ability.extra.current_mult] - card.ability.extra.multiplier
    end
}
return { name = {"Jokers"}, items = {wamba} }