local hat_trick = {
    object_type = "Joker",
    order = 12,

    key = "hat_trick",
    config = {
      
    },
    rarity = 1,
    pos = { x = 11, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
        local multt = to_number(G.GAME.hands['Three of a Kind'].level)
        if context.other_card:get_id() == 3 then 
            return {
                mult = multt,
                card = card
            }
        end
      end
    end
  
}
return { name = {"Jokers"}, items = {hat_trick} }
