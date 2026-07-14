local lunar = {
    object_type = "Enhancement",
    key = 'lunar',
    atlas = 'enhancements_atlas',
    order = 9,
    pos = { x = 7, y = 5 },
    ignore = true,
    config = {
        extra = {
            
        }
    },
    all_in_jest = {
        multi_enhancement_z_order = -1
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,
    never_scores = true,
    calculate = function(self, card, context)
        if card.area == G.play and context.modify_hand then
            local chip_val = card:get_chip_bonus()
            SMODS.upgrade_poker_hands({
                hands = context.scoring_name,
                func = function(base, hand, parameter, level_up)
                    return base + chip_val
                end,
                level_up = 1,
                from = card,
                instant = nil,
                parameters = {"chips"}
            })
            hand_chips = mod_chips(hand_chips + chip_val)
        end
    end,

    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.all_in_jest and G.GAME.all_in_jest.weird_enhancements then
                return true
            end
        end
        return false
    end,
}

return {name = {"Enhancements"}, items = {lunar}}