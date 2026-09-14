local function reset_jest_magick_joker_card()
	G.GAME.current_round.jest_magick_joker_card.suit = "Spades"
	local valid_jest_magick_joker_cards = {}
	for k, v in ipairs(G.playing_cards) do
		if v.ability.effect ~= "Stone Card" then
			valid_jest_magick_joker_cards[#valid_jest_magick_joker_cards + 1] = v
		end
	end
	if valid_jest_magick_joker_cards[1] then
		local jest_magick_joker_card =
			pseudorandom_element(valid_jest_magick_joker_cards, pseudoseed("mag" .. G.GAME.round_resets.ante))
		G.GAME.current_round.jest_magick_joker_card.suit = jest_magick_joker_card.base.suit
	end
end
local function reset_jest_you_broke_it_card()
	G.GAME.current_round.jest_you_broke_it_card.rank = "Ace"
	G.GAME.current_round.jest_you_broke_it_card.enhancement = "m_bonus"
	local valid_jest_ybi_cards = {}
	for k, v in ipairs(G.playing_cards) do
		if not SMODS.has_no_rank(v) then
			valid_jest_ybi_cards[#valid_jest_ybi_cards + 1] = v
		end
	end
	if valid_jest_ybi_cards[1] then
		local jest_ybi_card = pseudorandom_element(valid_jest_ybi_cards, pseudoseed("ybi" .. G.GAME.round_resets.ante))
		G.GAME.current_round.jest_you_broke_it_card.rank = jest_ybi_card.base.value
		G.GAME.current_round.jest_you_broke_it_card.id = jest_ybi_card.base.id
	end
	G.GAME.current_round.jest_you_broke_it_card.enhancement =
		SMODS.poll_enhancement({ guaranteed = true, key = "ybi" .. G.GAME.round_resets.ante })
end
local function reset_handsome_joker_card()
	G.GAME.current_round.jest_handsome_joker_card.rank = "Ace"
	G.GAME.current_round.jest_handsome_joker_card.suit = "Spades"
	G.GAME.current_round.jest_handsome_joker_card.enhancement = "m_bonus"
	local valid_jest_handsome_cards = {}
	for k, v in ipairs(G.playing_cards) do
		local enhancement = v.ability.effect
		if not (SMODS.has_no_rank(v) or SMODS.has_no_suit(v) or enhancement == "m_aij_canvas") then
			valid_jest_handsome_cards[#valid_jest_handsome_cards + 1] = v
		end
	end
	if valid_jest_handsome_cards[1] then
		local jest_handsome_card =
			pseudorandom_element(valid_jest_handsome_cards, pseudoseed("handsome" .. G.GAME.round_resets.ante))
		G.GAME.current_round.jest_handsome_joker_card.suit = jest_handsome_card.base.suit
		G.GAME.current_round.jest_handsome_joker_card.rank = jest_handsome_card.base.value
		G.GAME.current_round.jest_handsome_joker_card.id = jest_handsome_card.base.id
	end
	G.GAME.current_round.jest_handsome_joker_card.enhancement = SMODS.poll_enhancement({
		guaranteed = true,
		no_replace = true,
		key = "handsome" .. G.GAME.round_resets.ante,
		filter = function(pool)
			local new_pool = {}
			for _, v in ipairs(pool) do
				local center = G.P_CENTERS[v.key]
				if center and not (center.replace_base_card or center.overrides_base_rank) then
					new_pool[#new_pool + 1] = v
				end
			end
			return new_pool
		end,
	})
end
local function reset_the_auroch_blind()
	local common_suit, common_rank = nil, nil
	local temp_suit_val, temp_rank_val = 0, 0
	local suit_table, rank_table = {}, {}
	for _, v in pairs(G.deck.cards) do
		suit_table[v.base.suit] = suit_table[v.base.suit] or 0
		suit_table[v.base.suit] = suit_table[v.base.suit] + 1
		rank_table[v.base.value] = rank_table[v.base.value] or 0
		rank_table[v.base.value] = rank_table[v.base.value] + 1
	end
	for k, v in pairs(suit_table) do -- TODO nondeterministic, breaks seeding
		if v >= temp_suit_val then
			temp_suit_val = v
			common_suit = k
		end
	end
	for k, v in pairs(rank_table) do -- TODO same as above
		if v >= temp_rank_val then
			temp_rank_val = v
			common_rank = k
		end
	end
	G.GAME.current_round.aij_the_auroch = { suit = common_suit or "Spades", rank = common_rank or "Ace" }
end
local function reset_jest_lavatch_card()
	G.GAME.current_round.jest_lavatch_card = G.GAME.current_round.jest_lavatch_card or { suit = "Spades" }
	local ancient_suits = {}
	for _, suit_key in ipairs({ "Spades", "Hearts", "Clubs", "Diamonds" }) do
		if suit_key ~= G.GAME.current_round.jest_lavatch_card.suit then
			ancient_suits[#ancient_suits + 1] = suit_key
		end
	end
	local ancient_card = pseudorandom_element(ancient_suits, "vremade_ancient" .. G.GAME.round_resets.ante)
	G.GAME.current_round.jest_lavatch_card.suit = ancient_card
end
local function reset_the_journey_blind()
	local selected_suit = pseudorandom_element(All_in_Jest.get_suits("key"), pseudoseed("the_journey"))
	-- By default the special journey background will fade during the evaluate screen, nesting events here prevents this
	-- This *is* jank
	G.E_MANAGER:add_event(Event({
		func = function()
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.current_round.aij_the_journey_blind =
						{ selected_suit = selected_suit or "Spades", triggered = false }
					return true
				end,
			}))
			return true
		end,
	}))
end
local function reset_aureate_coin_blind()
	G.GAME.current_round.aij_aureate_coin_blind = { spent_money = 0 }
end
local function reset_the_heart_blind()
	local hands = {
		"Two Pair",
		"Flush",
		"Straight",
		"Three of a Kind",
	}
	local chosen_hand = pseudorandom_element(hands, pseudoseed("jest_the_heart_blind" .. G.GAME.round_resets.ante))
	G.GAME.current_round.aij_the_heart = { hand = chosen_hand or "Two Pair" }
end
local function reset_jest_hangman_card()
	G.GAME.current_round.aij_hangman_card = { rank = "Ace", suit = "Spades" }
	local valid_hangman_cards = {}
	for _, playing_card in ipairs(G.playing_cards) do
		if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) then
			valid_hangman_cards[#valid_hangman_cards + 1] = playing_card
		end
	end
	local hangman_card = pseudorandom_element(valid_hangman_cards, "vremade_idol" .. G.GAME.round_resets.ante)
	if hangman_card then
		G.GAME.current_round.aij_hangman_card.rank = hangman_card.base.value
		G.GAME.current_round.aij_hangman_card.suit = hangman_card.base.suit
		G.GAME.current_round.aij_hangman_card.id = hangman_card.base.id
	end
end
function All_in_Jest.reset_game_globals(run_start)
	-- Globals for a single blind (like Idol)
	reset_jest_magick_joker_card()
	reset_jest_you_broke_it_card()
	reset_jest_lavatch_card()
	reset_jest_hangman_card()
	G.GAME.shop_galloping_dominoed = false
	G.GAME.jest_shop_perma_free = false

	reset_jest_visage_cards()

	if G.GAME.round_resets.blind_states.Boss == "Defeated" or run_start then
		-- Globals for a single ante (not a thing in Vanilla)
		-- Checks run_start as well to trigger at start of run, G.GAME.round_resets.blind_states.Boss == 'Defeated' only checks for the end of an ante

		-- Reset Boss Blinds
		reset_the_auroch_blind()
		reset_the_journey_blind()
		reset_aureate_coin_blind()
		reset_the_heart_blind()
	end

	if run_start then
		-- Globals for a whole run (like Fortune Teller)
		reset_handsome_joker_card()

		G.GAME.all_in_jest.starting_prams.deck_size = #G.deck.cards

		local index = { 4, 5 }
		G.GAME.all_in_jest.pit_blind_ante = pseudorandom_element(index, pseudoseed("pit_blinds"))

		-- Reset Aureate Coin
		G.P_BLINDS["bl_aij_aureate_coin"].boss.spent_money = 0
	end
end

function All_in_Jest.set_ability_reset_keys()
	return { "jest_charged_applied" }
end

function All_in_Jest.set_debuff(card)
	if card.ability and card.ability.all_in_jest and card.ability.all_in_jest.perma_debuff then
		return true
	end
end

function All_in_Jest.calculate(self, context)
	if context.ante_end and G.GAME.aij_big_boss_reset_ante then
		G.GAME.aij_has_big_boss = nil
		G.GAME.aij_big_boss_reset_ante = nil
		for k, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_ante) do
			G.GAME.all_in_jest.advanced_hand_usage_ante[k] = nil
		end
	end
	if context.ending_booster and G.GAME.all_in_jest.dizzard_shop and G.shop.alignment.offset.y ~= -5.3 then
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			func = function()
				if G.shop.alignment.offset.y ~= -5.3 then
					G.shop.alignment.offset.y = -5.3
				end
				return true
			end
		}))
	end
	if context.ending_booster then
		if G.discard and #G.discard.cards > 0 and G.GAME.aij_discared_start_booster then
			G.FUNCS.draw_from_discard_to_deck()
		end
		G.GAME.aij_discared_start_booster = nil
	end
	if context.open_booster and G.GAME.aij_discard_button and G.GAME.aij_booster_discards and G.GAME.aij_booster_discards > 0 and not G.GAME.aij_discared_start_booster then
		G.GAME.current_round.discards_left = G.GAME.aij_booster_discards
		G.GAME.aij_discared_start_booster = true
	end
	if context.end_of_round then
		G.GAME.all_in_jest.dizzard_shop = false
	end
	if context.ending_shop then
		-- Set to zero for Gille (and any other similar blind rerolling effects)
		G.GAME.current_round.reroll_cost_increase = 0
	end
	if context.setting_blind then
		if G.GAME.aij_show_hand then
			G.hand.states.visible = true
			G.GAME.aij_show_hand = nil
		end
		for k, v in pairs(G.jokers.cards) do
			if v.ability and v.ability.all_in_jest and v.ability.all_in_jest.has_been_rerolled then
				card_eval_status_text(v, "extra", nil, nil, nil, {message = localize("k_reset"), colour = G.C.FILTER})
				All_in_Jest.reroll_joker(v, v.ability.all_in_jest.has_been_rerolled, 'stage_production')
				v.ability.all_in_jest.has_been_rerolled = nil
			end
		end
	end
	if context.aij_set_or_reroll_blind and context.blind.key ~= 'bl_aij_the_kind' and not context.run_info and G.GAME.all_in_jest.has_been_bl_aij_the_kind then
		local kind_present = false
		for k, v in pairs(G.GAME.round_resets.blind_choices) do
			if v == 'bl_aij_the_kind' then
				kind_present = true
			end
		end
		if not kind_present then
			G.GAME.all_in_jest.has_been_bl_aij_the_kind = nil
			G.E_MANAGER:add_event(Event({
				trigger = 'immediate',
				func = function()
					aij_reroll_tags(nil, {force_no_gold, do_not_change_tags = true})
					return true
				end
			}))
		end
	end
	if context.aij_set_or_reroll_blind and context.blind.key == 'bl_aij_the_kind' and not context.run_info then
		G.GAME.all_in_jest.has_been_bl_aij_the_kind = true
		G.E_MANAGER:add_event(Event({
			trigger = 'immediate',
			func = function()
				aij_reroll_tags(nil, {force_gold = true, do_not_change_tags = true})
				return true
			end
		}))
	end
end

function All_in_Jest.custom_card_areas(game)
	load_coconut_card_area(game)
end
