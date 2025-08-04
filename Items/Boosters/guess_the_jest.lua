

local guess_the_jest = {
    object_type = "Booster",
    order = 67,
    key = 'guess_the_jest', 
    atlas = 'booster_atlas', 
    pos = { x = 0, y = 0 }, 
    cost = 20, 
    weight =  0.05, 
    config = { extra = 3, choose = 1 }, 
    discovered = false, 
    unlocked = true, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
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
    get_weight = function(self)
        local has_whatsisname = next(SMODS.find_card("j_aij_whatsisname"))
        if has_whatsisname then
            return 0.15
        else
            return 0.05
        end
        
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
        end
        return _card
    end,
    group_key = "k_aij_guess_the_jest",
}
SMODS.DrawStep {
    key = 'guess_the_jest_background',
    order = 2,
    func = function(self, layer)
        
        if self.ability.set == 'Joker' and self.ability.from_guess_the_jest then
        G.AIJ.shared_mystery_sprites['bg'..self.ability.background].role.draw_major = self
        G.AIJ.shared_mystery_sprites['bg'..self.ability.background]:draw_shader('dissolve', nil, nil, nil, self.children.center)
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}
SMODS.DrawStep {
    key = 'silhouette',
    order = 65,
    func = function(self, layer)
        local scale_mod = 0.07 + 0.02*math.sin(1.8*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
            local rotate_mod = 0.05*math.sin(1.219*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
        if self.config.center.soul_pos and self.ability.from_guess_the_jest then
            self.children.floating_sprite:draw_shader('aij_silhouette', nil, self.ARGS.send_to_shader, nil, self.children.center, scale_mod, rotate_mod)
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}
return { name = {"Boosters"}, items = {guess_the_jest} }
