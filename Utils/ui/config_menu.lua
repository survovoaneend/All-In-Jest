SMODS.current_mod.config_tab = function()
  return {n = G.UIT.ROOT, config = {r = 0.1, minw = 4, align = "tm", padding = 0.2, colour = G.C.BLACK}, nodes = {
    {n = G.UIT.C, config = {r = 0.1, minw = 4, align = "tc", padding = 0.2, colour = G.C.BLACK}, nodes = {
      {n = G.UIT.R, config = {align = "cm", r = 0.1, padding = 0.2}, nodes = {
        UIBox_button({label = {localize('aij_button_content')}, button = 'aij_config_content', minw = 5}),
        UIBox_button({label = {localize('aij_button_moons')}, button = 'aij_config_moons', minw = 5}),
        UIBox_button({label = {localize('aij_button_visuals')}, button = 'aij_config_visuals', minw = 5}),
        UIBox_button({label = {localize('aij_button_consistency')}, button = 'aij_config_consistency', minw = 5}),
      }},
    }},
  }}
end

G.FUNCS.aij_config_content = function(e)
  G.FUNCS.overlay_menu{
    definition = create_UIBox_generic_options({
      back_func = "aij_back_config",
      contents = {
        {n = G.UIT.R, config = {padding = 0, align = "tm"}, nodes = {
          {n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('465255')}, nodes = {
            {n = G.UIT.R, config = {align = 'cm', minh = 1}, nodes = {
              {n = G.UIT.T, config = {text = localize('aij_button_content'), colour = G.C.WHITE, scale = 0.8}}
            }},
            {n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('4a6972'), minw = 8.5}, nodes = {
              {n = G.UIT.R, config = {align = 'cm'}, nodes = {{n = G.UIT.C,
                config = {tooltip = {text = localize('aij_lite_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_lite'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'aij_lite'
                  },
                },
              }}},
              {n = G.UIT.R, config = {align = 'cm'}, nodes = {{n = G.UIT.C,
                config = {tooltip = {text = localize('aij_blue_stake_rework_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_blue_stake_rework'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'blue_stake_rework'
                  },
                },
              }}},
              {n = G.UIT.R, config = {align = 'cm'}, nodes = {{n = G.UIT.C,
                config = {tooltip = {text = localize('aij_no_copy_neg_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_no_copy_neg'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'no_copy_neg'
                  },
                },
              }}},
            }},
          }},
        }}
      }
    })
  }
end
G.FUNCS.aij_config_moons = function(e)
  G.FUNCS.overlay_menu{
    definition = create_UIBox_generic_options({
      back_func = "aij_back_config",
      contents = {
        {n = G.UIT.R, config = {padding = 0, align = "tm"}, nodes = {
          {n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('465255')}, nodes = {
            {n = G.UIT.R, config = {align = 'cm', minh = 1}, nodes = {
              {n = G.UIT.T, config = {text = localize('aij_button_moons'), colour = G.C.WHITE, scale = 0.8}}
            }},
            {n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('4a6972'), minw = 8.5}, nodes = {
              {n = G.UIT.R, config = {align = 'cm'}, nodes = {{n = G.UIT.C,
                config = {tooltip = {text = localize('aij_enable_moons_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_enable_moons'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'moons_enabled'
                  },
                },
              }}},
              {n = G.UIT.R, config = {align = 'cm'}, nodes = {{n = G.UIT.C,
                config = {tooltip = {text = localize('aij_moons_blocking_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_moons_blocking'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'moons_blocking'
                  },
                },
              }}},
            }},
          }},
        }}
      }
    })
  }
end
G.FUNCS.aij_config_visuals = function(e)
  G.FUNCS.overlay_menu{
    definition = create_UIBox_generic_options({
      back_func = "aij_back_config",
      contents = {
        {n = G.UIT.R, config = {padding = 0, align = "tm"}, nodes = {
          {n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('465255')}, nodes = {
            {n = G.UIT.R, config = {align = 'cm', minh = 1}, nodes = {
              {n = G.UIT.T, config = {text = localize('aij_button_visuals'), colour = G.C.WHITE, scale = 0.8}}
            }},
            {n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('4a6972'), minw = 8.5}, nodes = {
              {n = G.UIT.R, config = {align = 'cm'}, nodes = {{n = G.UIT.C,
                config = {tooltip = {text = localize('aij_red_destroy_text_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_red_destroy_text'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'red_destroy_text'
                  },
                },
              }}},
              {n = G.UIT.R, config = {align = 'cm'}, nodes = {{n = G.UIT.C,
                config = {tooltip = {text = localize('aij_random_deck_skins_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_random_deck_skins'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'random_deck_skins'
                  },
                },
              }}},
              {n = G.UIT.R, config = {align = 'cm'}, nodes = {{n = G.UIT.C,
                config = {tooltip = {text = localize('aij_alter_trypophobia_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_alter_trypophobia'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'alter_trypophobia'
                  },
                },
              }}},
              {n = G.UIT.R, config = {align = 'cm'}, nodes = {{n = G.UIT.C,
                config = {tooltip = {text = localize('aij_guess_names_tooltip')}},
                nodes = {
                  create_toggle {
                    label = localize('aij_guess_names'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'guess_names'
                  },
                },
              }}},
            }},
          }},
        }}
      }
    })
  }
end
G.FUNCS.aij_config_consistency = function(e)
  G.FUNCS.overlay_menu{
    definition = create_UIBox_generic_options({
      back_func = "aij_back_config",
      contents = {
        {n = G.UIT.R, config = {padding = 0, align = "tm"}, nodes = {
          {n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('465255')}, nodes = {
            {n = G.UIT.R, config = {align = 'cm', minh = 1}, nodes = {
              {n = G.UIT.T, config = {text = localize('aij_button_consistency'), colour = G.C.WHITE, scale = 0.8}}
            }},
            {n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('4a6972'), minw = 8.5}, nodes = {
              {n = G.UIT.R, config = {align = 'cm'}, nodes = {{n = G.UIT.C,
                config = {tooltip = {text = localize('aij_mult_appearance_tooltip')}},
                nodes = {
                  create_option_cycle {
                    scale = 0.8,
                    label = localize('aij_mult_appearance'),
                    options = localize('aij_mult_appearance_opt'),
                    ref_table = All_in_Jest.config,
                    ref_value = 'mult_appearance',
                    current_option = All_in_Jest.config.mult_appearance,
                    opt_callback = 'aij_generic_cycle',
                  },
                },
              }}},
              -- has no effect currently
              -- {n = G.UIT.R, config = {align = 'cm'}, nodes = {{n = G.UIT.C,
              --   config = {tooltip = {text = localize('aij_suit_boss_blocking_tooltip')}},
              --   nodes = {
              --     create_toggle {
              --       label = localize('aij_suit_boss_blocking'),
              --       ref_table = All_in_Jest.config,
              --       ref_value = 'suit_boss_blocking'
              --     },
              --   },
              -- }}},
            }},
          }},
        }}
      }
    })
  }
end