local sneaky_pete = {
    object_type = "Joker",
    order = 153,

    key = "sneaky_pete",
    config = {
      extra = {
        money_per_seal = 2
      }
    },
    rarity = 2,
    pos = { x = 22, y = 5 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = {set = 'Other', key = 'gold_seal'}
      local seal_count = 0
      if G.GAME and G.playing_cards then
          for _, card in ipairs(G.playing_cards) do
              if card.seal == 'Gold' then
                  seal_count = seal_count + 1
              end
          end
      end
      return {
        vars = {
          seal_count * card.ability.extra.money_per_seal,
          card.ability.extra.money_per_seal,
        }
      }
    end,
  
    calculate = function(self, card, context)
      
    end,
    calc_dollar_bonus = function(self, card)
      local seal_count = 0
      if G.GAME and G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            if card.seal == 'Gold' then
                seal_count = seal_count + 1
            end
        end
    end
      if seal_count > 0 then
          local dollar_bonus = (seal_count * card.ability.extra.money_per_seal) or 0
          return dollar_bonus
      end
  end,
  in_pool = function(self, args)
    local seal_count = 0
    if G.GAME and G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            if card.seal == 'Gold' then
                seal_count = seal_count + 1
            end
        end
    end
    if seal_count > 0 then
        return true
    else
        return false
    end
  end,

  joker_display_def = function(JokerDisplay)
    ---@type JDJokerDefinition
    return {
    text = {
        { text = "+" },
        { text = "$" },
        { ref_table = "card.joker_display_values", ref_value = "dollar_bonus", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.GOLD },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
    },
                
    calc_function = function(card)
        local seal_count = 0
        card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.seal == 'Gold' then
                    seal_count = seal_count + 1
                end
            end
        end
        card.joker_display_values.dollar_bonus = 0
        if seal_count > 0 then
            card.joker_display_values.dollar_bonus = (seal_count * card.ability.extra.money_per_seal) or 0
        end
    end
    }
  end,
  
}
return { name = {"Jokers"}, items = {sneaky_pete} }
