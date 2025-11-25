local astrologer = {
    object_type = "Joker",
    order = 313,
    ignore = not All_in_Jest.config.moons_enabled,
    key = "astrologer",
    config = {
        extra = {
            picks = 1
        }
    },
    rarity = 2,
    pos = { x = 10, y = 12},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.picks
            } 
        }
    end,
  
    calculate = function(self, card, context)
        if context.open_booster then
          if context.card.config.center.kind == "Celestial" and G.GAME.jest_change_booster_options.pack_choices ~= "unlimited" then
              G.GAME.pack_choices = G.GAME.pack_choices + card.ability.extra.picks
          end
      end
    end
  
}
return { name = {"Jokers"}, items = {astrologer} }
