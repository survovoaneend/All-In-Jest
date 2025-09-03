local smiley = {
    object_type = "Seal",
    key = 'smiley',
    config = {
        extra = {
            joker_amt = 1
        },
    },
    atlas = 'enhancements_atlas',
    pos = { x = 7, y = 2 },
    badge_colour = HEX("83b8c0"),
    order = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.seal.extra.joker_amt } }
    end,
    calculate = function(self, card, context)
        
    end
}
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
  if G.jokers then
    if self.seal and self.seal == 'aij_smiley' then
      for i = 1, self.ability.seal.extra.joker_amt do
          local jokers = {}
          for i = 1, #G.jokers.cards do
              if G.jokers.cards[i].edition == nil then
                  table.insert(jokers, G.jokers.cards[i])
              end
          end
          local joker = pseudorandom_element(jokers, pseudoseed('jest_anarchy_tag'))
          if joker and #jokers > 0 then
              local edition = poll_edition('smiley'..G.GAME.round_resets.ante, 2, false, true)
              joker:set_edition(edition)
          end
      end
    end
  end
  return ref
end
return {name = {"Seals"}, items = {smiley}}