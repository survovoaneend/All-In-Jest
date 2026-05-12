local the_man = {
    object_type = "Blind",
    key = 'the_man',
    
    boss = {
        min = 4,
    },
    mult = 2,
    boss_colour = HEX("95a0a9"),
    atlas = 'blinds',
    pos = { X = 0, y = 64},
    order = 65,
    dollars = 5,


    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
          return
        end
        if context.after and context.full_hand and not temp then
          G.E_MANAGER:add_event(Event({
            func = function()
              blind:wiggle()
              return true
            end
          }))
          for i = 1, #context.full_hand do
            G.E_MANAGER:add_event(Event({
              trigger = 'after',
              delay = 0.15,
              func = function()
                  context.full_hand[i].ability.aij_perma_flipped = true
                  context.full_hand[i]:flip()
                  return true
              end
            }))
          end
        end
    end
}
return { name = {"Blinds"}, items = {the_man} }