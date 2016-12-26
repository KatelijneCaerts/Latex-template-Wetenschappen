%%
%% UNOFFICIAL LATEX TEMPLATE FACULTY OF SCIENCE
%%
%% This template was adopted from the kulemt template made by Luc Van Eycken
%%
%% Copyright (C) 2010 by Luc Van Eycken <Luc.VanEycken@esat.kuleuven.be>
%%
%% Changed by:
%%   2016 - Gert-Jan Andries <info@gertjanandries.com>
%%   2016 - Katelijne Caerts <katelijne@caerts.be>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[2001/06/01]
\ProvidesClass{kulwet}
    [20136/19/12 v1.0
     KU Leuven science master thesis document class]
\def\kulwet@cls{kulwet}
\def\kulwet@error#1{%
  \ClassError\kulwet@cls{#1}{Exit, correct this error and rerun.}}
\def\kulwet@opt@missingpkg#1#2{\kulwet@error{%
    The option `#1' is ignored because\MessageBreak
    it requires the installation of the package `#2'}}
\def\kulwet@ifdutch{\protect\iflanguage{dutch}}
\@ifundefined{l@dutch}{\kulwet@error{%
    The language `dutch' is not available.\MessageBreak
    You must install Dutch hyphenation patterns}}{}
\def\kulwet@ifand#1{\expandafter\kulwet@ifand@ #1\and\@nil}
\def\kulwet@ifand@#1\and #2\@nil{%
  \if=\noexpand#2=\expandafter\@secondoftwo\else
    \expandafter\@firstoftwo\fi}
\RequirePackage{keyval}
\newcommand*\setup{%
  \kulwet@catcode@setup
  \kulwet@setup}
\@onlypreamble\setup
\def\kulwet@setup#1{%
  \setkeys{kulwet}{#1}%
  \kulwet@uncatcode@setup
  \kulwet@do@once@opts}
\def\kulwet@catcode@setup{%
  \csname extras\languagename\endcsname
  \kulwet@ifdutch{\catcode`\"\active}{}}
\def\kulwet@uncatcode@setup{%
  \csname noextras\languagename\endcsname
  \@makeother\"}
\def\kulwet@invalidate@key#1#2{%
  \define@key{kulwet}{#1}{\ClassWarning\kulwet@cls{%
      The key `#1' can only be used #2.\MessageBreak
      It is ignored}}}
\def\kulwet@keynovalue#1#2{%
  \define@key{kulwet}{#1}[]{%
    \def\@tempa{##1}\ifx\@tempa\@empty\else
      \PackageWarningNoLine\kulwet@cls{Value of option `#1' ignored}\fi
    #2}}
\def\kulwet@clskeys{}
\def\kulwet@clskey#1{%
  \edef\kulwet@clskeys{\kulwet@clskeys,#1}%
  \define@key{kulwet}{#1}}
\def\kulwet@clsopt#1{%
  \edef\kulwet@clskeys{\kulwet@clskeys,#1}%
  \kulwet@keynovalue{#1}}
\def\kulwet@process@ptions{%
  \@ifundefined{opt@\@currname.\@currext}{}%
   {\begingroup
    \toks@\expandafter\expandafter\expandafter{%
      \csname opt@\@currname.\@currext\endcsname}%
    \edef\CurrentOption{\the\toks@}%
    \toks@{}%
    \@for\CurrentOption:=\CurrentOption\do{%
      \@ifundefined{%
        KV@kulwet@\expandafter\kulwet@getkey\CurrentOption=\@nil}%
       {\ifx\@unusedoptionlist\@empty
          \global\let\@unusedoptionlist\CurrentOption
        \else
          \expandafter\expandafter\expandafter\gdef
          \expandafter\expandafter\expandafter\@unusedoptionlist
          \expandafter\expandafter\expandafter{%
            \expandafter\@unusedoptionlist
            \expandafter,\CurrentOption}%
        \fi}%
       {\toks@\expandafter{%
          \the\expandafter\toks@\expandafter,\CurrentOption}%
        \expandafter\kulwet@update@classoptions\CurrentOption=aa=\@nil
       }}%
    \edef\@tempa{\endgroup
      \noexpand\setkeys{kulwet}{\the\toks@}}%
    \@tempa
    \let\CurrentOption\@empty}%
  \@for\@tempa:=\kulwet@clskeys\do{%
    \expandafter\kulwet@invalidate@key\expandafter{\@tempa}{%
      as a class option}}}
\def\kulwet@getkey#1=#2\@nil{#1}
\def\kulwet@update@classoptions#1=#2#3=#4\@nil{%
  \def\@tempa{#3}\ifx\@tempa\@empty
    \def\@tempa##1,#1=##2,##3\@nil{##1,##3\@nil}%
    \def\@tempb,##1,\@nil{##1}%
    \xdef\@classoptionslist{\expandafter\expandafter\expandafter\@tempb
      \expandafter\@tempa\expandafter,\@classoptionslist,\@nil}%
  \fi}
\kulwet@clskey{master}{\lowercase{\edef\kulwet@opt@master{#1}}}
\def\kulwet@opt@master{}
\kulwet@clsopt{10pt}{\def\kulwet@ptsize{0}}
\kulwet@clsopt{11pt}{\def\kulwet@ptsize{1}}
\def\kulwet@ptsize{1}
\kulwet@clsopt{openright}{\PassOptionsToClass{open}{memoir}}
\kulwet@clsopt{openany}{\PassOptionsToClass{openany}{memoir}}
\kulwet@clsopt{openleft}{\PassOptionsToClass{openleft}{memoir}}
\kulwet@clsopt{oneside}{\PassOptionsToClass{oneside}{memoir}}
\kulwet@clsopt{twoside}{\PassOptionsToClass{twoside}{memoir}}
\kulwet@clskey{bind}{\setlength\kulwet@bind{#1}}
\newdimen\kulwet@bind
\kulwet@bind\z@
\kulwet@clsopt{draft}{\PassOptionsToClass{draft}{memoir}}
\def\kulwet@babel@opt{english,dutch}
\kulwet@clsopt{dutch}{\def\kulwet@language{dutch}}
\kulwet@clsopt{english}{\def\kulwet@language{english}}
\def\kulwet@language{\kulwet@master@language}
\kulwet@clskey{extralanguage}{%
  \edef\@tempa{{,#1,}{,\kulwet@babel@opt,}}\expandafter\in@\@tempa
  \ifin@\else \edef\kulwet@babel@opt{#1,\kulwet@babel@opt}\fi}
\kulwet@clsopt{nomicrotype}{\kulwet@microtypefalse}
\newif\ifkulwet@microtype \kulwet@microtypetrue
\kulwet@clsopt{fleqn}{\PassOptionsToClass{fleqn}{memoir}}
\gdef\kulwet@do@once@opts{}
\def\kulwet@add@once@opts#1#2#3{\g@addto@macro\kulwet@do@once@opts{%
    \ifx #2\@empty\else
      \def\@tempa{#3\let#2\@empty}%
      \kulwet@invalidate@key{#1}{once}%
      \expandafter\@tempa
    \fi}}
\define@key{kulwet}{masteroption}{\def\kulwet@opt@masteroption{#1}}
\def\kulwet@opt@masteroption{}
\def\kulwet@master@option{}
\kulwet@add@once@opts{masteroption}\kulwet@opt@masteroption{%
  \global\let\kulwet@master@option\@empty
  \ifx\kulwet@master@options@vl\relax
    \ifx\kulwet@opt@masteroption\@empty\else
      \kulwet@error{%
        The option `masteroption' is ignored because\MessageBreak
        your program disallows a master option on front pages}%
    \fi
  \else
    \@for\@tempa:=\kulwet@opt@masteroption\do{%
      \let\@tempc\@tempa
      \expandafter\kulwet@handle@mo\expandafter\kulwet@master@options
      \expandafter{%
        \expandafter\kulwet@add@mo@tempc\expandafter{\@tempa}}%
      \expandafter\g@addto@macro\expandafter\kulwet@master@option
        \expandafter{\@tempc,}}%
  \fi}
\def\kulwet@add@mo@tempc#1#2#3{%
  \lowercase{\def\@tempa{#1}}\def\@tempb{#2}\ifx\@tempa\@tempb
    \def\@tempc{#3}\fi}
\def\kulwet@handle@mo#1#2{%
  \expandafter\@tfor\expandafter\@tempd\expandafter:\expandafter=#1\do{%
    \expandafter\kulwet@handle@mo@\@tempd\@nil{#2}}}
\def\kulwet@handle@mo@ #1:#2\@nil #3{#3{#1}{#2}}
\RequirePackage[ascii]{inputenc}
\define@key{kulwet}{inputenc}{\def\kulwet@opt@inputenc{#1}}
\def\kulwet@opt@inputenc{}
\kulwet@add@once@opts{inputenc}\kulwet@opt@inputenc{%
  \inputencoding\kulwet@opt@inputenc}
\define@key{kulwet}{font}{%
  \edef\@tempa{\zap@space#1 \@empty}%
  \expandafter\kulwet@set@font\@tempa::\@empty}
\def\kulwet@set@font#1:#2:#3\@empty{%
  \expandafter\let\expandafter\@tempa
    \csname kulwet@set@font@#1\endcsname
  \ifx\@tempa\relax
    \kulwet@error{Font `#1' is ignored because it is an unknown font}%
  \else \@tempa{#2}\fi}
\let\kulwet@loadfont@\@empty
\kulwet@add@once@opts{font}\kulwet@loadfont@{%
  \kulwet@loadfont@ \kulwet@loadmt}
\def\kulwet@set@font@cm#1{\let\kulwet@loadfont@\relax}
\def\kulwet@set@font@lm#1{%
  \IfFileExists{lmodern.sty}%
   {\def\kulwet@loadfont@{%
      \RequirePackage[T1]{fontenc}%
      \RequirePackage{lmodern}}}%
   {\kulwet@opt@missingpkg{font=lm}{lm}}}
\def\kulwet@set@font@palatino#1{%
  \def\kulwet@loadfont@{%
    \RequirePackage[T1]{fontenc}%
    \RequirePackage[#1]{mathpazo}%
    \RequirePackage[scaled=.9]{helvet}}%
  \IfFileExists{lmodern.sty}{%
    \g@addto@macro\kulwet@loadfont@{%
      \renewcommand{\ttdefault}{lmtt}}}{}}
\def\kulwet@set@font@times#1{%
  \def\kulwet@loadfont@{%
    \RequirePackage[T1]{fontenc}%
    \RequirePackage[#1]{mathptmx}%
    \RequirePackage[scaled=.9]{helvet}}%
  \IfFileExists{lmodern.sty}{%
    \g@addto@macro\kulwet@loadfont@{%
      \renewcommand{\ttdefault}{lmtt}}}{}}
\def\kulwet@set@font@utopia#1{%
  \IfFileExists{fourier.sty}%
    {\def\kulwet@loadfont@{%
       \RequirePackage[T1]{fontenc}%
       \RequirePackage[#1]{fourier}%
       \RequirePackage[scaled=.9]{helvet}}%
     \IfFileExists{lmodern.sty}{%
       \g@addto@macro\kulwet@loadfont@{%
         \renewcommand{\ttdefault}{lmtt}}}{}}%
    {\kulwet@opt@missingpkg{font=utopia}{fourier}}}
\define@key{kulwet}{title}{\title{#1}}
\def\@title{\kulwet@error{No title given}}
\define@key{kulwet}{subtitle}{\def\kulwet@subtitle{#1}}
\def\kulwet@subtitle{}
\define@key{kulwet}{author}{\author{#1}}
\def\@author{\kulwet@error{No author given}}
\define@key{kulwet}{promotor}{%
  \def\@tempa{#1}\ifx\@tempa\@empty\else \def\kulwet@promotor{#1}\fi}
\let\KV@kulwet@promoter\KV@kulwet@promotor
\def\kulwet@promotor{\kulwet@error{No promoter given}}
\define@key{kulwet}{copromotor}{\def\kulwet@copromotor{#1}}
\def\kulwet@copromotor{}
%\def\kulwet@copromotor{\kulwet@error{No copromotor given}}
\define@key{kulwet}{assistant}{\def\kulwet@assistant{#1}}
\def\kulwet@assistant{}
%\def\kulwet@assistant{\kulwet@error{No assistant given}}
\define@key{kulwet}{acyear}{\def\kulwet@acyear{#1}}
\def\kulwet@acyear{}
\def\kulwet@acyear@t{%
  \ifx\kulwet@acyear\@empty
    \@tempcnta\year \ifnum\month<10 \advance\@tempcnta\m@ne \fi
    \@tempcntb\@tempcnta \advance\@tempcntb\@ne
    \xdef\kulwet@acyear{\the\@tempcnta\space -- \the\@tempcntb}%
  \fi
  \kulwet@acyear}
\define@key{kulwet}{translatedtitle}{\def\kulwet@translatedtitle{#1}}
\def\kulwet@translatedtitle{%
  \kulwet@error{No translated title available}}
\define@key{kulwet}{shortabstract}{\def\kulwet@shortabstract{#1}}
\def\kulwet@shortabstract{%
  \kulwet@error{No short abstract available}}
\define@key{kulwet}{udc}{\def\kulwet@udc{#1}}
\def\kulwet@udc{%
  \kulwet@error{UDC number missing}}
\define@key{kulwet}{keywords}{\def\kulwet@keywords{#1}}
\def\kulwet@keywords{}
\define@key{kulwet}{articletitle}{\def\kulwet@article@title{#1}}
\def\kulwet@article@title{}
\kulwet@keynovalue{coverpageonly}{\kulwet@coverpagetrue}
\newif\ifkulwet@coverpage
\kulwet@keynovalue{frontpagesonly}{\kulwet@frontpagestrue}
\newif\ifkulwet@frontpages
\kulwet@keynovalue{filingcard}{\kulwet@filingcardtrue}
\newif\ifkulwet@filingcard
\define@key{kulwet}{bindcover}{\ClassWarningNoLine\kulwet@cls{%
    Option `bindcover' is no longer supported}}
\def\kulwet@def@master#1{\@namedef{kulwet@m@#1}}
\newcommand*\kulwet@obsolete@master[2][]{%
  \@namedef{kulwet@m@#2\if &#1&\else .#1\fi}}
\def\kulwet@set@master#1#2#3#4#5#6#7#8#9\@nil{%
  \edef\kulwet@master@language{%
    \if N\@car#1\@nil dutch\else english\fi}%
  \kulwet@facnum=#2\relax
  \if F\@car#3\@nil \kulwet@filingcardtrue \fi
  \def\kulwet@master@colors{#4}%
  \def\kulwet@master@title{#5}%
  \def\kulwet@copyright@contact{#6}%
  \ifx\kulwet@copyright@contact\@empty
    \protected@edef\kulwet@copyright@contact{\kulwet@fac@copyright}%
  \fi
  \@ifnextchar[\kulwet@set@mo{\kulwet@set@mo[]}#7\@nil{#8}}
\def\kulwet@set@mo[#1]#2\@nil#3{%
  \def\kulwet@master@options@vl{#1}%
  \def\kulwet@master@options@v{-}%
  \ifx\kulwet@master@options@vl\kulwet@master@options@v
    \let\kulwet@master@options@vl\relax
    \let\kulwet@master@options@v\@empty
    \let\kulwet@master@options@o\@empty
    \let\kulwet@master@options\@empty
  \else
    \def\kulwet@master@options@v{#2}%
    \def\kulwet@master@options@o{#3}%
    \def\kulwet@master@options{#2#3}%
  \fi}
\def\kulwet@getcolors#1:#2:#3\@nil{%
  \edef\kulwet@color@bg{\if !#1!{white}\else [cmyk]{#1}\fi}%
  \edef\kulwet@color@fg{\if !#2!{black}\else [cmyk]{#2}\fi}}
\let\kulwet@div@master\@gobble
\let\kulwet@end@master@def\relax
\newcount\kulwet@facnum
\kulwet@facnum\@ne
\def\kulwet@fac@name{%
  \ifcase\kulwet@facnum \or
    Facult\kulwet@ifdutch{eit Wetenschappen}%
                         {y of Science}%
  \fi}
\def\kulwet@kulfac@logo#1{%
  \edef\@tempa{[#1]{logokul\ifnum\kulwet@facnum=\@ne eng\fi}}%
  \expandafter\includegraphics\@tempa}
\def\kulwet@fac@logo#1{}
\def\kulwet@fac@copyright{%
  \ifnum\kulwet@facnum >\@ne
    \kulwet@ifdutch d{th}e \MakeLowercase{\noexpand\kulwet@paa@0}::%
  \else
    Faculteit Wetenschappen, Geel Huis, Kasteelpark Arenberg 11 bus 2100,
    B-3001 Leuven (Heverlee):+32-16-321401:%
  \fi}
\def\kulwet@paa@#1{%
  \ifcase #1%
    Promot\kulwet@ifand\kulwet@promotor{\kulwet@ifdutch{oren}{ers}}{}%
  \or
    \ifx\kulwet@copromotor\@empty\else
      Co-promot\kulwet@ifand\kulwet@copromotor{\kulwet@ifdutch{oren}{ers}}{}%
    \fi    
  \or
      \ifx\kulwet@assistant\@empty\else
        \kulwet@ifdutch{Begeleider}{Assistant}%
        \kulwet@ifand\kulwet@assistant{s}{}%
      \fi
  \fi}
\providecommand*\kulwet@cfgfile{kulwet.cfg}
\ifx\kulwet@cfgfile\@empty\else
  \InputIfFileExists\kulwet@cfgfile{}{\kulwet@error{%
      Configuration file `\kulwet@cfgfile' is not installed}}
\fi
\kulwet@process@ptions
\ifx\kulwet@opt@master\@empty
  \kulwet@error{Required option `master' missing}\fi
\expandafter\let\expandafter\@tempa
  \csname kulwet@m@\kulwet@opt@master \endcsname
\ifx\@tempa\relax
  \kulwet@error{%
    Unsupported value `\kulwet@opt@master' for option `master'}\fi
\expandafter\kulwet@set@master\@tempa{}{}{}\@nil
\@ifundefined{kulwet@cfgfile@m}{%
  \edef\kulwet@cfgfile@m{kulwet-\kulwet@opt@master.cfg}}{}
\ifx\kulwet@cfgfile@m\@empty\else
  \InputIfFileExists\kulwet@cfgfile@m{}{}
\fi
\ifx\kulwet@master@options@vl\@empty\else
  \ifx\kulwet@master@options@vl\relax\else
    \def\kulwet@check@masteroption{%
      \ifx\kulwet@master@option\@empty
        \kulwet@error{%
          When using option `master=\kulwet@opt@master',\MessageBreak
          you should specify at least one master option.\MessageBreak
          Allowed master options are: \kulwet@master@options@vl}%
      \fi}
    \AtBeginDocument{\kulwet@check@masteroption}
  \fi
\fi
\LoadClass[a4paper,1\kulwet@ptsize pt]{memoir}[2004/04/05]
\def\and{\\}
\let\andnext\and
\RequirePackage[\kulwet@babel@opt]{babel}
\addto\captionsenglish{%
  \def\appendixtocname{Appendices}%
  \def\appendixpagename{Appendices}%
  \def\figurerefname{Figure}%
  \def\tablerefname{Table}%
  \def\pagerefname{page}%
  \def\partrefname{Part~}%
  \def\chapterrefname{Chapter~}%
  \def\listfiguresandtablesname{List of Figures and Tables}}
\begingroup
  \catcode`\"\active
  \@firstofone{\endgroup
    \addto\captionsdutch{%
      \def\appendixtocname{B"ylagen}%
      \def\appendixpagename{B"ylagen}%
      \def\figurerefname{figuur}%
      \def\tablerefname{tabel}%
      \def\pagerefname{pagina}%
      \def\partrefname{Deel~}%
      \def\chapterrefname{hoofdstuk~}%
      \def\listfiguresandtablesname{L"yst van figuren en tabellen}}}
\AtBeginDocument{\gdef\latinencoding{T1}%
  \ifx\cf@encoding\latinencoding\else \xdef\latinencoding{OT1}\fi}
\edef\kulwet@language{\kulwet@language}
\expandafter\main@language\expandafter{\kulwet@language}
\def\kulwet@selectmasterlanguage{%
  \expandafter\selectlanguage\expandafter{\kulwet@master@language}}
\def\kulwet@selecttextlanguage{%
  \expandafter\selectlanguage\expandafter{\kulwet@language}}
\RequirePackage{graphicx}
\RequirePackage{color}
\def\kulwet@loadmt{%
  \@ifpackageloaded{microtype}{}{\RequirePackage{microtype}}}
\AtBeginDocument{\kulwet@loadmt}
\ifkulwet@microtype
  \ifpdf
    \IfFileExists{microtype.sty}{}{%
      \def\@tempa{the package is not installed}%
      \kulwet@microtypefalse}
  \else
    \def\@tempa{you're not using pdflatex in pdf mode}
    \kulwet@microtypefalse
  \fi
\else
  \def\@tempa{option `nomicrotype' was used}
\fi
\ifkulwet@microtype\else
  \let\kulwet@loadmt\relax
  \ClassWarningNoLine\kulwet@cls{%
    Package `microtype' not used because\MessageBreak
    \@tempa}%
\fi
\def\kulwet@check@hyperref{%
  \@ifpackageloaded{hyperref}{%
    \@ifundefined{HyPsd@babel@dutch}{}{%
      \addto\HyPsd@babel@dutch{%
        \declare@shorthand{dutch}{"y}{ij}%
        \declare@shorthand{dutch}{"Y}{IJ}}}%
    \@ifpackageloaded{memhfixc}{}{%
      \RequirePackage{memhfixc}}%
    \providecommand*\theHsubfigure{\theHfigure.\arabic{subfigure}}%
    \providecommand*\theHsubtable{\theHtable.\arabic{subtable}}%
  }{}}
\AtBeginDocument{\kulwet@check@hyperref}
\RequirePackage[T1,OT1]{fontenc}
\kulwet@do@once@opts
\ifcase\kulwet@ptsize\relax
  \textwidth=13cm
  \textheight=20cm
\or
  \textwidth=14cm
  \textheight=215mm
\fi
\spinemargin\paperwidth
\advance\spinemargin -\textwidth
\foremargin\spinemargin
\advance\foremargin -\kulwet@bind\relax
\foremargin .\if@twoside 6\else 5\fi\foremargin
\advance\spinemargin -\foremargin
\marginparwidth=56pt
\marginparsep=1.2\onelineskip
\marginparpush=\onelineskip
\setulmargins{*}{*}{1.2}
\setheaderspaces{*}{\headsep}{*}
\checkthelayout\fixthelayout
\AtBeginDocument{\checkandfixthelayout}
\renewcommand*\clearforchapter{%
  \if@mainmatter
    \if@openleft
      \cleartoverso
    \else
      \if@openright
        \cleartorecto
      \else
        \clearpage
      \fi
    \fi
  \else
    \clearpage
  \fi}
\makeoddhead{ruled}{}{}{%
  \if@mainmatter \rightmark \else \scshape\leftmark \fi}
\pagestyle{ruled}
\makepagestyle{nohead}
\makeevenfoot{nohead}{\thepage}{}{}
\makeoddfoot{nohead}{}{}{\thepage}
\aliaspagestyle{chapter}{nohead}
\maxsecnumdepth{subsubsection}
\maxtocdepth{section}
\def\tocheadstart{\clearforchapter\chapterheadstart}
\def\lofheadstart{\clearforchapter\chapterheadstart}
\def\lotheadstart{\clearforchapter\chapterheadstart}
\newcommand*\listoffiguresandtables{%
  \chapter\listfiguresandtablesname
  \def\@lofmaketitle{\section*\listfigurename}%
  \listoffigures*%
  \let\listoffigures\relax
  \def\@lotmaketitle{\section*\listtablename}%
  \listoftables*%
  \let\listoftables\relax}
\newcommand*\listfiguresandtablesname{List of Figures and Tables}
\setrmarg{2.55em plus1fil}
\setlength{\cftbeforechapterskip}{1ex \@plus\p@}
\captionnamefont{\scshape}
\captiontitlefont{\upshape}
\captionstyle[\centering]{\centerlastline}
\DeclareFontFamily{T1}{kulwetfpf}{}
\DeclareFontShape{T1}{kulwetfpf}{m}{n}{<->phvr8t}{}
\DeclareFontShape{T1}{kulwetfpf}{m}{sc}{<->phvrc8t}{}
\DeclareFontShape{T1}{kulwetfpf}{m}{sl}{<->phvro8t}{}
\DeclareFontShape{T1}{kulwetfpf}{m}{it}{<->ssub*kulwetfpf/m/sl}{}
\DeclareFontShape{T1}{kulwetfpf}{bx}{n}{<->phvb8t}{}
\DeclareFontShape{T1}{kulwetfpf}{bx}{sc}{<->phvbc8t}{}
\DeclareFontShape{T1}{kulwetfpf}{bx}{sl}{<->phvbo8t}{}
\DeclareFontShape{T1}{kulwetfpf}{bx}{it}{<->ssub*kulwetfpf/bx/it}{}
\DeclareFontShape{T1}{kulwetfpf}{b}{n}{<->ssub*kulwetfpf/bx/n}{}
\DeclareFontShape{T1}{kulwetfpf}{b}{sc}{<->ssub*kulwetfpf/bx/sc}{}
\DeclareFontShape{T1}{kulwetfpf}{b}{sl}{<->ssub*kulwetfpf/bx/sl}{}
\DeclareFontShape{T1}{kulwetfpf}{b}{it}{<->ssub*kulwetfpf/bx/sl}{}
\definecolor{green}{RGB}{172,196,0}
\definecolor{bluetitle}{RGB}{29,141,176}
\definecolor{blueaff}{RGB}{0,0,128}
\definecolor{blueline}{RGB}{82,189,236}
\def\kulwet@fpf@title{\fontsize{40}{42}\sffamily\textcolor{bluetitle}}
\def\kulwet@fpf@subtitle{\fontsize{20}{22}\sffamily}
\def\kulwet@fpf@author{\fontsize{14}{16}\sffamily}
\def\kulwet@fpf@txthead{\fontsize\@xiipt{14.5}%
  \fontseries\bfdefault\selectfont}
\def\kulwet@fpf@text{\fontsize\@xiipt{14}\sffamily}
\def\kulwet@fpf@banner{\fontsize\@xivpt{18}%
  \fontseries\bfdefault\selectfont}
\def\kulwet@master@text{
  \kulwet@ifdutch
    {Proefschrift ingediend tot het behalen van de graad van}%
    {Thesis submitted for the degree of}
  \kulwet@master@title
  \ifx\kulwet@master@option\@empty\else
    \def\@tempb{, }%
    \@for\@tempa:=\kulwet@master@option\do{%
      \ifx\@tempa\@empty\else
        \@tempb \def\@tempb{ \kulwet@ifdutch{en}{and} }%
        \@tempa
      \fi}%
  \fi}
\def\kulwet@paa@fp#1{%
  \begingroup
    \ifcase #1\relax
      \let\@tempa\kulwet@promotor
    \or
        \let\@tempa\kulwet@copromotor
    \or
        \let\@tempa\kulwet@assistant
    \else
       \let\@tempa\@empty
    \fi
    \ifx\@tempa\@empty\else
      \medskip
      \ifx\kulwet@tempa\@empty\else 
        \begingroup
          \kulwet@fpf@txthead \kulwet@paa@{#1}:\vskip 2\p@
        \endgroup \@tempa \par
      \fi
    \fi
  \endgroup}
\def\kulwet@frontpage{\clearpage
  \definecolor{green}{RGB}{172,196,0}
  \definecolor{bluetitle}{RGB}{29,141,176}
  \definecolor{blueaff}{RGB}{0,0,128}
  \definecolor{blueline}{RGB}{82,189,236}
  \setlength{\TPHorizModule}{1mm}
  \setlength{\TPVertModule}{1mm}
  \setcounter{page}\m@ne
  \thispagestyle{empty}%
  \@tempdima\uppermargin \advance\@tempdima\topskip
  \advance\@tempdima\baselineskip \advance\@tempdima -1cm%
  \null \vskip -\@tempdima
%% The margins are 16\,mm, resulting in a text width of 178\,mm on A4 paper.
  \hbox to\hsize{%
    \@tempdima 2cm\advance\@tempdima -\spinemargin \hskip\@tempdima
    \vbox to\z@{\hsize 17cm\relax
      \lineskip\z@skip \parskip\z@skip
      \@ifundefined{microtypesetup}{}{\microtypesetup{activate=false}}%
      \fontencoding{T1}\fontfamily{kulwetfpf}\kulwet@fpf@text
      \raggedright \kulwet@selectmasterlanguage
      \noindent \hskip-1cm%
      \begin{textblock}{191}(-14,11)
        \colorbox{green}{\hspace{123mm}\ \parbox[c][18truemm]{68mm}{\textcolor{white}{FACULT\kulwet@ifdutch{EIT WETENSCHAPPEN}{Y OF SCIENCE}}}}
      \end{textblock}
      \begin{textblock}{70}(-8, 3)
        \kulwet@kulfac@logo{width=56mm}
        \kulwet@fac@logo{height=19.8truemm}
      \end{textblock}
      \begin{textblock}{160}(4,83)
        \begingroup \kulwet@selecttextlanguage
          \kulwet@fpf@title \@title \par
          \ifx\kulwet@subtitle\@empty\else
            \kulwet@fpf@subtitle \kulwet@subtitle \par
          \fi
        \endgroup
      \end{textblock}
      \begin{textblock}{160}(18,173)
        \begingroup 
          \flushright
          \textbf{\kulwet@fpf@author \@author}
          \vskip 30\p@ \@plus 1fill
        \endgroup
      \end{textblock}
      \flushright
      \begin{textblock}{70}(4,201)
        \flushleft
        \kulwet@paa@fp0%
        \ifkulwet@coverpage\else
          \kulwet@paa@fp1%
          \kulwet@paa@fp2%
        \fi
      \end{textblock}
      \begin{textblock}{160}(114,201)
        \hsize .4\textwidth \raggedleft
        \flushright
        \kulwet@master@text \par
      \end{textblock}
      \begin{textblock}{160}(18,252)
        \flushright
        \kulwet@fpf@banner
        \textmd{Academi\kulwet@ifdutch{ejaar}{c year} \kulwet@acyear@t}
      \end{textblock}
      \begin{textblock}{191}(-14,268)
        {\color{blueline}\rule{550pt}{5.5pt}}
      \end{textblock}
      \vfill
      \ifkulwet@coverpage
        \ifx\kulwet@master@colors\@empty\else
          \vskip 15\p@
          \centerline{\fboxsep\z@
            \expandafter\kulwet@getcolors\kulwet@master@colors::\@nil
            \expandafter\colorbox\kulwet@color@bg{%
              \vbox to 15mm{\hsize 19cm\vss
                \expandafter\textcolor\kulwet@color@fg{%
                  \kulwet@master@title}\vss}}}%
        \fi
      \fi
      \vskip -277mm}%
    \hss}%
  \clearpage}
\let\maketitle\relax
\def\kulwet@contact@print{%
  \expandafter\kulwet@contact@scan\kulwet@copyright@contact:::\@nil}
\def\kulwet@contact@scan#1:#2:#3:#4\@nil{#1%
  \def\@tempa{#2}\def\@tempb{#3}%
  \ifx\@tempa\@empty
    \ifx\@tempb\@empty\else , \texttt{#3}\fi
  \else
    , #2%
    \ifx\@tempb\@empty\else
      \space o\kulwet@ifdutch{f via e-}{r by e}mail \texttt{#3}%
    \fi
  \fi}
\def\kulwet@copyright@english{\selectlanguage{english}%
  Without written permission of the \MakeLowercase{\kulwet@paa@0} and
  the author\kulwet@ifand\@author{s}{} it is forbidden to reproduce
  or adapt in any form or by any means any part of this publication.
  Requests for obtaining the right to reproduce or utilize parts of
  this publication should be addressed to \kulwet@contact@print.\par
  A written permission of the \MakeLowercase{\kulwet@paa@0} is also
  required to use the methods, products, schematics and programs
  described in this work for industrial or commercial use, and for
  submitting this publication in scientific contests.\par}
\def\kulwet@copyright@dutch{\selectlanguage{dutch}%
  Zonder voorafgaande schriftelijke toestemming van zowel de
  \MakeLowercase{\kulwet@paa@0} als de auteur\kulwet@ifand\@author{s}{}
  is overnemen, kopi\"eren, gebruiken of realiseren van deze uitgave
  of gedeelten ervan verboden. Voor aanvragen tot of informatie
  i.v.m.\ het overnemen en/of gebruik en/of realisatie van gedeelten
  uit deze publicatie, wend u tot \kulwet@contact@print.\par
  Voorafgaande schriftelijke toestemming van de
  \MakeLowercase{\kulwet@paa@0} is eveneens vereist voor het
  aanwenden van de in deze masterproef beschreven (originele)
  methoden, producten, schakelingen en programma's voor industrieel
  of commercieel nut en voor de inzending van deze publicatie ter
  deelname aan wetenschappelijke prijzen of wedstrijden.\par}
\def\kulwet@copyrightpage{\clearpage
  \thispagestyle{empty}%
  \null \vfill
  \begingroup
    \parindent\z@ \parskip .5\baselineskip \sloppypar
    \copyright\space Copyright KU~Leuven\vskip\baselineskip
    \expandafter\let\expandafter\@tempa
      \csname kulwet@copyright@\kulwet@master@language\endcsname
    \expandafter\let\expandafter\@tempb
      \csname kulwet@copyright@\kulwet@language\endcsname
    \ifx\@tempa\@tempb \@tempa \else
      \ifx\@tempb\kulwet@copyright@english
        \let\@tempb\@tempa \let\@tempa\kulwet@copyright@english \fi
      \begingroup \@tempa \endgroup
      \vskip\baselineskip \@tempb
    \fi
  \endgroup
  \clearpage}
\makepagestyle{filingcard}
\makeheadrule{filingcard}{\textwidth}{\normalrulethickness}
\makeevenhead{filingcard}{\kulwet@selectmasterlanguage
  KU~Leuven \kulwet@fac@name}{}{\kulwet@acyear@t}
\makeoddhead{filingcard}{\kulwet@selectmasterlanguage
  KU~Leuven \kulwet@fac@name}{}{\kulwet@acyear@t}
\def\kulwet@filingcard{\clearforchapter
  \thispagestyle{filingcard}%
  \begingroup
    \kulwet@selectmasterlanguage
    \begingroup
      \centering \Large
      \kulwet@ifdutch{Fiche masterproef}{Master thesis filing card}%
      \vskip 1em
    \endgroup
    \begingroup
      \parskip\medskipamount
      \@hangfrom{\textit{%
          Student\kulwet@ifand\@author{\kulwet@ifdutch{en}s}}{}: }%
        \@author\par
      \@hangfrom{\textit{Tit\kulwet@ifdutch{el}{le}}: }%
        {\kulwet@selecttextlanguage \@title}\par
      \ifx\kulwet@translatedtitle\@empty\else
        \@hangfrom{\textit{%
            \kulwet@ifdutch
             {\kulwet@selecttextlanguage
              \kulwet@ifdutch{Engel}{Nederland}se titel}%
             {\kulwet@selecttextlanguage
              \kulwet@ifdutch{English}{Dutch} title}}: }%
        \kulwet@translatedtitle\par
      \fi
      \noindent \textit{UDC}: \kulwet@udc\par
      \ifx\kulwet@keywords\@empty\else
        \@hangfrom{\textit{Keywords}: }\kulwet@keywords\par
      \fi
      \ifx\kulwet@article@title\@empty\else
        \@hangfrom{\textit{%
            \kulwet@ifdutch{Titel van het artikel}{Article title}}: }%
          \kulwet@article@title\par
      \fi
      \vskip\medskipamount
    \endgroup
    \noindent \textit{\kulwet@ifdutch{Korte inhoud}{Abstract}}:%
    \vskip 2\p@
    \begingroup \kulwet@selecttextlanguage
      \noindent\ignorespaces \kulwet@shortabstract
    \endgroup
    \vfill \parskip\smallskipamount
    \begingroup \raggedright
      \noindent \kulwet@master@text \par
    \endgroup
    \@hangfrom{\textit{\kulwet@paa@0}: }\kulwet@promotor\par
    \ifx\kulwet@copromotor\@empty\else
      \@hangfrom{\textit{\kulwet@paa@1}: }\kulwet@copromotor\par
    \fi
    \ifx\kulwet@assistant\@empty\else
      \@hangfrom{\textit{\kulwet@paa@2}: }\kulwet@assistant\par
    \fi
  \endgroup
  \clearpage}
\g@addto@macro\document{\kulwet@frontpage
  \def\@tempa{\end{document}}%
  \ifkulwet@coverpage\else
    \kulwet@copyrightpage
    \ifkulwet@frontpages\else \let\@tempa\frontmatter \fi
  \fi
  \@tempa}
\def\kulwet@error@mm{\kulwet@error{%
    You forgot to use \string\mainmatter}}
\expandafter\def\expandafter\mainmatter\expandafter{%
  \expandafter\let\expandafter\kulwet@error@mm\expandafter\relax
  \mainmatter}
\AtEndDocument{%
  \ifkulwet@coverpage\else
    \ifkulwet@frontpages\else \kulwet@error@mm \fi
    \ifkulwet@filingcard
      \if@mainmatter \backmatter \fi
      \kulwet@filingcard
    \fi
  \fi}
\newenvironment{preface}[1][\@author]%
 {\chapter\prefacename
  \def\kulwet@preface@{#1}}%
 {\par
  \ifx\kulwet@preface@\@empty\else
    \bigskip \raggedleft \itshape \kulwet@preface@
  \fi
  \vfill \clearpage}
\renewenvironment{abstract}%
 {\chapter\abstractname}%
 {\clearpage}
\newenvironment{abstract*}[1][\kulwet@master@language]%
 {\expandafter\selectlanguage\expandafter{#1}%
  \abstract}%
 {\endabstract}
\endinput
%%
%% End of file `kulwet.cls'.
