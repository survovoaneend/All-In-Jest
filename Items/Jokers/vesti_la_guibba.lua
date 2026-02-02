local vesti_la_guibba = {
    object_type = "Joker",
    order = 119,

    key = "vesti_la_guibba",
    config = {
      
    },
    rarity = 2,
    pos = { x = 14, y = 4 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.before and next(context.poker_hands['Straight']) then
        if G.jokers and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            if pseudorandom('vesti_la_guibba') > 0.5 then
                SMODS.add_card {
                    set = 'Joker',
                    rarity = 'Common',
                    key_append = 'vesti_la_guibba' 
                }
                G.GAME.joker_buffer = 0
            else
                SMODS.add_card {
                    set = 'Joker',
                    rarity = 'Uncommon',
                    key_append = 'vesti_la_guibba'
                }
                G.GAME.joker_buffer = 0
            end
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
            }
        end
      end
    end
  
}
return { name = {"Jokers"}, items = {vesti_la_guibba} }
