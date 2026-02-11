local octopus = {
    object_type = "Joker",
    order = 384,
    key = "octopus",

    config = {
        extra = {

        }
    },
    rarity = 1,
    pos = { x = 13, y = 16 },
    atlas = 'joker_atlas',
    cost = 4,
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
        if context.after and not context.blueprint then
            local cards = {}
            for _, v in ipairs(context.scoring_hand) do
                if (v:get_id() == 7 or v:get_id() == 9) then
                    cards[#cards + 1] = v
                end
            end
            if #cards > 0 then
                return {
                    message = localize("k_aij_change_ex"),
                    func = function()
                        All_in_Jest.change_card(nil, '8', cards)
                        delay(0.5)
                    end
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { octopus } }
