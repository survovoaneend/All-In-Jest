local no_junk_mail = {
    object_type = "Joker",
    order = 534,
    key = "no_junk_mail",
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 18, y = 25 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    pixel_size = { w = 55, h = 95 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if G.shop_booster then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = (function() 
                    local vaild_packs = {}
                    for i = 1, #G.shop_booster.cards do
                        if G.shop_booster.cards[i].config.center.kind == "Standard" and G.shop_booster.cards[i].cost ~= 0 then
                            vaild_packs[#vaild_packs+1] = G.shop_booster.cards[i]
                        end
                    end
                    if #vaild_packs > 0 then
                        card:juice_up()
                        play_sound('tarot1')
                    end
                    for k, v in pairs(vaild_packs) do
                        v.ability.couponed = true
                        v:set_cost() 
                        v:juice_up()
                    end
                    return true
                end)
            }))
        end
    end
}

return { name = { "Jokers" }, items = { no_junk_mail } }
