local death_of_a_salesman = {
    object_type = "Joker",
    order = 393,

    key = "death_of_a_salesman",
    config = {
      extra = {
          tags = 1
      }
    },
    rarity = 2,
    pos = { x = 4, y = 16 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Tag', key = 'tag_aij_chaos'}
        info_queue[#info_queue+1] = {set = 'Tag', key = 'tag_aij_anarchy'}
        return {
            vars = {
                card.ability.extra.tags,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.entering_shop then
            for i = 1, card.ability.extra.tags do
                local price = math.random(3, 7)
                local tag_chance = math.random(1,4)
                local tag
                if tag_chance == 4 then
                    tag = 'tag_aij_anarchy'
                    price = price * 2
                else
                    tag = 'tag_aij_chaos'
                end
                All_in_Jest.add_tag_to_shop(tag, price)
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {death_of_a_salesman} }