local body_pillow = {
    object_type = "Joker",
    order = 425,
    key = "body_pillow",

    config = {
        extra = {
            dollars = 2
        }
    },
    rarity = 3,
    pos = { x = 0, y = 21 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before then
            local unscored_cards = {}
            for _, played_card in ipairs(context.full_hand) do
                local is_scoring = false
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if played_card == scoring_card then is_scoring = true end
                end

                if not is_scoring then
                    table.insert(unscored_cards, played_card)
                end
            end

            for i = 1, #unscored_cards do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        unscored_cards[i]:juice_up()
                        card:juice_up()
                        return true
                    end,
                }))
                ease_dollars(card.ability.extra.dollars)
                delay(0.23)
            end
            return true
        end
    end
}

return { name = { "Jokers" }, items = { body_pillow } }
