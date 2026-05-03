local sidereal_booster_base = {
    object_type = "Booster",
    order = 1,
    key = 'sidereal_normal', 
    atlas = 'booster_atlas', 
    pos = { x = 0, y = 3 }, 
    cost = 4, 
    weight = 0.6,
    config = { extra = 3, choose = 1 }, 
    discovered = false, 
    unlocked = true, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra}, key = "p_aij_sidereal" }
    end,
    ease_background_colour = function(self) ease_background_colour_blind(G.STATES.PLANET_PACK) end,
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
    get_weight = function(self)
        return (G.GAME.all_in_jest.sidereal_packs_rate or 0) * self.weight
    end,
    create_card = function(self, card, i)
        local card_params = {
            set = "aij_astral",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "sidereal_pack" ,
        }
        local _card = SMODS.create_card(card_params)
        return _card
    end,
    group_key = "k_aij_sidereal_packs",
    kind = "aij_sidereal",
}
local sidereal_jumbo = {
    object_type = "Booster",
    order = 1,
    key = 'sidereal_jumbo', 
    atlas = 'booster_atlas', 
    pos = { x = 0, y = 4 }, 
    cost = 6, 
    weight = 0.3, 
    config = { extra = 5, choose = 1 }, 
    discovered = false, 
    unlocked = true,
}
local sidereal_mega = {
    object_type = "Booster",
    order = 1,
    key = 'sidereal_mega', 
    atlas = 'booster_atlas', 
    pos = { x = 2, y = 4 }, 
    cost = 8, 
    weight = 0.07, 
    config = { extra = 5, choose = 2 }, 
    discovered = false, 
    unlocked = true,
}

local boosters_to_inject = {}

local standard_count = 4
local jumbo_count = 2
local mega_count = 2

for i = 1, standard_count do
    local new_booster = copy_table(sidereal_booster_base)

    new_booster.key = new_booster.key .. "_" .. i
    new_booster.pos.x = new_booster.pos.x + i - 1
    new_booster.weight = new_booster.weight / standard_count

    table.insert(boosters_to_inject, new_booster)
end
for i = 1, jumbo_count do
    local new_booster = copy_table(sidereal_booster_base)

    for k, v in pairs(sidereal_jumbo) do
        new_booster[k] = copy_table(v)
    end

    new_booster.key = new_booster.key .. "_" .. i
    new_booster.pos.x = new_booster.pos.x + i - 1
    new_booster.weight = new_booster.weight / jumbo_count

    table.insert(boosters_to_inject, new_booster)
end
for i = 1, mega_count do
    local new_booster = copy_table(sidereal_booster_base)

    for k, v in pairs(sidereal_mega) do
        new_booster[k] = copy_table(v)
    end

    new_booster.key = new_booster.key .. "_" .. i
    new_booster.pos.x = new_booster.pos.x + i - 1
    new_booster.weight = new_booster.weight / mega_count

    table.insert(boosters_to_inject, new_booster)
end

return { 
    name = {"Boosters"}, 
    items = boosters_to_inject
}
