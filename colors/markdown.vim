hi clear Normal
set bg&
set background=light
highlight clear
if (exists("syntax_on"))
  syntax reset
endif
let g:colors_name="markdown"

hi Normal guibg=gray95
hi NonText guifg=gray95
hi FoldColumn guibg=gray95
hi CursorLine guibg=gray90
hi Title gui=bold guifg=gray25
hi MarkdownHeadingDelimiter gui=bold guifg=gray25
hi htmlSpecialChar guifg=black
hi markdownBold gui=bold guifg=gray25
hi markdownItalic guifg=gray25 gui=italic,underline
hi markdownUrl guifg=#2fb3a6
hi markdownAutomaticLink guifg=#2fb3a6
hi markdownLinkText guifg=#317849
hi markdownUrlTitle guifg=#317849
hi markdownBlockquote guifg=#317849 gui=bold
hi markdownId guifg=#2fb3a6
hi markdownIdDeclaration guifg=#317849 gui=bold
hi markdownListMarker guifg=#317849
hi markdownHeadingDelimiter guifg=#C4C4C4
hi markdownDelimiter guifg=#C4C4C4
hi markdownLinkDelimiter guifg=#C4C4C4
hi markdownLinkTextDelimiter guifg=#C4C4C4
hi markdownIdDelimiter guifg=#C4C4C4
highlight Cursor guibg=#15abdd
