local npairs = require('nvim-autopairs')
npairs.setup{}

-- add pair <> in *.rs
local Rule = require('nvim-autopairs.rule')
npairs.remove_rule('<')
npairs.add_rule(Rule("<", ">"))
