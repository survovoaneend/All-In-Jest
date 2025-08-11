local imageboard = {
    object_type = "Joker",
    order = 22,

    key = "imageboard",
    config = {
      
    },
    rarity = 1,
    pos = { x = 20, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local cur_mult = 1
            local compare_id = context.other_card:get_id()
            for i = 1, #G.play.cards do
                if G.play.cards[i] == context.other_card then
                    return {
                        mult = cur_mult
                    }
                end
                if G.play.cards[i]:get_id() == compare_id then
                    cur_mult = cur_mult + 1
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {imageboard} }
