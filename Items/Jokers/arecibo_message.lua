local arecibo_message = {
    object_type = "Joker",
    order = 199,

    key = "arecibo_message",
    config = {

    },
    rarity = 3,
    pos = { x = 13, y = 7 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)
        if G.consumeables and #G.consumeables.cards > 0 then
            for k, v in pairs(G.consumeables.cards) do
                if v.ability.set == 'Planet' and v.config.center.config.hand_type and context.scoring_name == v.config.center.config.hand_type then
                    if context.repetition and context.cardarea == G.play then
                        return {
                            repetitions = 1
                        }
                    end
                end
            end
        end
    end

}
return { name = { "Jokers" }, items = { arecibo_message } }
