SMODS.current_mod.config_tab = function()
  return {
    n = G.UIT.ROOT,
    config = { align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
    nodes = {
      {
        n = G.UIT.R,
        config = { align = 'cm', minh = 1 },
        nodes = {
          { n = G.UIT.T, config = { text = localize('aij_requires_restart'), colour = G.C.RED, scale = 0.5 } }
        }
      },
      {
        n = G.UIT.R,
        nodes = {
          {
            n = G.UIT.C,
            nodes = {
              create_toggle {
                label = localize('aij_enable_moons'),
                ref_table = All_in_Jest.config,
                ref_value = 'moons_enabled'
              },
          },
        }
      }
    }
    }
  }
end