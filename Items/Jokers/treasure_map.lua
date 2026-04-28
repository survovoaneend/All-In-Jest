local treasure_map = {
    object_type = "Joker",
    order = 426,
    key = "treasure_map",
    config = {
        extra = {
            min_blinds = 3,
            max_blinds = 6,
            remain_blinds = 0
        }
    },
    rarity = 2,
    pos = { x = 1, y = 21 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Tag', key = 'tag_aij_stereoscopic'}
        return {
            vars = {
                card.ability.extra.min_blinds,
                card.ability.extra.max_blinds,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            local blind_amt = pseudorandom('aij_treasure_map', card.ability.extra.min_blinds, card.ability.extra.max_blinds)
            card.ability.extra.remain_blinds = card.ability.extra.remain_blinds - 1
            if card.ability.extra.remain_blinds < 0 then card.ability.extra.remain_blinds = blind_amt - 1 end -- For inital set
            if card.ability.extra.remain_blinds == 0 then
                card.ability.extra.remain_blinds = blind_amt
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        jest_add_tag(Tag("tag_aij_stereoscopic"))
                        return true
                    end)
                }))
                card:juice_up(0.4, 0.4)
                play_sound('tarot1')
            end
        end
    end
}

return { name = { "Jokers" }, items = { treasure_map } }
