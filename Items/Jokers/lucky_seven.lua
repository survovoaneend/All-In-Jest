local lucky_seven = {
    object_type = "Joker",
    order = 1,

    key = "lucky_seven",
    config = {
      
    },
    rarity = 2,
    pos = { x = 1, y = 0 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
    end,

    calculate = function(self, card, context)
      if context.before and not context.blueprint then
        local enhanced_a_card = false
        if context.scoring_hand and #context.scoring_hand > 0 then
            for k, v in ipairs(context.scoring_hand) do
                if v:get_id() == 7 and v.config.center == G.P_CENTERS.c_base and not v.debuff then
                    v:set_ability(G.P_CENTERS.m_lucky, nil, true) 
                    enhanced_a_card = true 
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if v and not v.removed then
                                v:juice_up()
                            end
                            return true
                        end
                    }))
                end
            end
        end


        if enhanced_a_card then
          return {
              message = 'Lucky!',
              card = card 
          }
        end
    end
    return nil
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "rank", colour = G.C.FILTER },
                { text = " > " },
                { ref_table = "card.joker_display_values", ref_value = "enhancement", colour = G.C.FILTER },
                { text = ")" },
            },
            calc_function = function(card)
                card.joker_display_values.rank = localize('7', 'ranks')
                card.joker_display_values.enhancement = localize { type = 'name_text', set = 'Enhanced', key = 'm_lucky' }
            end,
        }
    end
  
}
return { name = {"Jokers"}, items = {lucky_seven} }
