local pinhead = {
    object_type = "Joker",
    order = 107,

    key = "pinhead",
    config = {
      extra = {
        money = 8
      }
    },
    rarity = 2,
    pos = { x = 2, y = 4 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = { card.ability.extra.money }
      }
    end,

    calc_dollar_bonus = function(self, card)
      if G.GAME.current_round.hands_played == 1 then
        local dollar_bonus = card.ability.extra.money
        return dollar_bonus
      end
    end
}
return { name = {"Jokers"}, items = {pinhead} }
