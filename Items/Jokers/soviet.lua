local soviet = {
    object_type = "Joker",
    order = 53,
     ignore = true,
    key = "soviet",
    config = {
      extra = {
        mult = 20
      }
    },
    rarity = 2,
    pos = { x = 24, y = 1 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
            local contains_king_or_queen = false
            if context.full_hand and #context.full_hand > 0 then
                for _, p_card in ipairs(context.full_hand) do
                    if p_card:get_id() == 13 or p_card:get_id() == 12 
                    then
                        contains_king_or_queen = true
                        break 
                    end
                end
            else
            end

            if not contains_king_or_queen then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
        return nil
    end
  
}
return { name = {"Jokers"}, items = {soviet} }
