G.E_MANAGER.queues.jimbo_legendary_queue = {}

function Card:add_speech_bubble(text_key, align, loc_vars, quip_args)
    if quip_args and quip_args.text_key then text_key = quip_args.text_key end
    if self.children.speech_bubble then self.children.speech_bubble:remove() end
    self.config.speech_bubble_align = {align=align or 'bm', offset = {x=0,y=0},parent = self}
    self.children.speech_bubble = UIBox{
        definition = G.UIDEF.speech_bubble(text_key, loc_vars),
        config = self.config.speech_bubble_align
    }
    self.children.speech_bubble:set_role{
        role_type = 'Minor',
        xy_bond = 'Weak',
        r_bond = 'Weak',
        major = self,
    }
    self.children.speech_bubble.states.visible = false
end
Card.remove_speech_bubble = Card_Character.remove_speech_bubble
function Card:say_stuff(n, not_first, quip_key)
    local quip = SMODS.JimboQuips[quip_key] or {}
    self.talking = true
    if not not_first then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                if self.children.speech_bubble then self.children.speech_bubble.states.visible = true end
                self:say_stuff(n, true, quip_key)
                return true
            end
        }))
    else
        if n <= 0 then
            self.talking = false; return
        end
        local new_said = math.random(1, 11)
        while new_said == self.last_said do
            new_said = math.random(1, 11)
        end
        self.last_said = new_said
        if quip.play_sounds and type(quip.play_sounds) == 'function' then
            quip:play_sounds(n)
        elseif quip.extra and quip.extra.sound then
            local custom_pitch = quip.extra.pitch
            if type(quip.extra.sound) == 'table' then
                for k, v in pairs(quip.extra.sound) do
                    play_sound(v, custom_pitch or (math.random() * 0.2 + 1), 0.5)
                end
            elseif type(quip.extra.sound) == 'string' then
                play_sound(quip.extra.sound, custom_pitch or (math.random() * 0.2 + 1), 0.5)
            else
                play_sound('voice' .. math.random(1, 11), custom_pitch or (math.random() * 0.2 + 1), 0.5)
            end
        else
            play_sound('voice' .. math.random(1, 11), quip.extra and quip.extra.pitch or (math.random() * 0.2 + 1), 0.5)
        end
        local juice_params = quip.extra and quip.extra.juice or { nil, nil }
        self:juice_up(juice_params[1], juice_params[2])
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blockable = false,
            blocking = false,
            delay = quip.extra and quip.extra.delay or 0.13,
            func = function()
                self:say_stuff(n - 1, true, quip_key)
                return true
            end
        }), 'jimbo_legendary_queue')
    end
end

AIJJokerQuip = Object:extend()

local jimbo_say_stuff = function(card, quips)
    for i = 1, #quips do
        G.E_MANAGER:add_event(Event({
            trigger = i == 1 and "immediate" or "after",
            delay = i == 1 and 0.1 or (5 * G.SPEEDFACTOR),
            func = function ()
                card:add_speech_bubble(quips[i], nil, {quip = true})
                card:say_stuff(5)
                return true
            end
        }), "jimbo_legendary_queue")
    end

    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 5 * G.SPEEDFACTOR,
        func = function ()
            if not card.talking then
                card:remove_speech_bubble()
                return true
            end
        end
    }), "jimbo_legendary_queue")
end

local jimbo_legendary = {
    object_type = "Joker",
    order = 9999,

    key = "jimbo",
    config = {
        mult = 4
    },
    rarity = 4,
    unlock_condition = { hidden = true },
    pos = { x = 0, y = 0 },
    atlas = 'legendary_jimbo_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 1, y = 0 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.mult
            }
        end

        if context.card_added then
            if context.card.ability.name == "j_aij_jimbo" then
                local quips = {"legendary_jimbo_clone_1", "legendary_jimbo_clone_2", "legendary_jimbo_clone_3", "legendary_jimbo_clone_4"}

                for i = 1, #quips do
                    G.E_MANAGER:add_event(Event({
                        trigger = i == 1 and "immediate" or "after",
                        delay = i == 1 and 0.1 or (5 * G.SPEEDFACTOR),
                        func = function ()
                            card:add_speech_bubble(quips[i], nil, {quip = true})
                            card:say_stuff(5)
                            if i == 3 then
                                context.card:add_speech_bubble(quips[i], nil, {quip = true})
                                context.card:say_stuff(5)
                            end
                            if i == 4 then
                                context.card:remove_speech_bubble()
                                SMODS.destroy_cards(context.card, true)
                            end
                            return true
                        end
                    }), "jimbo_legendary_queue")
                end

                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 5 * G.SPEEDFACTOR,
                    func = function ()
                        if not card.talking then
                            card:remove_speech_bubble()
                            return true
                        end
                    end
                }), "jimbo_legendary_queue")
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            if #SMODS.find_card("j_aij_jimbo") <= 0 then
                -- Only quip if there is no other Jimbo
                jimbo_say_stuff(card, {"legendary_jimbo_added_1", "legendary_jimbo_added_2"})
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
    end,

}

return { name = { "Jokers" }, items = { jimbo_legendary } }
