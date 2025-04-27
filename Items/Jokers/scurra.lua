local scurra = {
  object_type = "Joker",
  order = 175,

  key = "scurra",
  config = {
      extra = {
          retriggers = 1
      }
  },
  rarity = 2,
  pos = { x = 18, y = 6 }, 
  atlas = 'joker_atlas',   
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true, 

  loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = {set = 'Other', key = 'red_seal'}
      return { vars = { card.ability.extra.retriggers } }
  end,

  calculate = function(self, card, context)
      if context.repetition and context.cardarea == G.play then
          if context.other_card and context.other_card:get_seal() == 'Red' and not context.other_card.debuff then
              return {
                  message = localize('k_again_ex'), 
                  repetitions = card.ability.extra.retriggers, 
                  card = card 
              }
          end
      end
  end,
  in_pool = function(self, args)
    local seal_count = 0
    if G.GAME and G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            if card.seal == 'Red' then
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
}
return { name = {"Jokers"}, items = {scurra} }
