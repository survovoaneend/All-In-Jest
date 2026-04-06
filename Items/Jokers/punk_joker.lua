local punk_joker = {
    object_type = "Joker",
    order = 50,

    key = "punk_joker",
    config = {
      
    },
    rarity = 2,
    pos = { x = 21, y = 1 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
    end,
  
    calculate = function(self, card, context)
      if context.before and context.scoring_hand then
          local has_wild = false
          for _, scoring_card in ipairs(context.scoring_hand) do
              if scoring_card.config.center.key == 'm_wild' then
                  has_wild = true
                  break
              end
          end
          if has_wild then
            local eligible_targets = {}
            for _, card_in_hand in ipairs(context.scoring_hand) do
                if card_in_hand.config.center == G.P_CENTERS.c_base then
                    table.insert(eligible_targets, card_in_hand)
                end
            end

            if #eligible_targets > 0 then
                -- Have to do this mess of code to make banana man say "Again!" at the correct time
                return {
                    extra = {message = localize{type = 'name_text', set = 'Enhanced', key = 'm_wild'} .. "!"}, 
                    func = function()
                        G.E_MANAGER:add_event(Event({
                          func = function()
                              local target_card = pseudorandom_element(eligible_targets, pseudoseed('punk'), {in_pool = function (v, args)
                                  return v.config.center == G.P_CENTERS.c_base
                              end})
                              if target_card then
                                  target_card:set_ability(G.P_CENTERS.m_wild)
                                  target_card:juice_up()
                              end
                              return true
                          end
                        }))
                    end
                }
            end
          end
      end
    end,
    in_pool = function(self, args)
        local wild = 0
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.config.center.key == 'm_wild' then
                    wild = wild + 1
                end
            end
        end
        if wild > 0 then
            return true
        else
            return false
        end
      end,
  
}
return { name = {"Jokers"}, items = {punk_joker} }
