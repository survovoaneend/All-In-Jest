local cosmological_constant = {
    object_type = "Joker",
    order = 143,

    key = "cosmological_constant",
    config = {
      
    },
    rarity = 3,
    pos = { x = 12, y = 5 },
    atlas = 'joker_atlas',
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.modify_hand then
            return {balance = true}
        end
    end,
    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.selected_back.effect.center.key ~= 'b_plasma' then
                return true
            end
        end
        return false
    end,
}
return { name = {"Jokers"}, items = {cosmological_constant} }

