local elf = {
    object_type = "Joker",
    order = 341,

    key = "elf",
    config = {
        extra = {
            current_skips = 0,
            skips = 2,
            tags = 2
        }
    },
    rarity = 2,
    pos = { x = 12, y = 13 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.current_skips,
                card.ability.extra.skips,
                card.ability.extra.tags
            }
        }
    end,

    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            card.ability.extra.current_skips = card.ability.extra.current_skips + 1
            if card.ability.extra.current_skips == card.ability.extra.skips then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end
            return {
                message = (card.ability.extra.current_skips < card.ability.extra.skips) and
                    (card.ability.extra.current_skips .. '/' .. card.ability.extra.skips) or
                    localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end
        if context.selling_self and (card.ability.extra.current_skips >= card.ability.extra.skips) and not context.blueprint then
            for i = 1, card.ability.extra.tags do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.9,
                        func = function()
                            local temptag = Tag('tag_investment')
                            add_tag(temptag)
                            return true
                        end
                    }))
                end
            return {
                message = localize('k_aij_merry_christmas')
            }
        end
    end

}
return { name = { "Jokers" }, items = { elf } }
