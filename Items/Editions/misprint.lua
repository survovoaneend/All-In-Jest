local misprint_shader = {
    object_type = "Shader",
    key = 'misprint', 
    path = 'misprint.fs',
    send_vars = function(sprite, card)
        local temp = nil
        if card.children and card.children.center and card.children.center.scale then
            temp = card.children.center.scale.x
        end
        return {
            card_x = temp,
        }
    end
}
SMODS.Sound {
  key = 'misprint',
  path = 'misprinted.mp3'
}

local aij_precision_fix = function(card, x) --hopefully fixes precision
    local n = 4
    local snapped = (x >= 0 and math.floor(x * n + 0.5) or math.ceil(x * n - 0.5)) / n

    if snapped < (card.edition.min_mult * 0.01) then return (card.edition.min_mult * 0.01) end
    if snapped > (card.edition.max_mult * 0.01) then return (card.edition.max_mult * 0.01) end
    return snapped
end

local misprint = {
    object_type = "Edition",
    key = 'misprint', 
    sound = {
        sound = 'aij_misprint',
        per = 1,
        vol = 0.7
    },
    order = 3,
    config = { min_mult = 50, max_mult = 300, mult = 1, prevmult = "1" },
    attributes = {'multiplier'},
    disable_base_shader = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'misprinted_credits_info'}
        return { vars = { ((card.edition or {}).max_mult or self.config.max_mult) * 0.01, ((card.edition or {}).min_mult or self.config.min_mult) * 0.01 } }
    end,
    on_apply = function(card)

        -- if card.edition and card.edition.key == "e_aij_misprint" then
        --     if card.children.front then
        --         local atlas = card.children.front.atlas or SMODS.get_atlas("cards_1")
        --         card.children.front.atlas = misprint_atlas(atlas)
        --     end
        --     if card.children.center then
        --         local atlas = card.children.center.atlas or SMODS.get_atlas("centers")
        --         card.children.center.atlas = misprint_atlas(atlas, card.children.center.scale.x, 0)
        --     end
        -- end

        if not card.ability.jest_misprint_active then
            if card.ability.set == 'Enhanced' or card.ability.set == 'Default' then
                if card.added_to_deck then
                    card:remove_from_deck(true)
                    card.added_to_deck = true
                end
                jest_ability_calculate(
                    card,
                    "*", card.edition.mult,
                    { 
                        h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true,
                        bonus_x_score = 1, bonus_h_x_score = 1, bonus_x_blind_size = 1, bonus_h_x_blind_size = 1 -- latest SMODS stuff
                    },
                    nil, true, false, "ability"
                )
                if card.added_to_deck then
                    card.added_to_deck = false
                    card:add_to_deck(true)
                end
            elseif card.ability.set == 'Joker' and (card.config.center.dongtong_compat == nil or card.config.center.dongtong_compat) then
                if card.added_to_deck then
                    card:remove_from_deck(true)
                    card.added_to_deck = true
                end
                jest_ability_calculate(
                    card,
                    "*", card.edition.mult,
                    { 
                        h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true,
                        bonus_x_score = 1, bonus_h_x_score = 1, bonus_x_blind_size = 1, bonus_h_x_blind_size = 1 -- latest SMODS stuff
                    },
                    nil, true, false, "ability.extra"
                )
                if card.added_to_deck then
                    card.added_to_deck = false
                    card:add_to_deck(true)
                end
            end
        end
        card.ability.jest_misprint_active = true
    end,
    on_remove = function(card)

        -- if card.children.front then
        --     local _atlas, _pos = get_front_spriteinfo(_front)
        --     card.children.front.atlas = _atlas
        --     card.children.front:set_sprite_pos(_pos)
        -- end
        -- if card.children.center then
        --     local atlas_name = card.config.center.atlas
        --     card.children.center.atlas = SMODS.get_atlas("atlas_name")
        -- end

        if card.ability.set == 'Enhanced' or card.ability.set == 'Default' then
            if card.added_to_deck then
                card:remove_from_deck(true)
                card.added_to_deck = true
            end
            jest_ability_calculate(
                card,
                "/", card.edition.mult,
                { 
                    h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true,
                    bonus_x_score = 1, bonus_h_x_score = 1, bonus_x_blind_size = 1, bonus_h_x_blind_size = 1 -- latest SMODS stuff
                },
                nil, true, false, "ability"
            )
            if card.added_to_deck then
                card.added_to_deck = false
                card:add_to_deck(true)
            end
        elseif card.ability.set == 'Joker' and (card.config.center.dongtong_compat == nil or card.config.center.dongtong_compat) then
            if card.added_to_deck then
                card:remove_from_deck(true)
                card.added_to_deck = true
            end
            jest_ability_calculate(
                card,
                "/", card.edition.mult,
                { 
                    h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true,
                    bonus_x_score = 1, bonus_h_x_score = 1, bonus_x_blind_size = 1, bonus_h_x_blind_size = 1 -- latest SMODS stuff
                },
                nil, true, false, "ability.extra"
            )
            if card.added_to_deck then
                card.added_to_deck = false
                card:add_to_deck(true)
            end
        end
        card.ability.jest_misprint_active = nil
    end,
    calculate = function(self, card, context)
		if context.before then --context.after causes problems
            local value = pseudorandom('jest_misprint_mult', card.edition.min_mult, card.edition.max_mult) * 0.01
            card.edition.mult = aij_precision_fix(card, value)
        end
        if context.after then
            local string = tostring(card.edition.mult*100).."%"
            return {
                message = string,
            }
		end
	end,

    in_shop = true,
    weight = 3,
    extra_cost = 4,
    get_weight = function(self)
        return self.weight
    end,

    shader = 'misprint'
}

-- Reapply misprint whenever the current multiplier changes
local aij_card_update_ref = Card.update
function Card:update(dt)
  local ref = aij_card_update_ref(self, dt)

  if self.edition and self.edition.aij_misprint and (self.ability.set == 'Enhanced' or self.ability.set == 'Default' or self.ability.set == 'Joker') then
    if tonumber(self.edition.prevmult) ~= self.edition.mult then
      if self.ability.set == 'Enhanced' or self.ability.set == 'Default' then
        if self.added_to_deck then
          self:remove_from_deck(true)
          self.added_to_deck = true
        end
        jest_ability_calculate(
          self,
          "/", tonumber(self.edition.prevmult),
          { 
            h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true,
            bonus_x_score = 1, bonus_h_x_score = 1, bonus_x_blind_size = 1, bonus_h_x_blind_size = 1 -- latest SMODS stuff
          },
          nil, true, false, "ability"
        )
        jest_ability_calculate(
          self,
          "*", self.edition.mult,
          { 
            h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true,
            bonus_x_score = 1, bonus_h_x_score = 1, bonus_x_blind_size = 1, bonus_h_x_blind_size = 1 -- latest SMODS stuff
          },
          nil, true, false, "ability"
        )
        if self.added_to_deck then
          self.added_to_deck = false
          self:add_to_deck(true)
        end
      elseif self.ability.set == 'Joker' then
        if self.added_to_deck then
          self:remove_from_deck(true)
          self.added_to_deck = true
        end
        jest_ability_calculate(
          self,
          "/", tonumber(self.edition.prevmult),
          { 
            h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true,
            bonus_x_score = 1, bonus_h_x_score = 1, bonus_x_blind_size = 1, bonus_h_x_blind_size = 1 -- latest SMODS stuff
          },
          nil, true, false, "ability.extra"
        )
        jest_ability_calculate(
          self,
          "*", self.edition.mult,
          { 
            h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true,
            bonus_x_score = 1, bonus_h_x_score = 1, bonus_x_blind_size = 1, bonus_h_x_blind_size = 1 -- latest SMODS stuff
          },
          nil, true, false, "ability.extra"
        )
        if self.added_to_deck then
          self.added_to_deck = false
          self:add_to_deck(true)
        end
      end
      self.edition.prevmult = tostring(self.edition.mult)
    end
  end

  return ref
end

-- Setting a new ability will set base values without triggering misprint's multiplication
-- We set prevmult to 1 to trigger the Card:update() routine
local aij_card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    local ret = aij_card_set_ability_ref(self, center, initial, delay_sprites)

    if self.edition and self.edition.aij_misprint and self.ability.set == "Joker" then
        self.edition.prevmult = tostring(1)
    end

    return ret
end

function process_texture_misprint(image, card_width, front)
    local width, height = image:getDimensions()
    local canvas = love.graphics.newCanvas(width, height, {type = '2d', readable = true, dpiscale = image:getDPIScale()})

    love.graphics.push("all")

    love.graphics.setCanvas( canvas )
    love.graphics.clear({1, 1, 1, 0})
    
    love.graphics.setColor(1, 1, 1, 1)

    G.SHADERS['aij_misprint_spritesheet']:send("image_dims", {image:getDimensions()})
    G.SHADERS['aij_misprint_spritesheet']:send("card_x", card_width or 71)
    G.SHADERS['aij_misprint_spritesheet']:send("front", front or 1)
    love.graphics.setShader( G.SHADERS['aij_misprint_spritesheet'] )
    
    -- Draw image with misprint shader on new canvas
    love.graphics.draw( image )

    love.graphics.pop()

    image_data = canvas:newImageData()

    return love.graphics.newImage(image_data, {mipmaps = true, dpiscale = image:getDPIScale()}), image_data
end

function pre_misprinted(a, card_width, front)
    local atlas = a.name or a.key
    local name = atlas.."_misprinted" .. card_width .. front
    if SMODS.get_atlas(name) then
        return {
            old_name = atlas,
            new_name = name,
            atlas = SMODS.get_atlas(name),
        }
    else
        return {
            old_name = atlas,
            new_name = name,
            atlas = nil
        }
    end
end

function misprint_atlas(a, card_width, front)

    local card_width = card_width or 71
    local front = front or 1

    local misprinted = pre_misprinted(a, card_width, front)

    if not misprinted.atlas then
        local atlas_type = a.atlas_table or "ASSET_ATLAS"
        G[atlas_type][misprinted.new_name] = {}
        SMODS.get_atlas(misprinted.new_name).misprint = true
        SMODS.get_atlas(misprinted.new_name).name = SMODS.get_atlas(misprinted.old_name).name .. "_misprinted" .. card_width .. front
        SMODS.get_atlas(misprinted.new_name).type = SMODS.get_atlas(misprinted.old_name).type
        SMODS.get_atlas(misprinted.new_name).px = SMODS.get_atlas(misprinted.old_name).px
        SMODS.get_atlas(misprinted.new_name).py = SMODS.get_atlas(misprinted.old_name).py
        SMODS.get_atlas(misprinted.new_name).frames = SMODS.get_atlas(misprinted.old_name).frames

        image, image_data = process_texture_misprint(SMODS.get_atlas(misprinted.old_name).image, card_width, front)
        SMODS.get_atlas(misprinted.new_name).image = image
        SMODS.get_atlas(misprinted.new_name).image_data = image_data
    end

    return SMODS.get_atlas(misprinted.new_name)
end

return {name = "Editions", items = {misprint}}