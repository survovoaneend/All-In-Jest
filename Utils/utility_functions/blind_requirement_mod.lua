
-- Increases blind requirement while making the score tick up with an animation
-- mod_mult increases the mult of the blind (so mod_mult = 1 makes a blind go from x2 to x3)
-- mod_add increases the blind requirement directly. This occurs after mod_add
-- "Ticking up" animate code copied + modified from Bunco
function All_in_Jest.ease_blind_requirement(mod_mult, mod_add, skip_animation)
    if not G.GAME.blind.in_blind then return end

    local original_chips = G.GAME.blind.aij_original_chips > 0 and G.GAME.blind.aij_original_chips or G.GAME.blind.chips
    if mod_mult == nil then
        mod_mult = 0
    end
    if mod_add == nil then
        mod_add = 0
    end

    local original_mult = G.GAME.blind.aij_original_mult
    local previously_added = G.GAME.blind.aij_added_chips -- Only accounts chips added via mod_add
    local current_mult = All_in_Jest.get_current_blind_mult() -- Takes into account previous ease_blind_requirement calls
    local desired_chip_amount = (original_chips / original_mult) * (current_mult + mod_mult) + mod_add + previously_added
    if desired_chip_amount > original_chips and (#SMODS.find_card('j_aij_fall_of_count_chaligny') > 0) then
        local card = SMODS.find_card('j_aij_fall_of_count_chaligny')[1]
        card:juice_up()
        play_sound('tarot2', 0.76, 0.4)
        return
    end

    local chip_mod -- Calculate how much the chips count changes each "tick", set to iterate over ~120 ticks
    if type(G.GAME.blind.chips) ~= 'table' then
        chip_mod = math.ceil(math.abs(desired_chip_amount - G.GAME.blind.chips) / 120)
    else
        chip_mod = ((desired_chip_amount - G.GAME.blind.chips):abs() / 120):ceil()
    end
    local step = 0

    local chips_text_integer = G.GAME.blind.chips -- Used to track animation
    if not skip_animation then
        G.BLIND_SIZE_DISPLAY_QUEUE = G.BLIND_SIZE_DISPLAY_QUEUE or {}

        if chips_text_integer < desired_chip_amount then
            while chips_text_integer < desired_chip_amount do
                table.insert(G.BLIND_SIZE_DISPLAY_QUEUE, chips_text_integer)
                chips_text_integer = chips_text_integer + G.SETTINGS.GAMESPEED * chip_mod
            end
        else
            while chips_text_integer < desired_chip_amount do
                table.insert(G.BLIND_SIZE_DISPLAY_QUEUE, chips_text_integer)
                chips_text_integer = chips_text_integer - G.SETTINGS.GAMESPEED * chip_mod
            end
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blocking = true,
            func = function()
                if #G.BLIND_SIZE_DISPLAY_QUEUE > 0 then
                    table.remove(G.BLIND_SIZE_DISPLAY_QUEUE, 1)
                    if step % 5 == 0 then
                        play_sound('chips1', 0.8 + (step * 0.005))
                    end
                    step = step + 1
                else
                    G.GAME.blind:wiggle()
                    return true
                end
            end
        }))

    end

    G.GAME.blind.chips = desired_chip_amount -- Immediately set in case this function is called successively
    G.GAME.blind.aij_added_chips = G.GAME.blind.aij_added_chips + mod_add
end

-- Redisplays the blind info on the blind select screen
-- Used to update dynamic score requirements
function All_in_Jest.aij_refresh_boss_blind()
    if G.GAME.blind.boss then return end

    if G.blind_select_opts then
        local par = G.blind_select_opts.boss.parent
        if par and par.config.object then
            G.blind_select_opts.boss:remove()
            G.blind_select_opts.boss = UIBox{
                T = {par.T.x, 0, 0, 0},
                definition = { n = G.UIT.ROOT, config = { align = "cm", colour = G.C.CLEAR }, nodes = {
                  UIBox_dyn_container({ create_UIBox_blind_choice('Boss') }, false, get_blind_main_colour('Boss'), mix_colours(G.C.BLACK, get_blind_main_colour('Boss'), 0.8))
                } },
                config = {
                    align = "bmi",
                    offset = {
                        x = 0,
                        y = G.blind_select_opts.boss.alignment.offset.y
                    },
                    major = par,
                    xy_bond = 'Weak'
                }
            }
            par.config.object = G.blind_select_opts.boss
            par.config.object:recalculate()
            G.blind_select_opts.boss.parent = par
            -- G.blind_select_opts.boss.alignment.offset.y = -0.2
        end
    end

    if G.SHOP_SIGN and next(SMODS.find_mod("unBlindShopGUI")) then
        G.SHOP_SIGN:remove()
        G.SHOP_SIGN = UIBox{
          definition = 
            {n=G.UIT.ROOT, config = {colour = G.C.CLEAR, align = 'bm' }, nodes={
              G.UIDEF.UnBlind_current_blinds()
            }},
          config = {
            align="cm",
            offset = {x=0,y=0},
            major = G.HUD:get_UIE_by_ID('row_blind'),
            bond = 'Weak'
          }
        }
    end
end


-- Automatically saves G.GAME.blind.aij_original_chips when blind is loaded
local aij_blind_set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    if blind and not reset then
        self.aij_original_chips = get_blind_amount(G.GAME.round_resets.ante)*blind.mult*G.GAME.starting_params.ante_scaling
        self.aij_original_mult = blind.mult
        self.aij_added_chips = 0
    end
    local ret = aij_blind_set_blind_ref(self, blind, reset, silent)
    return ret
end

-- Handle original chips when game is saved and reloaded
local aij_blind_save_ref = Blind.save
function Blind:save()
    local blindTable = aij_blind_save_ref(self)
    blindTable.aij_original_chips = self.aij_original_chips
    blindTable.aij_original_mult = self.aij_original_mult
    blindTable.aij_added_chips = self.aij_added_chips
    return blindTable
end
local aij_blind_load_ref = Blind.load
function Blind:load(blindTable)
    local ret = aij_blind_load_ref(self, blindTable)
    self.aij_original_chips = blindTable.aij_original_chips
    self.aij_original_mult = blindTable.aij_original_mult
    self.aij_added_chips = blindTable.aij_added_chips
    ease_background_colour_blind(G.STATE, self.name or 'Small Blind') -- For The Journey blind
    return ret
end