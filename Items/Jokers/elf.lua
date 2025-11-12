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
    blueprint_compat = true,
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
                local eval = function(cardd) return not cardd.REMOVED end
                juice_card_until(card, eval, true)
            end
            return {
                message = (card.ability.extra.current_skips < card.ability.extra.skips) and
                    (card.ability.extra.current_skips .. '/' .. card.ability.extra.skips) or
                    localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end
        if context.selling_self and (card.ability.extra.current_skips >= card.ability.extra.skips) then
            local eval = function(cardd) return false end
            juice_card_until(card, eval, true) -- Removes previous "juice until" effect

            for _ = 1, card.ability.extra.tags do
                local juiced_card = context.blueprint_card or card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        juiced_card:juice_up()
                        jest_add_tag('tag_investment')
                        return true
                    end
                }))
                delay(0.75 * 1.25)
            end
            return {
                message = localize('k_aij_merry_christmas')
            }
        end
    end

}
return { name = { "Jokers" }, items = { elf } }
