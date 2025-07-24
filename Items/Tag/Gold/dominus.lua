local dominus_tag = {
    object_type = "Tag",
    key = 'dominus',

    pos = { x = 6, y = 3 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'boss',
        },
    },

    discovered = false,
    order = 9,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        return {vars = {}}
    end,

    apply = function(self, tag, context)
        if context.type == 'round_start_bonus' and G.GAME.blind.boss and not G.GAME.blind.disabled then
            tag:yep('+', G.C.DARK_EDITION, function()
                return true
            end)

            G.GAME.blind:disable()
            G.GAME.blind.mult = 1
            G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.blind.mult*G.GAME.starting_params.ante_scaling
            G.GAME.blind.chip_text = G.GAME.blind.chips

            tag.triggered = true
            return true
        end
    end,
}
return {name = "Tags", items = {dominus_tag}}