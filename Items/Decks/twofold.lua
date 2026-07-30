local twofold = {
    object_type = "Back",
    key = 'twofold',
    atlas = 'deck_atlas',
    order = 2,
    pos = { x = 2, y = 0 },
    unlocked = false,
	unlock_condition = {hidden = true},
    config = {
        extra = {
            
        }
    },
    loc_vars = function(self, info_queue)
        return {vars = {}}
	end,
    locked_loc_vars = function(self, info_queue, card)
        if not self.unlocked then
            return {key = "b_aij_twofold_hidden"}
        end
	end,
    check_for_unlock = function(self, args)
        return true
    end,
    calculate = function(self, card, context)
        if context.modify_final_cashout then
            return {
                modify = context.amount,
                cashout_row = {name='custom', text = "X2", text_colour = G.C.FILTER}
            }
        end
    end,
    apply = function(self, back)
        G.GAME.starting_params.vouchers_in_shop = G.GAME.starting_params.vouchers_in_shop * 2
        G.GAME.starting_params.boosters_in_shop = G.GAME.starting_params.boosters_in_shop * 2
        change_shop_size(2)
        G.GAME.starting_params.aij_base_joker_effects = G.GAME.starting_params.aij_base_joker_effects or 1
        G.GAME.starting_params.aij_base_joker_effects = G.GAME.starting_params.aij_base_joker_effects * 2
        G.GAME.starting_params.aij_blind_size = G.GAME.starting_params.aij_blind_size or 1
        G.GAME.starting_params.aij_blind_size = G.GAME.starting_params.aij_blind_size * 2
        --G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 2 -- In case we want this later
        G.GAME.starting_params.extra_cards = {}
        for k, v in pairs(G.P_CARDS) do
            if not SMODS.add_to_pool(SMODS.Ranks[v.value], {initial_deck = true, suit = v.suit})
            or not SMODS.add_to_pool(SMODS.Suits[v.suit], {initial_deck = true, rank = v.value}) then
                goto continue
            end
            local _ = nil
            local _r, _s = SMODS.Ranks[v.value].card_key, SMODS.Suits[v.suit].card_key
            local keep, _e, _d, _g = true, nil, nil, nil
            if _de then
                if _de.yes_ranks and not _de.yes_ranks[_r] then keep = false end
                if _de.no_ranks and _de.no_ranks[_r] then keep = false end
                if _de.yes_suits and not _de.yes_suits[_s] then keep = false end
                if _de.no_suits and _de.no_suits[_s] then keep = false end
                if _de.enhancement then _e = _de.enhancement end
                if _de.edition then _d = _de.edition end
                if _de.gold_seal then _g = _de.gold_seal end
                if _de.seal then _g = _de.seal end
            end
                
            if keep then G.GAME.starting_params.extra_cards[#G.GAME.starting_params.extra_cards+1] = {s=_s,r=_r,e=_e,d=_d,g=_g} end
            ::continue::
        end 
    end
}
return {name = {"Decks"}, items = {twofold}}