local magazine_ad = {
    object_type = "Joker",
    order = 309,

    key = "magazine_ad",
    config = {
    },
    rarity = 2,
    pos = { x = 6, y = 12 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'red_seal'}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.beat_boss and context.main_eval and not context.blueprint then
            local temp_deck = {}
            for _, v in ipairs(G.deck.cards) do
                if not v.seal then
                    table.insert(temp_deck, v)
                end
            end
            if #temp_deck > 0 then
                local chosen_card = pseudorandom_element(temp_deck, 'magazine_ad')
                chosen_card:set_seal('Red', true, true)
                chosen_card:juice_up(0.3,0.3)
                play_sound('gold_seal', 1.2, 0.4)
                return {
                    message = localize { type = 'name_text', set = 'Other', key = 'red_seal' }
                }
            end
        end
    end

}
return { name = { "Jokers" }, items = { magazine_ad } }
