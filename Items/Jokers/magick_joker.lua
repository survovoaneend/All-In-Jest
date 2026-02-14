local magick_joker = {
  object_type = "Joker",
  order = 88,
  lite = true,
  key = "magick_joker",
  config = {
    current_suit = "Spades",
    _saved_chip_values = {}
  },
  rarity = 2,
  pos = { x = 8, y = 3 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    local suit = G.GAME.current_round.jest_magick_joker_card and G.GAME.current_round.jest_magick_joker_card.suit or "Spades"
    return {
      vars = {
        localize(suit, "suits_plural"),
        colours = { G.C.SUITS[suit] },
      }
    }
  end,

  calculate = function(self, card, context)
    -- Effect is in lovely patch on eval_card() in common_events.lua
  end

}
return { name = { "Jokers" }, items = { magick_joker } }
