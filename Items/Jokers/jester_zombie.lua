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
    blueprint_compat = false,
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
      if context.remove_playing_cards then
          G.GAME.jest_jester_zombie_trigger = true
      end
    end
  
}
local ease_roundref = ease_round
function ease_round(mod)
    if mod ~= 0 then
        G.GAME.jest_jester_zombie_trigger = false
    end
    
    local ref = ease_roundref(mod)
    return ref
end
return { name = {"Jokers"}, items = {jester_zombie} }
