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
                'retrigger',
                'scaling',
                'hand_type',
                'suit',
                'rank',
                'face',
                'economy',
                'generation',
                'destroy_card',
                'hand_size',
                'chance',
                'tarot',
                'planet',
                'food',
            },
        }
    },
    attributes = { 'activated', 'passive' },
    rarity = 4,
    unlock_condition = { hidden = true },
    pos = { x = 0, y = 18},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    soul_pos = { x = 0, y = 19},

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
                for k, v in pairs(card.ability.extra.list) do
                    if v == card.ability.extra.current_mult then
                        card.ability.extra.current_mult = card.ability.extra.list[k+1] or card.ability.extra.list[1]
                        break
                    end
                end
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('aij_wanba_attributes')[card.ability.extra.current_mult]})
            end
        end,
    },
    add_to_deck = function(self, card, from_debuff)
        aij_change_shop_size_advanced(1, 'wamba_'..card.sort_id, 'Joker')
    end,
    remove_from_deck = function(self, card, from_debuff)
        aij_change_shop_size_advanced(-1, 'wamba_'..card.sort_id, 'Joker')
    end
}

local create_card_ref = SMODS.create_card
function SMODS.create_card(args)
    if args.aij_slot_details and args.aij_slot_details.remove_tag then
        for _, other in ipairs(SMODS.find_card('j_aij_wamba')) do
            if args.aij_slot_details.remove_tag == ('wamba_'..other.sort_id) then
                args.key = SMODS.poll_object{
                    attributes = {other.ability.extra.current_mult},
                    rarity = false,
                }
                break
            end
        end
    end
    return create_card_ref(args)
end
return { name = {"Jokers"}, items = {wamba} }