local scratch = {
  object_loader = Partner_API,
  object_type = "Partner",
  order = 3,
  ignore = true,

  key = "scratch",
  config = {
    extra = {
        joker_index = 1
    }
  },
  pos = { x = 3, y = 0},
  atlas = 'partner_atlas',
  unlocked = false,
  discovered = true,
  link_config = {j_aij_doodle = 1},
  loc_vars = function(self, info_queue, card)
    local link_level = self:get_link_level()
    local benefits = 'or'
    if link_level == 1 then benefits = 'and' end
    return {
      vars = {
        benefits,
      }
    }
  end,
  check_for_unlock = function(self, args)
    for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
      if v.key == "j_aij_doodle" then
        if get_joker_win_sticker(v, true) >= 8 then
          return true
        end
        break
      end
    end
  end,

  calculate = function(self, card, context)
    if context.repetition_only or (context.retrigger_joker_check) then
        local link_level = self:get_link_level()
        local benefits = false
        if link_level == 1 then benefits = true end
        print(G.GAME.round % 2)
        if (G.GAME.round % 2) == 1 then 
            print(context.other_card)
            if card.ability.extra.joker_index == 1 or benefits then
                if context.other_card == G.jokers.cards[1] then
                    print('left')
                    return {
                        repetitions = 1,
                        card = context.other_card,
                        message = localize('k_again_ex')
                    }  
                end
            end
            if card.ability.extra.joker_index == 2 or benefits then
                if context.other_card == G.jokers.cards[#G.jokers.cards] then
                    print('right')
                    return {
                        repetitions = 1,
                        card = context.other_card,
                        message = localize('k_again_ex')
                    }  
                end  
            end
        end
    end
    if context.before then
        card.ability.extra.joker_index = math.random(1,2)
    end
  end
}
if next(SMODS.find_mod("partner")) then
    return { name = {"Partners"}, items = {scratch} }
end