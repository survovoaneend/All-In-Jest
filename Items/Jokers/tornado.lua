local tornado = {
    object_type = "Joker",
    order = 418,
    key = "tornado",
    config = {
        extra = {
            x_mult_mod = 1,
            cur_x_mult = 1,
            to_play_ranks = {},
        }
    },
    rarity = 2,
    pos = { x = 9, y = 20},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local temp_list = {}
        local ranks = ''
        local ranks2 = ''
        if #card.ability.extra.to_play_ranks == 0 then
            for k, v in pairs(SMODS.Ranks) do
                temp_list[v.id] = v.card_key
            end
        else
            temp_list = card.ability.extra.to_play_ranks
        end
        local index = 0
        for k, v in pairs(temp_list) do
            index = index + 1
            if ranks == '' then
                ranks = v
            else
                if index > 5 then
                    if ranks2 == '' then
                        ranks2 = v
                    else
                        ranks2 = ranks2.. ', ' ..v
                    end
                else
                    ranks = ranks.. ', ' ..v
                end
            end
        end
        if ranks2 ~= '' then
            ranks2 = ranks2.. ')'
        else
            ranks = ranks.. ')'
        end
        return {
            vars = {
                card.ability.extra.x_mult_mod,
                card.ability.extra.cur_x_mult,
                ranks, ranks2,
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        for k, v in pairs(SMODS.Ranks) do
            card.ability.extra.to_play_ranks[v.id] = v.card_key
        end
    end,
  
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
            for k, v in pairs(SMODS.Ranks) do
                for _, i in pairs(card.ability.extra.to_play_ranks) do
                    if v.card_key == i then
                        if context.other_card:get_id() == v.id then
                            card.ability.extra.to_play_ranks[v.id] = nil
                        end 
                    end
                end
            end
            if #card.ability.extra.to_play_ranks == 0 then
                for k, v in pairs(SMODS.Ranks) do
                    card.ability.extra.to_play_ranks[v.id] = v.card_key
                end
                SMODS.scale_card(card, {
	                ref_table = card.ability.extra,
                    ref_value = "cur_x_mult",
	                scalar_value = "x_mult_mod",
                })
                return nil, true
            end
        end
        if context.joker_main then
              if card.ability.extra.cur_x_mult > 1 then
                  return {
                      xmult = card.ability.extra.cur_x_mult,
                  }
              end
        end
        return nil
    end,
}
return { name = {"Jokers"}, items = {tornado} }