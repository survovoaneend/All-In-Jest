local opening_move = {
    object_type = "Joker",
    order = 274,
    key = "opening_move",
    config = {
      extra = {
          xmult = 0.5,
          cur_xmult = 1,
      }
    },
    rarity = 2,
    pos = { x = 22, y = 10},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.cur_xmult,
            }
        }
    end,

    update = function(self, card, dt)
        if G.GAME.current_round.hands_played <= 0 then
            G.boss_throw_hand = true
            SMODS.debuff_text = "(" .. localize{type="name_text", set="Joker", key=card.config.center.key} .. ")"
        else
            SMODS.debuff_text = nil
        end
    end,
  
    calculate = function(self, card, context)
        if not context.blueprint then
            if context.individual and context.cardarea == G.play and G.GAME.current_round.hands_played <= 0 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "cur_xmult",
                    scalar_value = "xmult",
                    no_message = true,
                })

                return {
                    message = localize('k_upgrade_ex'),
                }
            end
            if context.all_in_jest and context.all_in_jest.before_after and G.GAME.current_round.hands_played <= 0 and (hand_chips > 0 or mult > 0) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',delay = 0.4,
                    func = (function()
                        card:juice_up()
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end}))
                        play_sound('tarot2', 1, 0.4)
                        return true
                    end)
                }))

                SMODS.Scoring_Parameters["chips"]:modify(-SMODS.Scoring_Parameters["chips"].current)
                SMODS.Scoring_Parameters["mult"]:modify(-SMODS.Scoring_Parameters["mult"].current)

                play_area_status_text(localize("k_aij_does_not_score_ex"))
            end
            if context.end_of_round and context.cardarea == G.jokers then
                card.ability.extra.cur_xmult = 1
                return {
                    message = localize('k_reset'),
                }
            end
        end
        if context.joker_main then
            if card.ability.extra.cur_xmult > 0 and G.GAME.current_round.hands_played > 0 then
                return {
                    Xmult = card.ability.extra.cur_xmult
                }
            end
        end
    end
}

return { name = {"Jokers"}, items = {opening_move} }
