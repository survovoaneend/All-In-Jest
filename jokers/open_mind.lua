SMODS.Joker {
  key = "open_mind",
  config = {
    extra = { packs = 2 }
  },
  loc_txt = {
    name = "Open Mind",
    text ={
        "{C:attention}#1#{} additional random",
        "{C:attention}Booster Packs{} available",
        "for purchase in every",
        "{C:attention}shop{}"
    },
},
  rarity = 3,
  pos = { x = 22, y = 4 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.extra.packs} }
  end,

    calculate = function(self, card, context)
        if context.entering_shop then
            local packs = {
                'p_arcana_normal_1', 'p_arcana_normal_2', 'p_arcana_normal_3', 'p_arcana_normal_4', 'p_arcana_jumbo_1',
                'p_arcana_jumbo_2', 'p_arcana_mega_1', 'p_arcana_mega_2',
                'p_celestial_normal_1', 'p_celestial_normal_2', 'p_celestial_normal_3', 'p_celestial_normal_4',
                'p_celestial_jumbo_1', 'p_celestial_jumbo_2', 'p_celestial_mega_1', 'p_celestial_mega_2',
                'p_spectral_normal_1', 'p_spectral_normal_2', 'p_spectral_jumbo_1', 'p_spectral_mega_1',
                'p_standard_normal_1', 'p_standard_normal_2', 'p_standard_normal_3', 'p_standard_normal_4',
                'p_standard_jumbo_1', 'p_standard_jumbo_2', 'p_standard_mega_1', 'p_standard_mega_2',
                'p_buffoon_normal_1', 'p_buffoon_normal_2', 'p_buffoon_jumbo_1', 'p_buffoon_mega_1',
            }
            for i = 1, 2 do
                local pack_key_to_add = pseudorandom_element(packs, pseudoseed('open_mind_pack_' .. i))
                G.E_MANAGER:add_event(Event {
                    func = function()
                        add_booster_pack(pack_key_to_add, pack_key_to_add.cost)
                        return true
                    end
                })
            end
            return {
                message = '+2 Packs'
            }
        end
    end
}
