local flub = {
  object_loader = Partner_API,
  object_type = "Partner",
  order = 5,

  key = "flub",
  config = {
    
  },
  pos = { x = 1, y = 1},
  atlas = 'partner_atlas',
  unlocked = false,
  discovered = true,
  link_config = {j_aij_mistake = 1},
  loc_vars = function(self, info_queue, card)
    local link_level = self:get_link_level()
    local benefits = 'half price'
    if link_level == 1 then benefits = 'free' end
    return {
      vars = {
        benefits,
      }
    }
  end,
  check_for_unlock = function(self, args)
    for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
      if v.key == "j_aij_mistake" then
        if get_joker_win_sticker(v, true) >= 8 then
          return true
        end
        break
      end
    end
  end,

  calculate = function(self, card, context)
    if context.reroll_shop or context.starting_shop then
        for k, v in pairs(G.shop_jokers.cards) do
            if SMODS.is_eternal(v) then
                local link_level = self:get_link_level()
                local benefits = 0.5
                if link_level == 1 then benefits = 0 end
                v.cost = v.cost * benefits
                v:juice_up(0.3, 0.5)
            end
        end
    end
  end
}
if next(SMODS.find_mod("partner")) then
    return { name = {"Partners"}, items = {flub} }
end