local historian = {
    object_type = "Joker",
    order = 409,
    key = "historian",
    config = {
        extra = {
            mult = 3
        }
    },
    rarity = 1,
    pos = { x = 24, y = 14},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local sell_cost = 0
        if G.GAME and G.GAME.all_in_jest and G.GAME.all_in_jest.last_sold_price then
            sell_cost = G.GAME.all_in_jest.last_sold_price
        end
        return {
            vars = {
                card.ability.extra.mult,
                sell_cost * card.ability.extra.mult
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then 
            local mult = 0
            if G.GAME and G.GAME.all_in_jest and G.GAME.all_in_jest.last_sold_price then
                mult = card.ability.extra.mult * G.GAME.all_in_jest.last_sold_price
            end
            return {
                mult = mult
            }
        end
    end
  
}

local sell_card_ref = Card.sell_card
function Card:sell_card()
    local ref = sell_card_ref(self)
    if G.jokers and self.ability.set == 'Joker' then
        G.GAME.all_in_jest.last_sold_price = self.sell_cost
    end
    return ref
end

return { name = {"Jokers"}, items = {historian} }