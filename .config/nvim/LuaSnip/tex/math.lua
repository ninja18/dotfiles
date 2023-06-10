local helpers = require('utils.luasnip-helper')
local get_visual = helpers.get_visual

local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

return {
  s({trig = "==", snippetType="autosnippet"},
    {
      t("&= "),
    },
    {condition = tex.in_mathzone}
  ),
  s({trig = "stm", snippetType="autosnippet"},
    {
      t("\\setminus "),
    }
  ),
  s({trig = "sbb", snippetType="autosnippet"},
    {
      t("\\subseteq "),
    }
  ),
  s({trig = "!sb", snippetType="autosnippet"},
    {
      t("\\nsubseteq "),
    }
  ),
  s({trig = "eqq", snippetType="autosnippet"},
    {
      t("\\equiv "),
    }
  ),
  s({trig = "px", snippetType="autosnippet"},
    {
      t("\\approx "),
    },
    {condition = tex.in_mathzone}
  ),
  s({trig = "xx", snippetType="autosnippet"},
    {
      t("\\times "),
    }
  ),
  s({trig = ">>", snippetType="autosnippet"},
    {
      t("\\implies "),
    }
  ),
  s({trig = "<<", snippetType="autosnippet"},
    {
      t("\\impliedby "),
    }
  ),
  s({trig = "([^%\\])sq", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sqrt{<>}",
      {
	f(function(_, snip) return snip.captures[1] end ),
	i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig = "!in", snippetType="autosnippet"},
    {
      t("\\notin "),
    },
    {condition = tex.in_mathzone}
  ),
  s({trig = "exx", snippetType="autosnippet"},
    {
      t("\\exists "),
    },
    {condition = tex.in_mathzone}
  ),
  s({trig = "!ex", snippetType="autosnippet"},
   {
      t("\\nexists "),
    },
    {condition = tex.in_mathzone}
  ),
  s({trig = "faa", snippetType="autosnippet"},
   {
      t("\\forall "),
    },
    {condition = tex.in_mathzone}
  ),
  s({trig = "([^%a])ff", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\frac{<>}{<>}",
      {
	f( function(_, snip) return snip.captures[1] end ),
	i(1),
	i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig = "cdd", snippetType="autosnippet"},
    {
      t("\\cdots"),
    }
  ),
  s({trig = "ldd", snippetType="autosnippet"},
    {
      t("\\ldots"),
    }
  ),
  -- INTEGRAL with upper and lower limit
  s({trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\int_{<>}^{<>}",
      {
	f( function(_, snip) return snip.captures[1] end ),
	i(1),
	i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- INTEGRAL from positive to negative infinity
  s({trig = "([^%a])intf", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\int_{\\infty}^{\\infty}",
      {
	f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUM with lower limit
  s({trig = "([^%a])sM", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sum_{<>}",
      {
	f( function(_, snip) return snip.captures[1] end ),
	i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUM with upper and lower limit
  s({trig = "([^%a])smm", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sum_{<>}^{<>}",
      {
	f( function(_, snip) return snip.captures[1] end ),
	i(1),
	i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
}
