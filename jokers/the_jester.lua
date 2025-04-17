SMODS.Joker {
    key = "the_jester",
    config = {
      
    },
    loc_txt = {
      name = "The Jester",
      text ={
          "Selling a {C:attention}Joker{} grants a",
          "{C:tarot}The Fool{} Tarot card"
      },
  },
    rarity = 2,
    pos = { x = 17, y = 9},
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['c_fool']
    end,
  
    calculate = function(self, card, context)
      if context.selling_card then 
        if not context.selling_self then
        if context.card.ability.set == "Joker" then
          G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                play_sound('timpani')
                local _card = create_card(nil, G.consumeables, nil, nil, nil, nil, 'c_fool', nil)
                _card:add_to_deck()
                G.consumeables:emplace(_card)
                card:juice_up(0.3, 0.3)
            end
            return {
              true,
              message = 'The Fool'
            }   end }))
        delay(0.6)
        end
        
        
      end
      end
    end
  }