local prisoners_cinema = {
    object_type = "Joker",
    order = 411,
    key = "prisoners_cinema",
    config = {
        extra = {
            boosters = 1
        }
    },
    rarity = 2,
    pos = { x = 14, y = 20 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.boosters
            }
        }
    end,

    calculate = function(self, card, context)
        if context.starting_shop and G.shop_booster then
            local juice_card = context.blueprint_card or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = (function() 
                    local vaild_packs = {}
                    for i = 1, #G.shop_booster.cards do
                        if not G.shop_booster.cards[i].ability.couponed or G.shop_booster.cards[i].cost ~= 0 then
                            vaild_packs[#vaild_packs+1] = G.shop_booster.cards[i]
                        end
                    end
                    if #vaild_packs > 0 then
                        juice_card:juice_up()
                        play_sound('tarot1')
                    end
                    for i = 1, card.ability.extra.boosters do
                        if #vaild_packs > 0 then
                            local booster = pseudorandom_element(vaild_packs, pseudoseed('prisoners_cinema'))
                            booster.ability.couponed = true
                            booster:set_cost() 
                            booster:juice_up()
                            for k, v in pairs(vaild_packs) do
                                if v == booster then
                                    v = nil
                                end
                            end
                        end
                    end
                    return true
                end)
            }))
        end
    end
}
return { name = { "Jokers" }, items = { prisoners_cinema } }
