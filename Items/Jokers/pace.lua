local pace = {
    object_type = "Joker",
    order = 1023,

    key = "pace",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 2, y = 4},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 2, y = 5},
  
    loc_vars = function(self, info_queue, card)
  
    end,
}
local updateref = Card.update
function Card:update(dt)
  local ref = updateref(self, dt)

  if self.config.center.jest_real_rarity ~= nil then
      local orig = self.config.center.jest_real_rarity
      if orig == "2" or orig == "3" or orig == "Uncommon" or orig == "Rare" then
        local num = tonumber(orig)
        if num then
          self.config.center.rarity = num
        else
          self.config.center.rarity = orig
        end
      end
  end

  if G.jokers and self.ability.set == 'Joker' then
    if self.config.center.jest_real_rarity ~= "1" and self.config.center.jest_real_rarity ~= "Common" then
        if self.config.center.jest_real_rarity == nil then
          local r = self.config.center.rarity
          self.config.center.jest_real_rarity = type(r) == "number" and tostring(r) or r
        end
    end

    local has_pace = next(SMODS.find_card("j_aij_pace"))
    if self.config.center.jest_real_rarity ~= "1" and self.config.center.jest_real_rarity ~= "Common" then
        if has_pace then
          local orig = self.config.center.jest_real_rarity
          if orig == "2" or orig == "3" or orig == "Uncommon" or orig == "Rare" then
            self.config.center.rarity = 1
          end
        else
          local orig = self.config.center.jest_real_rarity
          local num = tonumber(orig)
          if num then
            self.config.center.rarity = num
          else
            self.config.center.rarity = orig
          end
        end
    end
  elseif self.ability.set == 'Joker' then
      if self.config.center.jest_real_rarity ~= "1" and self.config.center.jest_real_rarity ~= "Common" then
          if self.config.center.jest_real_rarity == nil then
              local r = self.config.center.rarity
              self.config.center.jest_real_rarity = type(r) == "number" and tostring(r) or r
          end

          local orig = self.config.center.jest_real_rarity
          local num = tonumber(orig)
          if num then
            self.config.center.rarity = num
          else
            self.config.center.rarity = orig
          end
      end
  end

  return ref
end

local main_menuref = Game.main_menu
function Game:main_menu(change_context)
  for k, joker in pairs(G.P_CENTER_POOLS['Joker']) do
      if joker.config.center and joker.config.center.jest_real_rarity ~= nil then
          if joker.config.center.jest_real_rarity ~= "1" and joker.config.center.jest_real_rarity ~= "Common" then
              local orig = joker.config.center.jest_real_rarity
              local num = tonumber(orig)
              if num then
                joker.config.center.rarity = num
              else
                joker.config.center.rarity = orig
              end
              joker.config.center.jest_real_rarity = nil
          end
      end
  end

  local ref = main_menuref(self, change_context)
  return ref
end

local start_runref = Game.start_run
function Game:start_run(args)
  for k, joker in pairs(G.P_CENTER_POOLS['Joker']) do
      if joker.config.center and joker.config.center.jest_real_rarity ~= nil then
          if joker.config.center.jest_real_rarity ~= "1" and joker.config.center.jest_real_rarity ~= "Common" then
              local orig = joker.config.center.jest_real_rarity
              local num = tonumber(orig)
              if num then
                joker.config.center.rarity = num
              else
                joker.config.center.rarity = orig
              end
              joker.config.center.jest_real_rarity = nil
          end
      end
  end

  local ref = start_runref(self, args)
  return ref
end

return { name = {"Jokers"}, items = {pace} }
