local chef = {
    object_type = "Joker",
    order = 331,
    key = "chef",
    config = {
        extra = {
            trigger = false
        }
    },
    rarity = 2,
    pos = { x = 2, y = 13},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,

    in_pool = function(self, args)
        if G.GAME.stake >= 7 then
            return true
        end
        return false
    end,
     calculate = function(self, card, context)
      if context.open_booster then
        card.ability.extra.trigger = true
      end
    end,
    update = function(self, card, dt)
        if G.jokers then
            local has_chef = next(SMODS.find_card("j_aij_chef"))
            if has_chef then
                if G.shop_jokers and G.shop_jokers.cards then 
                    for i = 1, #G.shop_jokers.cards do
                        if G.shop_jokers.cards[i].ability.set == "Joker" then
                            if G.shop_jokers.cards[i].ability.perishable and G.shop_jokers.cards[i].edition == nil then
                                G.shop_jokers.cards[i]:set_edition({negative = true})
                                G.shop_jokers.cards[i]:set_cost()
                            end 
                        end
                    end
                end
                if G.pack_cards and card.ability.extra.trigger then
                    if G.pack_cards.cards then
                        for i = 1, #G.pack_cards.cards do
                            if G.pack_cards.cards[i].ability.set == "Joker" then
                                if G.pack_cards.cards[i].ability.perishable and G.pack_cards.cards[i].edition == nil then
                                    G.pack_cards.cards[i]:set_edition({negative = true})
                                    G.pack_cards.cards[i]:set_cost()
                                    card.ability.extra.trigger = false
                                end 
                            end
                        end
                    end
                end
            end
        end
    end,
}
return { name = {"Jokers"}, items = {chef} }
