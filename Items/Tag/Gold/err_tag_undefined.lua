local err_tag_undefined = {
  object_type = "Tag",
  key = 'err_tag_undefined',

  pos = { x = 10, y = 4 },
  atlas = 'tag_atlas',
  config = {
    aij = {
      upgrade = 'aij_misprinted',
    },
  },
  attributes = {'joker', 'editions', 'shop'},

  discovered = false,
  order = 33,
  min_ante = 3,

  loc_vars = function(self, info_queue, tag)
    return { vars = {} }
  end,

  apply = function(self, tag, context)
    if context.type == 'store_joker_modify' then
      if not context.card.temp_edition and context.card.ability.set == 'Joker' then
        local lock = tag.ID or self.ID
        G.CONTROLLER.locks[lock] = true
        context.card.temp_edition = true
        context.card:set_edition({aij_misprint = true}, true)
        context.card.temp_edition = nil
        G.CONTROLLER.locks[lock] = nil
        tag.should_triggered = true
      end
    end
    if context.type == 'modify_booster_cards' then
        for k, v in pairs(context.pack_cards) do
            if v.ability.set == 'Joker' then
                v:set_edition({aij_misprint = true}, true)
                tag.should_triggered = true
            end
        end
    end
    if context.type == 'leaving_shop' and tag.should_triggered then
      tag:jest_apply("+", G.C.ATTENTION, function()
          return true
      end,
      function()
          return true
      end)
      tag.triggered = true
      return true
    end
  end,
}
return { name = "Tags", items = { err_tag_undefined } }
