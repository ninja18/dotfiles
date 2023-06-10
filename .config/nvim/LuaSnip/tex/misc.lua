local helpers = require('utils.luasnip-helper')
local get_visual = helpers.get_visual
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s({trig="h1", snippetType="autosnippet"}, -- Configure later: might need not mathzone condition
      fmta(
	[[\section{<>}]],
	{
	  d(1, get_visual),
	}
      )
    ),
    s({trig="h2", snippetType="autosnippet"}, -- Configure later: might need not mathzone condition
      fmta(
	[[\subsection{<>}]],
	{
	  d(1, get_visual),
	}
      )
    ),
    s({trig="h3", snippetType="autosnippet"}, -- Configure later: might need not mathzone condition
      fmta(
	[[\subsubsection{<>}]],
	{
	  d(1, get_visual),
	}
      )
    ),
    s({trig = "template"},
      fmta(
        [[
\documentclass[a4paper]{report}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{textcomp}
\usepackage{amsmath, amssymb,amsfonts}
\usepackage{titlesec}
\usepackage{enumitem}
\usepackage{graphicx}
\usepackage{caption}
\usepackage{subcaption}
\usepackage{geometry}
\geometry{margin=0.75in}
\graphicspath{{./figures/}}

% figure support
\usepackage{import}
\usepackage{xifthen}
\pdfminorversion=7
\usepackage{pdfpages}
\usepackage{transparent}
\newcommand{\incfig}[2][1]{%
    \def\svgwidth{#1\columnwidth}
    \import{./figures/}{#2.pdf_tex}
}
\pdfsuppresswarningpagegroup=1

% proof theorem env
\usepackage{amsthm}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{corollary}{Corollary}[theorem]
\newtheorem{lemma}[theorem]{Lemma}

\titleformat
{\chapter} % command
[display] % shape
{\bfseries\Large\itshape} % format
{\thechapter} % label
{0.5ex} % sep
{
    \rule{\textwidth}{1pt}
    \vspace{1ex}
    \centering
} % before-code
[
\vspace{-0.5ex}%
\rule{\textwidth}{0.3pt}
] % after-code

\begin{document}
  <>
\end{document}
      ]],
        {
          i(0)
        }
      ),
      { condition = line_begin }
    ),
}
