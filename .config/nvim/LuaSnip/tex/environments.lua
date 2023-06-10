local helpers = require('utils.luasnip-helper')
local get_visual = helpers.get_visual
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  s({trig="new", snippetType="autosnippet"},
    fmta(
      [[
	\begin{<>}
	  <>
	\end{<>}
      ]],
      {
	i(1),
	d(2, get_visual),
	rep(1)
      }
    ),
    { condition = line_begin }
  ),
  s({trig="nn", snippetType="autosnippet"},
    fmta(
      [[
	\begin{equation*}
	  <>
	\end{equation*}
      ]],
      {
	i(1),
      }
    ),
    { condition = line_begin }
  ),
  s({trig="ss", snippetType="autosnippet"},
    fmta(
      [[
	\begin{equation*}
	  \begin{split}
	    <>
	  \end{split}
	\end{equation*}
      ]],
      {
	i(1),
      }
    ),
    { condition = line_begin }
  ),
  s({trig="all", snippetType="autosnippet"},
    fmta(
      [[
	\begin{align*}
	  <>
	\end{align*}
      ]],
      {
	i(1),
      }
    ),
    {condition = line_begin}
  ),
  s({trig="itt", snippetType="autosnippet"},
    fmta(
      [[
	  \begin{itemize}
	    \item <>
	  \end{itemize}
      ]],
      {
	i(0),
      }
    ),
    {condition = line_begin}
  ),
  s({trig="enn", snippetType="autosnippet"},
    fmta(
      [[
	  \begin{enumerate}
	    \item <>
	  \end{enumerate}
      ]],
      {
	i(0),
      }
    ),
    {condition = line_begin}
  ),
  s({trig="([^%l])mm", regTrig=true, wordTrig=false, snippetType="autosnippet"},
    fmta(
      "<>$<>$",
      {
	f(function(_, snip) return snip.captures[1] end ),
	i(1),
      }
    )
  ),
}
