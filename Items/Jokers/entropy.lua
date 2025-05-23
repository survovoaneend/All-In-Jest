local entropy = {
    object_type = "Joker",
    order = 246,
    
    key = "entropy",
    config = {
      
    },
    rarity = 2,
    pos = { x = 13, y = 9},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Tag', key = 'tag_aij_chaos'}
    end,
  
    calculate = function(self, card, context)
       if context.skip_blind then
            add_tag(Tag('tag_aij_chaos'))
            card:juice_up(0.4, 0.4)
            play_sound('tarot1')
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                  message = 'Chaos!'
            })
            return nil, true
       end
    end
  
}
return { name = {"Jokers"}, items = {entropy} }
