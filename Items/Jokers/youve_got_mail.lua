local youve_got_mail = {
    object_type = "Joker",
    order = 361,
    key = "youve_got_mail",
    config = {
        extra = {
            mult = 4,
            chips = 20,
            dollars = 1,
            xmult = 1.25,
            effect = "none",
            prefix = "",
            text = localize('k_aij_youve_got_mail_none', 'extra_joker_dictionary'),
            colours = {
                main = G.C.UI.TEXT_INACTIVE,
                other = G.C.UI.TEXT_INACTIVE,
                background = G.C.WHITE
            }
        }
    },
    rarity = 3,
    pos = { x = 8, y = 14},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local num = ""
        card.ability.extra.colours.main = G.C.UI.TEXT_DARK
        if card.ability.extra.effect ~= "none" then
            num = card.ability.extra[card.ability.extra.effect]
        else
            card.ability.extra.text = localize('k_aij_youve_got_mail_none', 'extra_joker_dictionary')
            card.ability.extra.colours.main = G.C.UI.TEXT_INACTIVE
        end
        card.ability.extra.colours.background = G.C.WHITE
        if card.ability.extra.effect == "mult" then
            card.ability.extra.prefix = localize('k_aij_youve_got_mail_plus_prefix', 'extra_joker_dictionary')
            card.ability.extra.text = localize('k_aij_youve_got_mail_mult_text', 'extra_joker_dictionary')
            card.ability.extra.colours.other = G.C.MULT
        elseif card.ability.extra.effect == "chips" then
            card.ability.extra.prefix = localize('k_aij_youve_got_mail_plus_prefix', 'extra_joker_dictionary')
            card.ability.extra.text = localize('k_aij_youve_got_mail_chip_text', 'extra_joker_dictionary')
            card.ability.extra.colours.other = G.C.CHIPS
        elseif card.ability.extra.effect == "dollars" then
            card.ability.extra.prefix =  localize('k_aij_youve_got_mail_plus_prefix', 'extra_joker_dictionary')
            card.ability.extra.text = localize('k_aij_youve_got_mail_dollar_prefix', 'extra_joker_dictionary')..localize('k_aij_youve_got_mail_dollars_text', 'extra_joker_dictionary')
            card.ability.extra.colours.other = G.C.MONEY
        elseif card.ability.extra.effect == "xmult" then
            card.ability.extra.prefix = localize('k_aij_youve_got_mail_xmult_prefix', 'extra_joker_dictionary')
            card.ability.extra.text = localize('k_aij_youve_got_mail_mult_text', 'extra_joker_dictionary')
            card.ability.extra.colours.other = G.C.WHITE
            card.ability.extra.colours.background = G.C.MULT
        end
        return {
            vars = {
                card.ability.extra.prefix,
                num,
                card.ability.extra.text,
                colours = {
                    card.ability.extra.colours.main,
                    card.ability.extra.colours.other,
                    card.ability.extra.colours.background,
                }
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.setting_blind and (not card.edition or card.edition.type ~= 'negative') and not context.blueprint then
            local temp_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_aij_youve_got_mail', 'youve_got_mail')
            local edition = {negative = true}
            local effects = {
                "mult",
                "chips",
                "none",
                "dollars",
                "xmult",
            }
            temp_card.ability.extra.effect = effects[math.random(1, #effects)]
            temp_card:add_to_deck()
            G.jokers:emplace(temp_card)
            temp_card:set_edition(edition, true)
            temp_card:start_materialize()
            card_eval_status_text(temp_card, 'extra', nil, nil, nil, {message = localize('k_aij_youve_got_mail', 'extra_joker_dictionary'), colour = G.C.FILTER})
        end
        if context.joker_main then
            if card.ability.extra.effect == "mult" then
                return {
                    mult = card.ability.extra[card.ability.extra.effect]
                }
            elseif card.ability.extra.effect == "chips" then
                return {
                    chips = card.ability.extra[card.ability.extra.effect]
                }
            elseif card.ability.extra.effect == "dollars" then
                return {
                    dollars = card.ability.extra[card.ability.extra.effect]
                }
            elseif card.ability.extra.effect == "xmult" then
                return {
                    xmult = card.ability.extra[card.ability.extra.effect]
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {youve_got_mail} }
