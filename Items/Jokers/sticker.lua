local sticker = {
  object_type = "Joker",
  order = 179,

  key = "sticker",
  config = {
    extra = {
        mult = 5,
        totalstickers = "0",
    }
  },
  rarity = 1,
  pos = { x = 22, y = 6},
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  pixel_size = { w = 65, h = 82 },

  loc_vars = function(self, info_queue, card)
    return {
        vars = {
            card.ability.extra.mult,
            card.ability.extra.mult * tonumber(card.ability.extra.totalstickers)
        }
    }
  end,

  in_pool = function(self, args)
    if G.GAME.stake >= 4 then
        return true
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.joker_main and (card.ability.extra.mult * tonumber(card.ability.extra.totalstickers)) > 0 then
        return {
            mult = card.ability.extra.mult * tonumber(card.ability.extra.totalstickers),
            card = context.other_card
        }
    end
  end,
  update = function(self, card, dt)
    local tempval = 0
    if G.jokers and G.jokers.cards then 
        for i = 1, #G.jokers.cards do
            for key, value in pairs(G.jokers.cards[i].ability) do
                if G.shared_stickers[key] and value == true then
                    tempval = tempval + 1
                end
            end
        end
    end
    if tonumber(card.ability.extra.totalstickers) ~= tempval then
        card.ability.extra.totalstickers = tostring(tempval)
    end
  end,
}
return { name = {"Jokers"}, items = {sticker} }
