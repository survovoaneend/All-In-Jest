local get_first_digit = function()
  local firstChar
  if G.GAME.chips_text and tonumber(string.sub(G.GAME.chips_text, 1, 1)) then
    firstChar = string.sub(G.GAME.chips_text, 1, 1)
  elseif G.GAME.chips_text and tonumber(string.sub(G.GAME.chips_text, 2, 2)) then   -- Check for negative scores
    firstChar = string.sub(G.GAME.chips_text, 2, 2)
  end

  return firstChar
end

local blarney_stone = {
  object_type = "Joker",
  order = 178,

  key = "blarney_stone",
  config = {

  },
  rarity = 1,
  pos = { x = 21, y = 6 },
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,

  loc_vars = function(self, info_queue, card)
    firstChar = get_first_digit()
    local num = math.abs(tonumber(firstChar) or 0)
    return {
      vars = { num * 3 }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      firstChar = get_first_digit()
      local num = math.abs(tonumber(firstChar) or 0)
      return {
        mult = num * 3
      }
    end
  end
}
return { name = { "Jokers" }, items = { blarney_stone } }
