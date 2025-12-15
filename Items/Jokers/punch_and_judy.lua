local punch_and_judy = {
    object_type = "Joker",
    order = 70,

    key = "punch_and_judy",
    config = {
      extra = {
          count = 1,
      }
    },
    rarity = 3,
    pos = { x = 16, y = 2 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.count,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.modify_scoring_hand and (context.other_card:get_id() == 12 or context.other_card:get_id() == 13) then
            return {
                add_to_hand = true
            }
        end
        if context.repetition and context.cardarea == G.play then
            local king_count = 0
            local queen_count = 0
            for k, v in pairs(context.full_hand) do
                if v:get_id() == 12 then
                    queen_count = queen_count + 1
                end
                if v:get_id() == 13 then
                    king_count = king_count + 1
                end
            end
            if king_count == card.ability.extra.count and queen_count == card.ability.extra.count then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {punch_and_judy} }
