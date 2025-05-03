local martellino = {
    object_type = "Joker",
    order = 295,

    key = "martellino",
    config = {
      marte_rounds = 0,
      total_rounds = 3,
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 9, y = 8},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true, -- Egg has it so why not
    soul_pos = { x = 9, y = 9},
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.marte_rounds,
                card.ability.total_rounds
            }
        }
    end,
  
    calculate = function(self, cardd, context)
      if context.end_of_round and not context.individual and not context.repetition and not context.blueprintt then
        cardd.ability.marte_rounds = cardd.ability.marte_rounds + 1
        if cardd.ability.marte_rounds == cardd.ability.total_rounds then 
            local eval = function(card) return not card.REMOVED end
            juice_card_until(cardd, eval, true)
        end
        return {
            message = (cardd.ability.marte_rounds < cardd.ability.total_rounds) and (cardd.ability.marte_rounds..'/'..cardd.ability.total_rounds) or localize('k_active_ex'),
            colour = G.C.FILTER
        }
      end
      if context.selling_self and (cardd.ability.marte_rounds >= cardd.ability.total_rounds) and not context.blueprint then
        local eval = function(card) return (card.ability.loyalty_remaining == 0) and not G.RESET_JIGGLES end
                            juice_card_until(cardd, eval, true)
        if #G.jokers.cards <= G.jokers.config.card_limit then 
            G.SETTINGS.paused = true
            G.FUNCS.overlay_menu{
              config = {no_esc = true},
              definition = SMODS.jest_no_back_card_collection_UIBox(
                  G.P_CENTER_POOLS.Joker, 
                  {5,5,5}, 
                  {
                      no_materialize = true, 
                      modify_card = function(card, center) 
                          card.sticker = get_joker_win_sticker(center) 
                          if card.config.center.discovered then
                            jest_create_select_card_ui(card)
                          end
                      end, 
                      h_mod = 1.05,
                  }
              ),
            }
            if cardd.ability.marte_rounds then cardd.ability.marte_rounds = 0 end
        else
            card_eval_status_text(context.blueprint_card or cardd, 'extra', nil, nil, nil, {message = localize('k_no_room_ex')})
        end
      end
    end
  
}
return { name = {"Jokers"}, items = {martellino} }
