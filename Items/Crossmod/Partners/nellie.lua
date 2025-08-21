local nellie = {
  object_loader = Partner_API,
  object_type = "Partner",
  order = 2,

  key = "nellie",
  config = {
    extra = {
      edition_rate = 2,
    }
  },
  pos = { x = 2, y = 0},
  atlas = 'partner_atlas',
  unlocked = false,
  discovered = true,
  link_config = {j_aij_negative_nancy = 1},
  loc_vars = function(self, info_queue, card)
    local link_level = self:get_link_level()
    local benefits = 1
    if link_level == 1 then benefits = 2.5 end
    return {
      vars = {
        card.ability.extra.edition_rate * benefits,
      }
    }
  end,
  check_for_unlock = function(self, args)
    for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
      if v.key == "j_aij_negative_nancy" then
        if get_joker_win_sticker(v, true) >= 8 then
          return true
        end
        break
      end
    end
  end,
}
if next(SMODS.find_mod("partner")) then
    return { name = {"Partners"}, items = {nellie} }
end