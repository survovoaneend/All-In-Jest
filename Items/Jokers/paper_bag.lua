local paper_bag = {
    object_type = "Joker",
    order = 44,

    key = "paper_bag",
    config = {
      extra = {
          chip_mod = 2,
          cur_chips = 0
      }
    },
    rarity = 1,
    pos = { x = 16, y = 1 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chip_mod,
                card.ability.extra.cur_chips,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.pre_discard and not context.blueprint then
            local text,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            card.ability.extra.cur_chips = card.ability.extra.cur_chips + (G.GAME.hands[text].level * card.ability.extra.chip_mod)
            return {
                message = localize('k_upgrade_ex')
            }
        end
        if context.joker_main then
            if card.ability.extra.cur_chips > 0 then
                return {
                    chips = card.ability.extra.cur_chips
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {paper_bag} }
