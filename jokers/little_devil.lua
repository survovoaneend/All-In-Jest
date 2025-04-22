SMODS.Joker {
  key = "little_devil",
  rarity = 2,
  cost = 6,
  unlocked = true,
  discovered = true,

  
  blueprint_compat = true,
  eternal_compat = true,

 
  loc_vars = function(self, info_queue, card)
      local possible_tags = {'tag_standard', 'tag_charm', 'tag_meteor', 'tag_buffoon'}
      for _, tag_key in ipairs(possible_tags) do
          info_queue[#info_queue+1] = {set = 'Tag', key = tag_key}
      end
      return {}
  end,

  calculate = function(self, card, context)

      if context.skip_blind then

              local possible_tags = {'tag_standard', 'tag_charm', 'tag_meteor', 'tag_buffoon'}
              local chosen_tag_key = pseudorandom_element(possible_tags, pseudoseed('little_devil_tag'..G.GAME.round_resets.ante))
              local tag_name = localize{type = 'name_text', set = 'Tag', key = chosen_tag_key}
              add_tag(Tag(chosen_tag_key))
              card:juice_up(0.4, 0.4)
              play_sound('tarot1') 
              card_eval_status_text(card, 'extra', nil, nil, nil, {
                  message = '+'..tag_name, 
                  colour = G.C.FILTER 
              })
              return nil, true
          end
  end
}