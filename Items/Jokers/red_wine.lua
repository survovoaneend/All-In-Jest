local red_wine = {
    object_type = "Joker",
    order = 104,

    key = "red_wine",
    config = {

    },
    rarity = 2,
    pos = { x = 24, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)
        if context.after then
            local first_card = { context.scoring_hand[1] }
            if not first_card[1]:is_suit("Hearts") then
                All_in_Jest.change_suit("Hearts", first_card)
                delay(0.6)
            end
            return true
        end
    end

}
return { name = { "Jokers" }, items = { red_wine } }
