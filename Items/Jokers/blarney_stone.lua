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
  blueprint_compat = false,
  eternal_compat = false,

  loc_vars = function(self, info_queue, card)
    local num = 0
    if G.GAME.chips and tonumber(G.GAME.chips) then
        num = tonumber(G.GAME.chips)
    end
    local absNum = math.abs(num)

    local numStr = tostring(absNum)

    local firstChar = string.sub(numStr, 1, 1)

    return {
      vars = {
        tonumber(firstChar) * 2
      }
    }
  end,

  calculate = function(self, card, context)
    local num = 0
    if G.GAME.chips and tonumber(G.GAME.chips) then
        num = tonumber(G.GAME.chips)
    end
    local absNum = math.abs(num)

    local numStr = tostring(absNum)

    local firstChar = string.sub(numStr, 1, 1)
    if context.joker_main then
      return {
        mult = tonumber(firstChar) * 2
      }
    end
  end
}
return { name = { "Jokers" }, items = { blarney_stone } }
