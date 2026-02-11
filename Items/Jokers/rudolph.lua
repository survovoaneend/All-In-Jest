local rudolph = {
    object_type = "Joker",
    order = 360,

    key = "rudolph",
    config = {
    },
    rarity = 2,
    pos = { x = 19, y = 19 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = 'Other', key = 'red_seal' }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.scoring_hand and context.scoring_hand[1] and
                context.scoring_hand[1].seal == 'Red' and
                context.other_card ~= context.scoring_hand[1] then
                return {
                    repetitions = 1,
                    card = card
                }
            end
        end
    end,
    in_pool = function(self, args)
        local seal_count = 0
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.seal == 'Red' then
                    seal_count = seal_count + 1
                end
            end
        end
        if seal_count > 0 then
            return true
        else
            return false
        end
    end

}
return { name = { "Jokers" }, items = { rudolph } }
