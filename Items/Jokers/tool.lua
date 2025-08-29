local tool = {
    object_type = "Joker",
    order = 359,
    key = "tool",
    config = {
    },
    rarity = 1,
    pos = { x = 6, y = 14},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        if context.change_suit then
            if context.old_suit ~= context.new_suit then
                All_in_Jest.add_patch(context.other_card, context.old_suit)
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {tool} }
