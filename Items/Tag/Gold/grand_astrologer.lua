local grand_astrologer = {
  object_type = "Tag",
  key = 'grand_astrologer',

  pos = { x = 11, y = 4 },
  atlas = 'tag_atlas',
  config = {
      aij = {
          upgrade = 'aij_astrology',
      },
  },
  attributes = {'planet', 'hand_level'},

  discovered = false,
  order = 34,
  min_ante = 3,

  loc_vars = function(self, info_queue, tag)
      return { vars = {} }
  end,

  apply = function(self, tag, context)
      if context.type == 'using_consumeable' then
          if context.consumeable.ability.set == 'Planet' then
              tag:jest_apply("+", G.C.ATTENTION, function()
                  SMODS.upgrade_poker_hands({level_up = pseudorandom('jest_grand_astrologer_tag', 2, 4), instant = true})
                  return true
		      end,
              function() 
                  return context.consumeable.ability.set == 'Planet'
              end)
              tag.triggered = true
              return true
          end
      end
  end,
  in_pool = function(self, args)
      return false
  end,
}
return { name = "Tags", items = { grand_astrologer } }
