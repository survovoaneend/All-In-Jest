local wax_joker = {
    object_type = "Joker",
    order = 421,
    key = "wax_joker",
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 21, y = 20 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after then
            local seal_trigger = false
            for k, v in pairs(context.full_hand) do
                if v.seal then
                    G.E_MANAGER:add_event(Event ({
                        trigger = 'before',
                        func = function()
                            v:set_seal('aij_melted', true)
                            v:juice_up(0.3,0.3)
                            play_sound('gold_seal', 1.2, 0.4)
                            return true
                        end 
                    }))
                    seal_trigger = true
                end
            end
            if seal_trigger then 
                return {
                    message = localize('k_aij_melted_ex')
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { wax_joker } }
