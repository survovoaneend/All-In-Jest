local the_field = {
    object_type = "Blind",
    key = 'the_field',
    boss = {
        min = 1,
    },
    mult = 2,
    boss_colour = HEX("95ac6e"),
    atlas = 'blinds',
    pos = { X = 0, y = 6 },
    order = 12,
    dollars = 5,
    config = { extra = { cards = 0, defeated = false } },

    -- Allows for the number of cards to discard to "tick down"
    -- Will not update dynamically, must call blind:set_text to update
    loc_vars = function(self)
        if G.GAME.blind.ability then
            return {vars = {math.max(0, 10 - G.GAME.blind.ability.extra.cards)}}
        else
            return {vars = {10}}
        end
    end,
    collection_loc_vars = function(self, blind)
        return {vars = {10}}
    end,
    
    recalc_debuff = function(self, card, from_blind)
      if card.area ~= G.jokers then
          if G.GAME.blind and G.GAME.blind.ability and G.GAME.blind.ability.extra.cards >= 10 then
              return false
          else
              return true
          end
      else
          return false
      end
    end,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp or (not G.GAME.blind.in_blind) then
            return
        end
        if G.GAME.blind.ability and context.discard and not temp and not G.GAME.blind.ability.extra.defeated then
            G.E_MANAGER:add_event(Event {
                func = function()
                    local temp = G.GAME.blind and G.GAME.blind.disabled
                    if temp or (not G.GAME.blind.in_blind) then
                        return true
                    end
                    G.GAME.blind.ability.extra.cards = G.GAME.blind.ability.extra.cards + 1
                    if G.GAME.blind.ability.extra.cards >= 10 and not temp then
                        G.GAME.blind:disable()
                    else
                        -- Make game update description to "tick down"
                        G.GAME.blind:set_text()
                    end
                    return true
                end
            })
        end
    end,

}
return { name = { "Blinds" }, items = { the_field } }
