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
      if context.open_booster then
        if context.card.ability.name:find('Standard') then
            card.ability.extra.trigger = true
        else
            card.ability.extra.trigger = false
        end
      end
    end,
    update = function(self, card, dt)
        if G.pack_cards and card.ability.extra.trigger then
            if G.pack_cards.cards then
                for i = 1, #G.pack_cards.cards do
                    local v = G.pack_cards.cards[i]
                    if v:get_id() == 12 or v:get_id() == 13 then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.1,
                            func = function()
                            assert(SMODS.change_base(v, nil, 'Jack'))
                            return true
                            end
                        }))
                    end
                end
            end
        end
    end
}
return { name = {"Jokers"}, items = {comedians_manifesto} }