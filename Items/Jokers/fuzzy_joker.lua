local fuzzy_joker = {
    object_type = "Joker",
    order = 259,
    key = "fuzzy_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 6, y = 10},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            if to_number(mult) <= 0 then return 1 end
            local power = math.ceil(math.log(to_number(mult), 2))
            hand_chips = to_number(hand_chips)
            Mult = 2 ^ power
            if Mult - to_number(mult) > 0 then
            return {
                mult = Mult - to_number(mult),
                remove_default_message = true,
                message = '=' .. Mult .. ' Mult',
                colour = G.C.RED,
                sound = 'multhit1'
            }
            end
        end
    end
}
return { name = {"Jokers"}, items = {fuzzy_joker} }
