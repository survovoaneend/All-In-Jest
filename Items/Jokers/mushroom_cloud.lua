local mushroom_cloud = {
    object_type = "Joker",
    order = 229,

    key = "mushroom_cloud",
    config = {
        extra = {
            dollars = 50
        }
    },
    rarity = 2,
    pos = { x = 18, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    all_in_jest = {
        can_use_ability = function(self, card)
            if G.jokers and #G.jokers.cards > 0 then
                return true
            end
        end,

        use_ability = function(self, card)
            ease_dollars(card.ability.extra.dollars)
            card_eval_status_text(card, 'dollars', card.ability.extra.dollars)
            local cards_to_destroy = {}
            for k, v in pairs(G.jokers.cards) do
                cards_to_destroy[#cards_to_destroy+1] = v
            end
            SMODS.destroy_cards(cards_to_destroy)
        end,
    },
  
    loc_vars = function(self, info_queue, card) 
        return {
            vars = {
                card.ability.extra.dollars,
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {mushroom_cloud} }
