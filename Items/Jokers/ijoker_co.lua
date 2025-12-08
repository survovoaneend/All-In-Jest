local ijoker_co = {
    object_type = "Joker",
    order = 211,

    key = "ijoker_co",
    config = {
      extra = {
          tags = 2
      }
    },
    rarity = 2,
    pos = { x = 0, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.tags,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.starting_shop then
            for i = 1, card.ability.extra.tags do
                local tag = get_next_tag_key()
                local is_gold = G.P_TAGS[tag].config.aij and G.P_TAGS[tag].config.aij.upgrade
                local price = is_gold and pseudorandom('aij_ijoker_co', 12, 16) or pseudorandom('aij_ijoker_co', 5, 10)
                All_in_Jest.add_tag_to_shop(tag, price)
            end
        end
    end
  
}

return { name = {"Jokers"}, items = {ijoker_co} }