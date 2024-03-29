" Vim syntax file
" Language:	Smarty Templates
" Maintainer:	Manfred Stienstra manfred.stienstra@dwerg.net
" Last Change:  Mon Nov  4 11:42:23 CET 2002
" Filenames:    *.tpl
" URL:		http://www.dwerg.net/projects/vim/smarty.vim

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
  finish
endif
  let main_syntax = 'smarty'
endif

syn case ignore

runtime! syntax/html.vim
"syn cluster htmlPreproc add=smartyUnZone

syn match smartyBlock contained "[\[\]]"

syn keyword smartyTagName capture config_load include include_php
syn keyword smartyTagName insert if elseif else ldelim rdelim literal
syn keyword smartyTagName php section sectionelse foreach foreachelse
syn keyword smartyTagName strip assign counter cycle debug eval fetch
syn keyword smartyTagName html_options html_select_date html_select_time
syn keyword smartyTagName math popup_init popup html_checkboxes html_image
syn keyword smartyTagName html_radios html_table mailto textformat

syn keyword smartyModifier cat capitalize count_characters count_paragraphs
syn keyword smartyModifier count_sentences count_words date_format default
syn keyword smartyModifier escape indent lower nl2br regex_replace replace
syn keyword smartyModifier spacify string_format strip strip_tags truncate
syn keyword smartyModifier upper wordwrap

syn keyword smartyInFunc neq eq

syn keyword smartyProperty contained "file="
syn keyword smartyProperty contained "loop="
syn keyword smartyProperty contained "name="
syn keyword smartyProperty contained "include="
syn keyword smartyProperty contained "skip="
syn keyword smartyProperty contained "section="

syn keyword smartyConstant "\$smarty"

syn keyword smartyDot .

syn region smartyZone matchgroup=Delimiter start="{%" end="%}" contains=smartyProperty, smartyString, smartyBlock, smartyTagName, smartyConstant, smartyInFunc, smartyModifier

syn region  htmlString   contained start=+"+ end=+"+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,smartyZone
syn region  htmlString   contained start=+'+ end=+'+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,smartyZone
  syn region htmlLink start="<a\>\_[^>]*\<href\>" end="</a>"me=e-4 contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,javaScript,@htmlPreproc,smartyZone


if version >= 508 || !exists("did_smarty_syn_inits")
  if version < 508
    let did_smarty_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink smartyTagName Identifier
  HiLink smartyProperty Constant
  " if you want the text inside the braces to be colored, then
  " remove the comment in from of the next statement
  "HiLink smartyZone Include
  HiLink smartyInFunc Function
  HiLink smartyBlock Constant
  HiLink smartyDot SpecialChar
  HiLink smartyModifier Function
  delcommand HiLink
endif

let b:current_syntax = "smarty"

if main_syntax == 'smarty'
  unlet main_syntax
endif

" Taken form HTML.vim in vim runtime files
if exists("loaded_matchit")
  let b:match_ignorecase = 1
  let b:match_words = '<:>,' .
  \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
  \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
  \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif

" vim: ts=8
