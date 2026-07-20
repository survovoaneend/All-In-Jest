local dark_magician = {
    object_type = "Joker",
    order = 515,

    key = "dark_magician",
    config = {
        extra = {

        }
    },
    rarity = 3,
    pos = { x = 5, y = 21 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,

    calculate = function(self, card, context)
        if context.create_booster_card then
            if not context.booster.config.center.draw_hand then
                context.booster.config.center.aij_fake_draw_hand = true
            end
            context.booster.config.center.draw_hand = true
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for k, v in ipairs(G.P_CENTER_POOLS.Booster) do
            if v.aij_fake_draw_hand and v.draw_hand then
                v.aij_fake_draw_hand = nil
                v.draw_hand = nil
            end
        end
    end,  
}
return { name = { "Jokers" }, items = { dark_magician } }
