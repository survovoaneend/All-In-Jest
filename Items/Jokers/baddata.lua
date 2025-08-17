local baddata = {
    object_type = "Joker",
    order = 373,
    key = "baddata",
    config = {
    },
    rarity = 1,
    pos = {x = 15, y = 17},
    soul_pos = {x = 6, y = 18},
    all_in_jest = {
        soul_layers = {
            aij_floating_sprite_1 = { pos = {x = 15, y = 19}, moving = false}
        }
    },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        
    end,

    update = function(self, card, dt)
        if card and card.config then
            card:set_sprites(card.config.center)
        end
    end,
  
}
return { name = {"Jokers"}, items = {baddata} }