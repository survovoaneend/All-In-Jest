SMODS.Joker {
    key = "petrushka",
    config = {
      
    },
    loc_txt = {
      name = "Petrushka",
      text ={
          "Gives {C:red}Mult{} equal to",
          "the total {C:attention}rank{} of",
          "all {C:attention}scored cards{}",
          "{C:inactive}(A=14, K=13, Q=12, J=11)"
      },
  },
    rarity = 2,
    pos = { x = 5, y = 4 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
     calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            local rank_sum = 0
    
            for _, scoring_card in ipairs(context.scoring_hand) do
                local rank_value = scoring_card:get_id()
                if rank_value > 0 then
                    rank_sum = rank_sum + rank_value
                end
            end

            if rank_sum > 0 then
                local mult_mod = math.floor(rank_sum)
                return {
                    mult= mult_mod,
                }
              end
        end

        return nil
    end
  }