" Vim syntax file
" Language:     mkb-creole
" Maintainer:   Peter Hoffmann <ph@peter-hoffmann.com> (orig base creole syntax)
"               Daniel Bartholomew <db@dbart.us> (mkb-creole additions)

" This syntax file was based on the wiki.vim syntax file from Andreas Kneib
" It's been changed a **LOT** since then

" To use this syntax file:
" 1. mkdir ~/.vim/syntax
" 2. mv mkb-creole.vim ~/.vim/syntax/mkb-creole.vim
" 3. :set syntax=mkb-creole

"Some hints to extend wiki creole editing
"set path=.,~/mkb/
"au BufRead,BufNewFile *.creole,*.mkb-creole,*.mkb setfiletype mkb-creole

" Quit if syntax file is already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version < 508
  command! -nargs=+ WikiHiLink hi link <args>
else
  command! -nargs=+ WikiHiLink hi def link <args>
endif

syn match   wikiLine        "^----$"
"TODO add different markup for [[link|name]] type of links
syn region  wikiLink        start=+\[\[+hs=s+2 end=+\]\]+he=e-2
syn region  wikiLink        start="https\?:\/\/" end="[\n\r\t ]"he=e-1
syn match   wikiList        "^[\*]\+ "
syn match   wikiList        "^[#]\+[\.[0-9]*]\? "
syn region  wikiCurly       start="{\{3\}" end="}\{3\}"
syn region  wikiHead        start="^=" end="$" contains=wikiTT
"syn region  wikiSubhead     start="^== " end="$"
"TODO add fancier syntax for tables

"try to not get confused with wikiLink
"syn region  wikiBold        start="\*\*[^ ]" end="\*\*"
syn region  wikiBold        start="\*\*[^\* ]" end="\*\*" contains=wikiBoldItalic
"try to not get confused with urls such as http://example.com
"syn region  wikiItalic      start="[^:]\/\/"hs=s+1   end="[^:]\/\/"
syn region  wikiItalic      start="[^:]\/\/"   end="[^:]\/\/" contains=wikiItalicBold
syn region  wikiUnderline   start="__" end="__"

" strikeout syntax was removed from mkb-creole as it interferred with MariaDB
" option names, so the following line is now commented out:
"syn region  wikiStrike      start="--" end="--"

" regions for Bold and Italic with embedded Italic and Bold
syn region wikiBoldItalic   contained start=+[^:]\/\/+ end=+[^:]\/\/+
syn region wikiItalicBold   contained start=+\*\*[^\* ]+ end=+\*\*+

syn region  wikiTT        start="\#\#[^\# ]" end="\#\#"
syn region  macroString   contained start=+"+ end=+"+ contains=macroSpecialChar
syn region  macroString   contained start=+'+ end=+'+ contains=macroSpecialChar
syn match   macroValue    contained "=[\t ]*[^'" \t>][^ \t>]*"hs=s+1   contains=macroSpecialChar
syn region  macroEndTag            start=+<</+     end=+>>+ contains=macroTagN
syn region  macroTag               start=+<<[^/]+  end=+>>+ contains=macroTagN,macroString,macroArg,macroValue
syn match   macroTagN     contained +<\s*[-a-zA-Z0-9]\++hs=s+1 contains=macroTagName
syn match   macroTagN     contained +</\s*[-a-zA-Z0-9]\++hs=s+2 contains=macroTagName
syn region  macroCode              start="<<sql>>" end="<</sql>>"me=e-8 contains=macroTag,macroEndTag,macroSpecialChar
syn region  macroCode              start="<<code\_[^>]*>>" end="<</code>>"me=e-9 contains=macroTag,macroEndTag,macroSpecialChar
syn region  macroCode              start="<<fixed>>" end="<</fixed>>"me=e-10 contains=macroTag,macroEndTag,macroSpecialChar,wikiBold,wikiItalic,wikiUnderline
syn region  entityN                start="<<entity>>" end="<</entity>>"me=e-11 contains=macroTag,macroEndTag,entityName

" list start names
"
syn match listNone        "^[\*#]\+none "
syn match listDisc        "^[\*]\+disc "
syn match listCircle      "^[\*]\+circle "
syn match listSquare      "^[\*]\+square "
syn match listArmenian    "^[#]\+armenian[\.[0-9]*]\? "
syn match listDecimal     "^[#]\+decimal[\.[0-9]*]\? "
syn match listDecimalZ    "^[#]\+decimal-leading-zero[\.[0-9]*]\? "
syn match listGeorgian    "^[#]\+georgian[\.[0-9]*]\? "
syn match listLowerA      "^[#]\+lower-alpha[\.[0-9]*]\? "
syn match listLowerG      "^[#]\+lower-greek[\.[0-9]*]\? "
syn match listLowerL      "^[#]\+lower-latin[\.[0-9]*]\? "
syn match listLowerR      "^[#]\+lower-roman[\.[0-9]*]\? "
syn match listUpperA      "^[#]\+upper-alpha[\.[0-9]*]\? "
syn match listUpperL      "^[#]\+upper-latin[\.[0-9]*]\? "
syn match listUpperR      "^[#]\+upper-roman[\.[0-9]*]\? "

" entity names
syn keyword entityName contained mdash nbsp amp ldquo rdquo lsquo rsquo reg copy trade para bull middot sect ndash

" macro names
syn keyword macroTagName contained code fixed sql style toc include entity booknav button

" macro args
syn keyword macroArg contained lang inline indent style class slug prev toc chapter next target

" TODO expand macro names and args above so that only valid args for a given
"      macro are highlighted
"
" TODO highlight link text like a url
"
" TODO highlight button text like a url

" special characters
syn match macroSpecialChar "&#\=[0-9A-Za-z]\{1,8};"

" The default highlighting.
if version >= 508 || !exists("did_wiki_syn_inits")
  if version < 508
    let did_wiki_syn_inits = 1
  endif
  
WikiHiLink wikiCurly       Type
WikiHiLink wikiHead        Statement 
"  WikiHiLink wikiSubhead     PreProc
WikiHiLink wikiList        String
WikiHiLink wikiExtLink     Identifier
WikiHiLink wikiLink        Identifier
WikiHiLink wikiLine        PreProc

WikiHiLink macroTag                     Function
WikiHiLink macroEndTag                  Identifier
WikiHiLink macroArg                     Type
WikiHiLink macroTagName                 Statement
WikiHiLink entityName                   Type
" WikiHiLink macroSpecialTagName          Exception
WikiHiLink macroValue                   Constant
WikiHiLink macroString                  Constant
WikiHiLink listNone                     String
WikiHiLink listDisc                     String
WikiHiLink listCircle                   String
WikiHiLink listSquare                   String
WikiHiLink listArmenian                 String
WikiHiLink listDecimal                  String
WikiHiLink listDecimalZ                 String
WikiHiLink listGeorgian                 String
WikiHiLink listLowerA                   String
WikiHiLink listLowerG                   String
WikiHiLink listLowerL                   String
WikiHiLink listLowerR                   String
WikiHiLink listUpperA                   String
WikiHiLink listUpperL                   String
WikiHiLink listUpperR                   String
WikiHiLink macroSpecialChar             String
WikiHiLink macroCode                    PreProc
WikiHiLink wikiTT                       PreProc

" unused highlight types: Todo, Type, Constant, Comment, Special

hi def  wikiBold        term=bold cterm=bold gui=bold
hi def  wikiBoldItalic  term=bold,italic cterm=bold,italic gui=bold,italic
hi def  wikiItalic      term=italic cterm=italic gui=italic
hi def  wikiItalicBold  term=bold,italic cterm=bold,italic gui=bold,italic
hi def  wikiUnderline   term=underline cterm=underline gui=underline
hi def  wikiStrike      term=inverse cterm=inverse gui=inverse

endif

delcommand WikiHiLink

let b:current_syntax = "mkb-creole"

"EOF vim: tw=78:ft=vim:ts=2

