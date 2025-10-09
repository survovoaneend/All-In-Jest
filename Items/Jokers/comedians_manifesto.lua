local comedians_manifesto = {
    object_type = "Joker",
    order = 33,

    key = "comedians_manifesto",
    config = {
      extra = {
          trigger = false
      }
    },
    rarity = 1,
    pos = { x = 6, y = 1 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.all_in_jest and context.all_in_jest.modify_booster_cards and not context.all_in_jest.before_added then
        if context.all_in_jest.card.ability.name:find('Standard') then
            for k, v in pairs(context.all_in_jest.pack_cards) do
                if v:get_id() == 12 or v:get_id() == 13 then
                    SMODS.change_base(v, nil, 'Jack', true) -- Changes rank without changing visual
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function()
                            v:flip()
                            delay(0.3)
                            play_sound('tarot1')
                            v:juice_up(0.3, 0.5)
                            card:juice_up(0.3, 0.5)
                            assert(SMODS.change_base(v, nil, 'Jack')) -- Changes rank sprite
                            v:flip()
                            return true
                        end
                    }))
                end
            end
        end
      end
    end,
}
return { name = {"Jokers"}, items = {comedians_manifesto} }