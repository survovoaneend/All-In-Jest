local red_sky = {
    object_type = "Joker",
    order = 125,
    key = "red_sky",
    config = {
      
    },
    rarity = 2,
    pos = { x = 19, y = 4 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        local has_red_sky = false

        if G.jokers and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do
                local k = j.config and j.config.center_key
                if k == "j_aij_red_sky" then 
                    if j == card then
                        has_red_sky = true
                    end
                    break
                end
            end
        end
        if G.GAME.current_round.hands_played == 0 or G.GAME.current_round.hands_left == 0 then
            if G.play ~= nil and has_red_sky then
                for _, card in ipairs(G.play.cards) do
                  if context.before then
                    local saved = card.ability._saved_chip_values
                    if saved == nil then
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
        end
    end
  
}
return { name = {"Jokers"}, items = {red_sky} }
