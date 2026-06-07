local comic_panel = {
    object_type = "Joker",
    order = 491,
    key = "comic_panel",
    
    config = {
        extra = {
            odds = 10
        }
    },
    rarity = 1,
    pos = { x = 7, y = 24 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'comic_panel')
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before then
            if SMODS.pseudorandom_probability(card, 'comic_panel', 1, card.ability.extra.odds) then
                for _, v in ipairs(context.full_hand) do
                    local enh = SMODS.poll_enhancement {key = "aij_comic", guaranteed = true}
                    v:set_ability(enh, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    })) 
                end
                return {
                    message = localize('k_aij_change_ex'),
                    colour = G.C.PURPLE
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { comic_panel } }
