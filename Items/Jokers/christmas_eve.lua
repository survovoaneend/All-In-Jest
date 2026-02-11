local christmas_eve = {
    object_type = "Joker",
    order = 570,
    key = "christmas_eve",
  
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 8, y = 27 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Tag', key = 'tag_coupon'}
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        local eff_card = context.blueprint_card or card
        local tag_name = localize{type = 'name_text', set = 'Tag', key = 'tag_coupon'}
        if context.end_of_round and context.game_over == false and not context.blueprint then
            if G.GAME.blind:get_type() == 'Big' then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag('tag_coupon'))
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end)
                }))
                card_eval_status_text(eff_card, 'extra', nil, nil, nil, {
                  message = '+'..tag_name, 
              })
                return nil,true
            end
        end
    end
}


return { name = { "Jokers" }, items = { christmas_eve } }