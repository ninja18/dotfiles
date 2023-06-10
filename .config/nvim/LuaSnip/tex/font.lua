local helpers = require('utils.luasnip-helper')
local get_visual = helpers.get_visual

local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

return {
  -- ITALIC i.e. \textit
  s({trig = "([^%a])tii", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\textit{<>}",
      {
	f( function(_, snip) return snip.captures[1] end ),
	d(1, get_visual),
      }
    )
  ),
  -- BOLD i.e. \textbf
  s({trig = "tbb", snippetType="autosnippet"},
    fmta(
      "\\textbf{<>}",
      {
	d(1, get_visual),
      }
    )
  ),
  -- MATH CALIGRAPHY i.e. \mathcal
  s({trig = "([^%a])mcc", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\mathcal{<>}",
      {
	f( function(_, snip) return snip.captures[1] end ),
	d(1, get_visual),
      }
    )
  ),
  -- MATH BOLDFACE i.e. \mathbf
  s({trig = "([^%a])mbf", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\mathbf{<>}",
      {
	f( function(_, snip) return snip.captures[1] end ),
	d(1, get_visual),
      }
    )
  ),
  -- MATH BLACKBOARD i.e. \mathbb
  s({trig = "([^%a])mbb", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\mathbb{<>}",
      {
	f( function(_, snip) return snip.captures[1] end ),
	d(1, get_visual),
      }
    )
  ),
  -- REGULAR TEXT i.e. \text (in math environments)
  s({trig = "([^%a])tee", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\text{<>}",
      {
	f( function(_, snip) return snip.captures[1] end ),
	i(1),
      }
    ),
    { condition = tex.in_mathzone }
  ),
}
