local cloudwatching = {
    object_type = "Joker",
    order = 80,

    key = "cloudwatching",
    config = {
      extra = {
          tags = "1"
      }
    },
    rarity = 1,
    pos = { x = 0, y = 3 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
         return {
            vars = {
                tonumber(card.ability.extra.tags),
            }
         }
    end,
  
    add_to_deck = function(self, card, from_debuff)
        G.GAME.all_in_jest.blind_tags.has_multiple = true
        G.GAME.all_in_jest.blind_tags.amt = G.GAME.all_in_jest.blind_tags.amt + tonumber(card.ability.extra.tags)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.all_in_jest.blind_tags.amt = G.GAME.all_in_jest.blind_tags.amt - tonumber(card.ability.extra.tags)
        if G.GAME.all_in_jest.blind_tags.amt <= 1 then
            G.GAME.all_in_jest.blind_tags.has_multiple = false
        end
    end
}
return { name = {"Jokers"}, items = {cloudwatching} }