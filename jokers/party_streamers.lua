SMODS.Joker {
    key = "party_streamers",
    config = {
      
    },
    loc_txt = {
      name = "Party Streamers",
      text ={
          "If {C:attention}first hand{} of round",
          "has only {C:attention}1{} card with no",
          "{C:attention}Seal{}, it gains a {C:red}Red{}, {C:blue}Blue{},",
          "or {C:money}Gold{} {C:attention}Seal{}"
      },
  },
    rarity = 3,
    pos = { x = 0, y = 5 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
  calculate = function(self, card, context)
    if context.after and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
      for k, v in ipairs(context.scoring_hand) do
        if not v.seal then
          G.E_MANAGER:add_event(Event ( {
            trigger = 'before',
            delay = 1,
            func = function()
              local seal_type = pseudorandom(pseudoseed('party'))
              if seal_type > 0.66 then
                v:set_seal('Blue', true)
              elseif seal_type > 0.33 then
                v:set_seal('Gold', true)
              else
                v:set_seal('Red', true)
              end
              v:juice_up(0.3,0.3)
              play_sound('gold_seal', 1.2, 0.4)
              return true
            end } ))
        end
      end
    end
  end
  }