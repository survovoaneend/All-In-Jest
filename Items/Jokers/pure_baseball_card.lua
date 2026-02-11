local pure_baseball_card = {
    object_type = "Joker",
    order = 364,
    key = "pure_baseball_card",
    config = {
        extra = {
            x_mult_mod = 0.1
        }
    },
    rarity = 3,
    pos = { x = 22, y = 19},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.x_mult_mod,
            } 
        }
    end,
  
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.jokers and #G.jokers.cards > 0 then
            for k, v in pairs(G.jokers.cards) do
                if v.config.center.rarity == 2 or v.config.center.rarity == 3 then
                    v.ability.perma_x_mult = v.ability.perma_x_mult or 0
                    v.ability.perma_x_mult = v.ability.perma_x_mult + card.ability.extra.x_mult_mod
                    card_eval_status_text(v, 'extra', nil, nil, nil, {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT
                    })
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {pure_baseball_card} }
