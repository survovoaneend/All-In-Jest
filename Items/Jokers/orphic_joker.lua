local orphic_joker = {
    object_type = "Joker",
    order = 215,

    key = "orphic_joker",
    config = {
      
    },
    rarity = 3,
    pos = { x = 4, y = 8},
    atlas = 'joker_atlas',
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.skip_blind and not card.debuff then

          if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
              local new_joker = create_card('Joker', G.jokers, nil, 0.8, nil, nil, nil, 'skip_reward')
              new_joker:add_to_deck()       
              G.jokers:emplace(new_joker) 
              new_joker:start_materialize() 
              card:juice_up(0.4, 0.2)
              play_sound('card1', 1.3, 0.7) 
              return nil, true
          else
               return nil, true
          end
      end
  end,

  
}
return { name = {"Jokers"}, items = {orphic_joker} }
