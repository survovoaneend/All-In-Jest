local pierrette = {
    object_type = "Joker",
    order = 100,

    key = "pierrette",
    config = {
      
    },
    rarity = 1,
    pos = { x = 20, y = 3 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.discard then 
            if not context.all_in_jest or (context.all_in_jest and not context.all_in_jest.re_discard) then
                SMODS.calculate_context({discard = context.discard, other_card = context.other_card, full_hand = context.full_hand, ignore_other_debuff = context.ignore_other_debuff, all_in_jest = {re_discard = true}})
            end
        end
        if context.pre_discard then 
            if not context.all_in_jest or (context.all_in_jest and not context.all_in_jest.re_pre_discard) then
                SMODS.calculate_context({pre_discard = context.pre_discard, full_hand = context.full_hand, hook = context.hook, all_in_jest = {re_pre_discard = true}})
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_again_ex'),colour = G.C.FILTER})
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {pierrette} }
