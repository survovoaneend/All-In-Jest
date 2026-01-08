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

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true
        end }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true
        end }))
    end,

    calculate = function(self, card, context)
      
    end
}

local aij_card_set_cost_ref = Card.set_cost
function Card:set_cost()
    local ret = aij_card_set_cost_ref(self)
    if self.ability.set == 'Booster' and self.config.center.kind == "Standard" and next(SMODS.find_card("j_aij_no_junk_mail")) then 
        self.cost = 0
    end
    return ret
end

return { name = { "Jokers" }, items = { no_junk_mail } }
