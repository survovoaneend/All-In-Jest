local jester_zombie = {
    object_type = "Joker",
    order = 236,
    key = "jester_zombie",
    config = {
      
    },
    rarity = 2,
    pos = { x = 4, y = 9},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local active_text = "("..localize('k_inactive')..")"
        if G.GAME.jest_jester_zombie_trigger then 
            active_text = "("..localize('k_active')..")"
        else
            active_text = "("..localize('k_inactive')..")"
        end
        return { vars = {
            active_text
        }}
    end,
  
    calculate = function(self, card, context)
      if context.repetition and context.cardarea == G.play then
          for i = 1, #context.scoring_hand do
              if G.GAME.jest_jester_zombie_trigger then
                  return {
                      repetitions = 1,
                      card = card,
                      message = localize('k_again_ex')
                  }  
              end
          end
      end
      -- Currently does not trigger if card is destroyed during shop
      -- Controlled by (G.GAME.blind and G.GAME.blind.in_blind), can be removed easily
      if context.remove_playing_cards and not context.blueprint and not G.GAME.jest_jester_zombie_trigger and (G.GAME.blind and G.GAME.blind.in_blind) then
          G.GAME.jest_jester_zombie_trigger = true
          local eval = function(card) return G.GAME.jest_jester_zombie_trigger end
          G.E_MANAGER:add_event(Event({func = (function()
              juice_card_until(card, eval, true)
              return true
          end)}))
          return {
              message = localize('k_active_ex')
          }
      end
      if ((context.end_of_round and not context.individual) or context.setting_blind) and not context.blueprint then
          G.GAME.jest_jester_zombie_trigger = false
      end
    end
  
}

return { name = {"Jokers"}, items = {jester_zombie} }
