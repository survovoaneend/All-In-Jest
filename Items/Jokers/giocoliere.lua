local giocoliere = {
    object_type = "Joker",
    order = 147,

    key = "giocoliere",
    config = {
      extra = {
      },
    },
    rarity = 1,
    pos = { x = 16, y = 5 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      card.ability.boss_bonus_active = card.ability.boss_bonus_active or false

      if context.setting_blind then
          if G.GAME.blind and G.GAME.blind.boss then
              if not card.ability.boss_bonus_active then
                  G.hand:change_size(2)     
                  card.ability.boss_bonus_active = true      
                  return nil, true 
              end

          elseif card.ability.boss_bonus_active then
              G.hand:change_size(-2)                     
              card.ability.boss_bonus_active = false      
              return nil, true
          end
      end

      if context.blind_defeated then
          if card.ability.boss_bonus_active then
              G.hand:change_size(-2)                     
              card.ability.boss_bonus_active = false   
              return nil, true
          end
      end
  end,


  add_to_deck = function(self, card, from_debuff)
      card.ability.boss_bonus_active = false 
      if G.GAME and G.GAME.blind and G.GAME.blind.boss and not card.debuff then
           G.hand:change_size(2)
           card.ability.boss_bonus_active = true
      end
  end,


  remove_from_deck = function(self, card, from_debuff)

      if card.ability.boss_bonus_active then
          G.hand:change_size(-2)
          card.ability.boss_bonus_active = false
      end
  end,
  
}
return { name = {"Jokers"}, items = {giocoliere} }
