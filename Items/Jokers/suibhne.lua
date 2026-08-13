local suibhne = {
    object_type = "Joker",
    order = 190,
    
    key = "suibhne",
    config = {
        extra = {
            xchips = 0,
            xchips_mod = 0.1
        }
    },
    attributes = { 'xchips', 'scaling', 'rank', 'suit', 'king', 'stars' },
    rarity = 3,
    pos = { x = 24, y = 36},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    jest_rec_paperback = true,
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips_mod,
                card.ability.extra.xchips + 1
            }
        }
    end,
    
    calculate = function(self, card, context)
        local star_kings, all_cards = 0, 0
        if context.before then
            for k, v in ipairs(context.full_hand) do
                all_cards = all_cards + 1
                if v:get_id() == 13 and v:is_suit('paperback_Stars', false, true) then
                    star_kings = star_kings + 1
                end
            end
            if star_kings == all_cards and not context.blueprint then 
                for k, v in ipairs(context.full_hand) do
                    SMODS.scale_card(card, {
	                    ref_table = card.ability.extra,
                        ref_value = "xchips",
	                    scalar_value = "xchips_mod",
                    })
                end
            end
        end
        if context.joker_main then
            return {
                xchips = (card.ability.extra.xchips+1),
            }
        end
    end,
}
return { name = {"Jokers"}, items = {suibhne} }
