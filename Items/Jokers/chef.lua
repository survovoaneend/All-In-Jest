local chef = {
    object_type = "Joker",
    order = 338,
    key = "chef",
    config = {
        extra = {
            trigger = false
        }
    },
    attributes = { 'editions', 'stickers', 'rarity', 'negative', 'shop' },
    rarity = 2,
    pos = { x = 2, y = 13},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
    end,

    in_pool = function(self, args)
        return G.GAME.modifiers.enable_perishables_in_shop or false
    end,
    calculate = function(self, card, context)
        if context.open_booster and not context.blueprint then
            card.ability.extra.trigger = true
        end
    end,
    update = function(self, card, dt)
        if G.jokers and next(SMODS.find_card("j_aij_chef")) then
            if G.shop_jokers and G.shop_jokers.cards then 
                for _, v in ipairs(G.shop_jokers.cards) do
                    if v.ability.set == "Joker" then
                        if v.ability.perishable and v:is_rarity("Common") and (not v.edition or not v.edition.negative) then
                            v:set_edition({negative = true})
                            v:set_cost()
                        end
                    end
                end
            end
            if G.pack_cards and G.pack_cards.cards and card.ability.extra.trigger then
                for _, v in ipairs(G.pack_cards.cards) do
                    if v.ability.set == "Joker" then
                        if v.ability.perishable and v:is_rarity("Common") and (not v.edition or not v.edition.negative) then
                            v:set_edition({negative = true})
                            v:set_cost()
                            card.ability.extra.trigger = false
                        end
                    end
                end
            end
        end
    end,
}

local aij_card_set_cost_ref = Card.set_cost_value
function Card:set_cost_value()
    aij_card_set_cost_ref(self)
    if self.ability.perishable and self:is_rarity("Common") and next(SMODS.find_card("j_aij_chef")) then
        self.cost = 0
    end
end

return { name = {"Jokers"}, items = {chef} }
