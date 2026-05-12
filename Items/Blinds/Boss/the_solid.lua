local the_solid = {
    object_type = "Blind",
    key = 'the_solid',
    
    boss = {
        min = 1,
    },
    mult = 2,
    boss_colour = HEX("6f7070"),
    atlas = 'blinds',
    pos = { X = 0, y = 68},
    order = 69,
    dollars = 5,


    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
          return
        end
        if context.after and context.scoring_hand and not temp then
          G.E_MANAGER:add_event(Event({
            func = function()
              blind:wiggle()
              return true
            end
          }))
          for i = 1, #context.scoring_hand do
            G.E_MANAGER:add_event(Event({
              trigger = 'after',
              delay = 0.15,
              func = function()
                  context.scoring_hand[i]:set_eternal(true)
                  context.scoring_hand[i]:juice_up(0.3, 0.3)
                return true
              end
            }))
          end
        end
    end
}
return { name = {"Blinds"}, items = {the_solid} }