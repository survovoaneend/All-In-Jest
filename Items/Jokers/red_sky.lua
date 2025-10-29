local red_sky = {
  object_type = "Joker",
  order = 125,
  key = "red_sky",
  config = {

  },
  rarity = 2,
  pos = { x = 19, y = 4 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)

  end,

  calculate = function(self, card, context)
    -- Effect is in lovely patch on eval_card() in common_events.lua
  end

}
return { name = { "Jokers" }, items = { red_sky } }
