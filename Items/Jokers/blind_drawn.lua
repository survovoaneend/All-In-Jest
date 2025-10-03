local blind_drawn = {
    object_type = "Joker",
    order = 126,
    
    key = "blind_drawn",
    config = {
        extra = {
            Xmult = 3
        }
    },
    rarity = 2,
    pos = { x = 20, y = 4 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult}}
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult,
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {blind_drawn} }
