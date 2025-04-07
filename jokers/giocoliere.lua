SMODS.Joker {
    key = "giocoliere",
    config = {
      extra = {
        h_size = 2,
      },
    },
    loc_txt = {
      name = "Giocoliere",
      text ={
          "",
      },
  },
    rarity = 1,
    pos = { x = 16, y = 5 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.setting_blind then
        print(G.GAME.round_resets.blind)
        if context.blind and G.GAME.round_resets.blind == 'boss' then
          G.hand:change_size(card.ability.extra.h_size)
        end
      end
      if context.end_of_round and G.GAME.blind.boss then
        G.hand:change_size(-card.ability.extra.h_size)
      end
    end
  }