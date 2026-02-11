local rubberhose = {
    object_type = "Joker",
    order = 419,
    key = "rubberhose",
    
    config = {
        extra = {
            mult = 10
        }
    },
    rarity = 1,
    pos = { x = 19, y = 20 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local dark, light = 0, 0
            for _, v in ipairs(context.scoring_hand) do
                if v:is_suit('Spades') or v:is_suit('Clubs') then dark = dark + 1 end
                if v:is_suit('Hearts') or v:is_suit('Diamonds') then light = light + 1 end
            end
            
            if (dark > 0 and light == 0) or (light > 0 and dark == 0) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { rubberhose } }
