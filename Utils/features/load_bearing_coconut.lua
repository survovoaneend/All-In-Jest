
function load_coconut_card_area(game)
	game.aij_coconut_holder = CardArea(
		game.jokers.T.x + 12.5, game.jokers.T.y - 4,
        game.jokers.T.w / 5, game.jokers.T.h,
        { card_limit = 1, type = 'joker', highlight_limit = 1 }
	)
  local temp = SMODS.bypass_create_card_edition
  SMODS.bypass_create_card_edition = true
  local temp_card = create_card('Joker', G.aij_coconut_holder, nil, nil, nil, nil, 'j_aij_coconut', 'aij_coconut_holder')
  -- temp_card:start_materialize(nil, true)
  temp_card.ability.jest_got_no_ui = true
  G.aij_coconut_holder:emplace(temp_card)
  SMODS.bypass_create_card_edition = temp
end

G.FUNCS.aij_coconut_delete = function(e, mute, nosave)
    stop_use()
    
    local card = e.config.ref_table
    local area = card.area

    card:All_in_Jest_start_dissolve()
    G.E_MANAGER:add_event(Event({
        func = (function()
            error("Coconut.joker not found")
            return true
        end)
    }))
end