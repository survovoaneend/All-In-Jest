local magick_joker = {
    object_type = "Joker",
    order = 88,
    key = "magick_joker",
    config = {
      current_suit = "Spades",
      _saved_chip_values = {}
    },
    rarity = 2,
    pos = { x = 8, y = 3 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
		        localize(G.GAME.current_round.jest_magick_joker_card and G.GAME.current_round.jest_magick_joker_card.suit or "Spades", "suits_singular"),
		        colours = {G.C.SUITS[G.GAME.current_round.jest_magick_joker_card and G.GAME.current_round.jest_magick_joker_card.suit or "Spades"]},
            }
        }
    end,
  
    calculate = function(self, card, context)
        local has_magick_joker = false

        if G.jokers and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do
                local k = j.config and j.config.center_key
                if k == "j_aij_magick_joker" then 
                    if j == card then
                        has_magick_joker = true
                    end
                    break
                end
            end
        end
        if G.play ~= nil and has_magick_joker then
            for _, card in ipairs(G.play.cards) do
              if context.before then
                local saved = card.ability._saved_chip_values
                if saved == nil and not card.debuff and card:is_suit(G.GAME.current_round.jest_magick_joker_card.suit) then
                  local _, cval  = jest_ability_get_items(card,"nil",2,{extra_value=true},{"nominal"},false,true,"base")
                  local _, hval  = jest_ability_get_items(card,"nil",2,{extra_value=true},{"h_chips"},false,true,"ability.extra")
                  local _, bval  = jest_ability_get_items(card,"nil",2,{extra_value=true},{"bonus"},false,true,"ability.extra")
                  local _, pbval = jest_ability_get_items(card,"nil",2,{extra_value=true},{"perma_bonus"},false,true,"ability.extra")

                  card.ability._saved_chip_values = {
                    nominal = cval[1] or 0,
                    h_chips = hval[1] or 0,
                    bonus = bval[1] or 0,
                    perma_bonus = pbval[1] or 0,
                  }
                  saved = card.ability._saved_chip_values
                end

                if saved ~= nil then
                  jest_ability_calculate(card, "+", saved.nominal, nil, {"mult"}, false, true, "ability.extra")
                  jest_ability_calculate(card, "-", saved.nominal, nil, {"nominal"}, false, true, "base")
                  jest_ability_calculate(card, "-", saved.h_chips, nil, {"h_chips"}, false, true, "ability.extra")
                  jest_ability_calculate(card, "+", saved.h_chips, nil, {"h_mult"}, false, true, "ability.extra")
                  jest_ability_calculate(card, "-", saved.bonus, nil, {"bonus"}, false, true, "ability.extra")
                  jest_ability_calculate(card, "+", saved.bonus, nil, {"mult"}, false, true, "ability.extra")
                  jest_ability_calculate(card, "-", saved.perma_bonus, nil, {"perma_bonus"}, false, true, "ability.extra")
                  jest_ability_calculate(card, "+", saved.perma_bonus, nil, {"perma_mult"},  false, true, "ability.extra")
                end
              end

              if context.final_scoring_step then
                local saved = card.ability._saved_chip_values
                if saved ~= nil then
                  jest_ability_calculate(card, "-", saved.nominal, nil, {"mult"}, false, true, "ability.extra")
                  jest_ability_calculate(card, "+", saved.nominal, nil, {"nominal"}, false, true, "base")
                  jest_ability_calculate(card, "+", saved.h_chips, nil, {"h_chips"}, false, true, "ability.extra")
                  jest_ability_calculate(card, "-", saved.h_chips, nil, {"h_mult"}, false, true, "ability.extra")
                  jest_ability_calculate(card, "+", saved.bonus, nil, {"bonus"}, false, true, "ability.extra")
                  jest_ability_calculate(card, "-", saved.bonus, nil, {"mult"}, false, true, "ability.extra")
                  jest_ability_calculate(card, "+", saved.perma_bonus, nil, {"perma_bonus"}, false, true, "ability.extra")
                  jest_ability_calculate(card, "-", saved.perma_bonus, nil, {"perma_mult"},  false, true, "ability.extra")
                  card.ability._saved_chip_values = nil
                end
              end
            end
        end
        if context.end_of_round then
            reset_jest_magick_joker_card()
        end
    end
  
}
return { name = {"Jokers"}, items = {magick_joker} }
