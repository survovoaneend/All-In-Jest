local design_document = {
    object_type = "Joker",
    order = 197,
    ignore = true,
    key = "design_document",
    config = {
        extra = {
            money = 2
        }
    },
    rarity = 2,
    pos = { x = 11, y = 7},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.money}}
    end,
  
    calculate = function(self, card, context)
      if context.probability_trigger then  
        if not context.probability_trigger.result then
            return {
                dollars = card.ability.extra.money,
            }
        end
      end
    end
  
}
return { name = {"Jokers"}, items = {design_document} }
