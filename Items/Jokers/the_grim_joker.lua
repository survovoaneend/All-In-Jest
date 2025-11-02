local the_grim_joker = {
    object_type = "Joker",
    order = 321,
    key = "the_grim_joker",
    config = {
      extra = {
          odds = 2,
      }
    },
    rarity = 2,
    pos = { x = 17, y = 12},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    pixel_size = { w = 63, h = 95 },
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'blue_seal'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'purple_seal'}
        info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,
  
    calculate = function(self, card, context)
        
    end,
    in_pool = function(self, args)
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.seal and (card.seal == 'Purple' or card.seal == 'Blue') then
                    return true
                end
            end
        end
        return false
    end,
}
return { name = {"Jokers"}, items = {the_grim_joker} }
