local helpers = require("utils.luasnip-helper")
local get_visual = helpers.get_visual
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s(
		{ trig = "new", snippetType = "autosnippet" },
		fmta(
			[[
	\begin{<>}
	<>
	\end{<>}
	]],
			{
				i(1),
				d(2, get_visual),
				rep(1),
			}
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "nn", snippetType = "autosnippet" },
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
	s(
		{ trig = "ss", snippetType = "autosnippet" },
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
	s(
		{ trig = "all", snippetType = "autosnippet" },
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
		{ condition = line_begin }
	),
	s(
		{ trig = "itt", snippetType = "autosnippet" },
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
		{ condition = line_begin }
	),
	s(
		{ trig = "enn", snippetType = "autosnippet" },
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
		{ condition = line_begin }
	),
	s(
		{ trig = "([^%l])mm", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>$<>$", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
		})
	),
	s(
		{ trig = "fig", dscr = "Insert a LaTeX figure environment" },
		fmta(
			[[
	\begin{figure}[htbp]
	\centering
	\includegraphics[width=<>]{<>}
	\caption{<>}
	\label{fig:<>}
	\end{figure}
	]],
			{
				i(1, "\\textwidth"), -- Node 1: Image width (default \textwidth)
				i(2, "filename.png"), -- Node 2: Filename
				i(3, "Caption text"), -- Node 3: Caption
				f(function(args)
					-- Generate a label based on the caption text (node 3)
					local caption = args[1][1] or ""
					-- Simple function to convert caption to a basic label slug
					return caption:gsub("%s+", "_"):gsub("[^%w_]", ""):lower()
				end, { 3 }), -- Function node that depends on node 3
			}
		)
	),
}
