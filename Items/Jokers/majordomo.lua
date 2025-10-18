local majordomo = {
    object_type = "Joker",
    order = 352,
    key = "majordomo",
    config = {
      extra = {
          more_than = 5,
      }
    },
    rarity = 1,
    pos = { x = 23, y = 13},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'rental', set = 'Other', vars = {G.GAME.rental_rate or 1}}
        return {
            vars = {
                card.ability.extra.more_than,
            }
        }
    end,
  
    calculate = function(self, card, context) 
        if context.reroll_shop or context.entering_shop then
            for k, v in pairs(G.shop_jokers.cards) do
                if v.cost > card.ability.extra.more_than then
                    v:add_sticker('rental', true)
                    v:juice_up(0.3, 0.5)
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {majordomo} }
