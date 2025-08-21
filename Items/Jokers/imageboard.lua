local imageboard = {
    object_type = "Joker",
    order = 22,

    key = "imageboard",
    config = {
      extra = {
          has_been_played = nil
      }
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
            card.ability.extra.has_been_played = card.ability.extra.has_been_played or {}
            local compare_id = context.other_card:get_id()
            card.ability.extra.has_been_played[compare_id] = card.ability.extra.has_been_played[compare_id] or 0
            card.ability.extra.has_been_played[compare_id] = card.ability.extra.has_been_played[compare_id] + 1
            return {
                mult = card.ability.extra.has_been_played[compare_id]
            }
        end
        if context.after then
            card.ability.extra.has_been_played = nil
        end
    end
  
}
return { name = {"Jokers"}, items = {imageboard} }
