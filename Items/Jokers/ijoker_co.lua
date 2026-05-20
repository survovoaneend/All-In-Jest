local tag_prices = {
    tag_uncommon = { type = "fixed", value = 5 },                  
    tag_rare     = { type = "fixed", value = 6 },  
    tag_negative = { type = "fixed", value = 8 },
    tag_foil = { type = "fixed", value = 5 },
    tag_holo = { type = "fixed", value = 5 },
    tag_polychrome = { type = "fixed", value = 6 },
    tag_investment = { type = "fixed", value = 12 },
    tag_voucher = { type = "fixed", value = 5 },
    tag_boss = { type = "fixed", value = 4 },
    tag_standard = { type = "fixed", value = 4 },
    tag_charm = { type = "fixed", value = 6 },
    tag_meteor = { type = "fixed", value = 4 },
    tag_buffoon = { type = "fixed", value = 4 },
    tag_handy = { type = "fixed", value = 10 },
    tag_garbage = { type = "fixed", value = 10 },
    tag_coupon = { type = "fixed", value = 10 },
    tag_double = { type = "fixed", value = 8 },
    tag_juggle = { type = "fixed", value = 4 },
    tag_d_six = { type = "fixed", value = 10 },
    tag_top_up = { type = "fixed", value = 5 },
    tag_skip = { type = "fixed", value = 5 },
    tag_orbital = { type = "fixed", value = 6 },
    tag_economy = { type = "fixed", value = 10 },
    tag_ethereal = { type = "fixed", value = 4 },
    tag_aij_soulbound = { type = "fixed", value = 7 },
    tag_aij_chaos = { type = "random", min = 3, max = 10 },
    tag_aij_glimmer = { type = "fixed", value = 5 },
    tag_aij_stellar = { type = "fixed", value = 5 },
    tag_aij_silver = { type = "fixed", value = 8 },
    tag_aij_aureate = { type = "fixed", value = 8 },
    tag_aij_overstuffed = { type = "fixed", value = 6 },
    tag_aij_fortunate = { type = "fixed", value = 8 },

    --Gold Tags

    tag_aij_unusual = { type = "fraction", value = 0.1, floor = 10 }, 
    tag_aij_recherche = { type = "fraction", value = 0.15, floor = 20 },
    tag_aij_dark_matter = { type = "fraction", value = 0.75, floor = 40 }, 
    tag_aij_crystal = { type = "fraction", value = 0.15, floor = 15 }, 
    tag_aij_iridescent = { type = "fraction", value = 0.15, floor = 15 }, 
    tag_aij_omnichrome = { type = "fraction", value = 0.25, floor = 30 }, 
    tag_aij_capital = { type = "fraction", value = 0.5, floor = 50 }, 
    tag_aij_ticket = { type = "fraction", value = 0.2, floor = 20 }, 
    tag_aij_dominus = { type = "fraction", value = 0.2, floor = 20 }, 
    tag_aij_nonstandard = { type = "fraction", value = 0.4, floor = 50 }, 
    tag_aij_occult = { type = "fraction", value = 0.15, floor = 30 }, 
    tag_aij_asteroid = { type = "fraction", value = 0.1, floor = 15 }, 
    tag_aij_ignoramus = { type = "fraction", value = 0.9, floor = 75 }, 
    tag_aij_polydactyly = { type = "fraction", value = 0.2, floor = 20 }, 
    tag_aij_landfill = { type = "fraction", value = 0.5, floor = 50 }, 
    tag_aij_hermetic = { type = "fraction", value = 0.5, floor = 40 }, 
    tag_aij_frugal = { type = "fraction", value = 0.2, floor = 20 }, 
    tag_aij_stereoscopic = { type = "fraction", value = 0.5, floor = 50 }, 
    tag_aij_gioco = { type = "fraction", value = 0.2, floor = 15 }, 
    tag_aij_galloping_domino = { type = "fraction", value = 0.4, floor = 55 }, 
    tag_aij_bierstiefel = { type = "fraction", value = 0.05, floor = 15 }, 
    tag_aij_velocity = { type = "fraction", value = 0.2, floor = 50 }, 
    tag_aij_circumplanetary = { type = "fraction", value = 0.1, floor = 25 }, 
    tag_aij_windfall = { type = "fraction", value = 0.5, floor = 30 }, 
    tag_aij_timelost = { type = "fraction", value = 0.2, floor = 20 }, 
    tag_aij_anarchy = { type = "fraction", value = 0.20, floor = 20 }, 
    tag_aij_glamour = { type = "fraction", value = 0.25, floor = 30 }, 
    tag_aij_superlunary = { type = "fraction", value = 0.15, floor = 15 },
    tag_aij_cinema = { type = "fraction", value = 0.75, floor = 40 }, 
    tag_aij_gold_dust = { type = "fraction", value = 0.35, floor = 50 }, 
    tag_aij_ventripotent = { type = "fraction", value = 0.15, floor = 20 }, 
    tag_aij_auspicious = { type = "fraction", value = 0.2, floor = 40 }, 
}

local ijoker_co = {
    object_type = "Joker",
    order = 211,

    key = "ijoker_co",
    config = {
      extra = {
          tags = 2
      }
    },
    rarity = 3,
    pos = { x = 0, y = 8},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.tags,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.starting_shop then
            for i = 1, card.ability.extra.tags do
                local tag = get_next_tag_key()
                local price = 0
                
                if tag_prices[tag] then
                    local def = tag_prices[tag]
                    
                    if def.type == "fixed" then
                        price = def.value
                        
                    elseif def.type == "random" then
                        price = pseudorandom('aij_ijoker_co', def.min, def.max)
                        
                    elseif def.type == "fraction" then
                        local current_money = math.max(0, G.GAME.dollars or 0)
                        local fraction_price = math.floor(current_money * def.value)
                        local floor_price = def.floor or 0 
    
                        price = math.max(floor_price, fraction_price)
                    end
                else
                    -- Fallback for tags not on the defined list
                    local is_gold = G.P_TAGS[tag].config.aij and G.P_TAGS[tag].config.aij.upgrade
                    price = is_gold and pseudorandom('aij_ijoker_co', 15, 30) or pseudorandom('aij_ijoker_co', 5, 10)
                end
                All_in_Jest.add_tag_to_shop(tag, price)
            end
        end
    end
  
}

return { name = {"Jokers"}, items = {ijoker_co} }