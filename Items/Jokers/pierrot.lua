local pierrot = {
    object_type = "Joker",
    order = 14,

    key = "pierrot",
    config = {
      
    },
    attributes = { 'chips', 'rank', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' },
    rarity = 1,
    pos = { x = 10, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            local val = context.other_card:get_chip_bonus()
            local id = context.other_card:get_id()
            local rank = SMODS.Ranks[context.other_card.base.value]
            local is_numbered_card = rank and string.find(rank.key, "%d*%d?%d+") ~= nil
            if context.other_card and is_numbered_card and val > 0 and (id > 0) then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                    }
                else
                    return {
                        h_chips = val
                    }
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {pierrot} }
