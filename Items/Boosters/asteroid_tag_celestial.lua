

local asteroid_tag_celestial = {
    object_type = "Booster",
    no_collection = true,
    key = 'asteroid_tag_celestial', 
    pos = {x=0, y=1}, 
    cost = 0, 
    weight =  0, 
    config = { extra = 3, choose = 1 }, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra}, key = "p_celestial_normal" }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.PLANET_PACK)
    end,
    particles = function(self)
        G.booster_pack_stars = Particles(1, 1, 0,0, {
            timer = 0.07,
            scale = 0.1,
            initialize = true,
            lifespan = 15,
            speed = 0.1,
            padding = -4,
            attach = G.ROOM_ATTACH,
            colours = {G.C.WHITE, HEX('a7d6e0'), HEX('fddca0')},
            fill = true
        })
        G.booster_pack_meteors = Particles(1, 1, 0,0, {
            timer = 2,
            scale = 0.05,
            lifespan = 1.5,
            speed = 4,
            attach = G.ROOM_ATTACH,
            colours = {G.C.WHITE},
            fill = true
        })
    end,
    create_card = function(self, card, i)
        local tmp_key = 'c_black_hole'
        if i == 1 then
          tmp_key = 'c_black_hole'
        elseif i == 2 then
          tmp_key = 'c_aij_gravastar'
        elseif i == 3 then
          tmp_key = 'c_aij_pulsar'
        end
        return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = true, key = tmp_key}
    end,
    group_key = "k_celestial_pack",
}

return { name = {"Boosters"}, items = { asteroid_tag_celestial } }
