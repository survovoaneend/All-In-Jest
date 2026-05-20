

local timelost_guess_the_jest = {
    object_type = "Booster",
    no_collection = true,
    key = 'timelost_guess_the_jest',
    atlas = 'booster_atlas',
    pos = { x = 0, y = 0 },
    cost = 0,
    weight =  0,
    config = { extra = 5, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra}, key = "p_aij_guess_the_jest" }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.SPECTRAL_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015, scale = 0.1, initialize = true, lifespan = 3, speed = 0.2,
            padding = -1, attach = G.ROOM_ATTACH, colours = {G.C.WHITE, lighten(G.C.GOLD, 0.2)}, fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local card_params = {
            set = "Joker",
            legendary = true,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append = "leg_guess" ,
            no_edition = true,
        }
        local _card = SMODS.create_card(card_params)
        if _card then
            _card.ability = _card.ability or {}
            _card.ability.from_guess_the_jest = true
            _card.ability.background = tostring(math.random(1,4))
            for k, v in pairs(G.shared_stickers) do
                if _card.ability[k] then
                    _card.ability[k] = false
                end
            end
            _card.ability.perishable = true
            _card.ability.perish_tally = G.GAME.perishable_rounds or 5
        end
        return _card
    end,
    group_key = "k_aij_guess_the_jest",
}

return { name = {"Boosters"}, items = {timelost_guess_the_jest} }
