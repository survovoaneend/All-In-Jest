local magic_mirror = {
    object_type = "Joker",
    order = 202,

    key = "magic_mirror",
    config = {
      
    },
    rarity = 3,
    pos = { x = 15, y = 7},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
        if G.GAME.jest_magic_mirror_trigger then
            if context.other_card:is_face() then
                context.other_card:set_edition({negative = true})
                G.GAME.jest_magic_mirror_trigger = false
            end
        end
      end
    end
  
}
local ease_anteref = ease_ante
function ease_ante(mod)
    if mod ~= 0 then
        G.GAME.jest_magic_mirror_trigger = true
    end
    
    local ref = ease_anteref(mod)
    return ref
end
return { name = {"Jokers"}, items = {magic_mirror} }
