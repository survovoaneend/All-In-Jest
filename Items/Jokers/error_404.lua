local error_404 = {
    object_type = "Joker",
    order = 404,
    ignore = true,
    key = "error_404",
    config = {
      extra = {
      }
    },
    rarity = 2,
    pos = { x = 20, y = 14},
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {error_404} }