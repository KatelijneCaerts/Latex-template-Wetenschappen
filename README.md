# Unofficial Latex-template-Wetenschappen

_This template was adopted from the kulemt template made by Luc Van Eycken and was adapted by Gert-Jan Andries and Katelijne Caerts._

## Template structure
	
### thesis.tex

This is the main tex file. This file contains all the settings and the structure of your thesis. 

To setup your thesis fill in thes setup. All non-optional fields are required.

```latex
	\setup{
	  title={Put your title here}, 
	  subtitle={Put an optional subtitle},   %Optional
	  author={firstname NAME},
	  promotor={firstname name},     
	  copromotor = {firstname name},   		%Optional
	  assistant={firstname name}       		%Optional
	}
```

If you want to have a fillingcard at the end of you thesis automatically generated you can add this to the file:

```latex
	\setup{
		filingcard,
		translatedtitle={place english translation of title here}, 
		udc=621.3,
		shortabstract={Hier komt een heel bondig abstract van hooguit 500 woorden.}
	}
```
General structure of the thesis:

```latex
\begin{document}

  %Preface
  \begin{preface}
    \input{Inleiding/preface}
  \end{preface}

  %Table of Contents (standerd depth is set to 2, you can adapt this)
  \setcounter{tocdepth}{2}
  \tableofcontents*

  %Abstract
  \begin{abstract}
    \input{Inleiding/abstract}
  \end{abstract}

  %List with symbols and abbreviations
  \include{SymbolsAbbs/SymbolsAndAbbreviations}

  %The actual thesis text
  \mainmatter

  	%include all you chapters
    \include{Hoofdstuk/Hoofdstuk}
    \include{Besluit/Besluit}

    %Add a bibliography
    \bibliographystyle{abbrv}
    \bibliography{referenties} %the bibtex file

    %Add an appendix:
    \appendixpage*          % Optional
    \appendix
    \include{Appendix/app-n}
    % ... and so on until app-n
    %\include{Appendix/app-n}

  \backmatter

\end{document}
```

### setup.tex

This file contains all the package imports, configurations etc. If you want to include or setup a new package, you can add it in this file.

### referenties.bib

This file contains you bibtex references.

## Supported masters

All supported master options are in the file kulwet.cfg. In order to select you master options you need to change te thesis.tex file: 

```latex
	\documentclass[master=wis,masteroption=ow,oneside]{kulwet}
```
First, setup you main master (e.g. wis for maths). Than select you masteroption (e.g. ow for onderwijs). The list below contains all supported options:

<table style="width: 100%; float: left;" border="2px"><colgroup> <col width="41%" /> <col width="51%" /> <col width="7%" /> </colgroup>
<tbody>
<tr class="odd">
<td>
<p><strong>Master</strong></p>
</td>
<td>
<p><strong>Options</strong></p>
</td>
<td>
<p><strong>Language</strong></p>
</td>
</tr>
<tr class="even">
<td>
<p>Master of Science in de Wiskunde <strong>(wis)</strong></p>
</td>
<td>
<p><strong>ow</strong>:optie Onderwijs</p>
<p><strong>oz</strong>:optie Onderzoek</p>
<p><strong>po</strong>:optie Professionele</p>
</td>
<td>
<p>NL</p>
</td>
</tr>
<tr class="odd">
<td>
<p>Master of Science of Mathematics <strong>(math)</strong></p>
</td>
<td>
<p><strong>re</strong>:option Research</p>
<p><strong>po</strong>:option Professional</p>
</td>
<td>
<p>ENG</p>
</td>
</tr>
<tr class="even">
<td>
<p>Master of Science in de bio-informatica <strong>(bin)</strong></p>
</td>
<td>
<p>none</p>
</td>
<td>
<p>NL</p>
</td>
</tr>
<tr class="odd">
<td>
<p>Master in de milieutechnologie en de milieuwetenschappen <strong>(mtw)</strong></p>
</td>
<td>
<p>none</p>
</td>
<td>
<p>NL</p>
</td>
</tr>
<tr class="even">
<td>
<p>Master of Science in de Statistiek <strong>(sta)</strong></p>
</td>
<td>
<p><strong>asm</strong>:specialisatie Algemene statistische methodologie</p>
<p><strong>bm</strong>:specialisatie Biometrie bs:specialisatie Business statistiek</p>
<p><strong>is</strong>:specialisatie Industri&euml;le statistiek</p>
<p><strong>sgp</strong>:specialisatie Statistiek in de sociale, gedrags- en pedagogische wetenschappen</p>
<p><strong>so</strong>:specialisatie Statistiek en Onderwijs</p>
</td>
<td>
<p>NL</p>
</td>
</tr>
<tr class="odd">
<td>
<p>Master of Science in de medische stralingsfysica <strong>(mms)</strong></p>
</td>
<td>
<p>none</p>
</td>
<td>
<p>NL</p>
</td>
</tr>
<tr class="even">
<td>
<p>Master of Science in Nuclear Engineering <strong>(mne)</strong></p>
</td>
<td>
<p>none</p>
</td>
<td>
<p>ENG</p>
</td>
</tr>
<tr class="odd">
<td>
<p>Master of Science in Space Studies <strong>(mss)</strong></p>
</td>
<td>
<p><strong>slpbm</strong>:major subject: Space Law, Policy, Business and Managemt</p>
<p><strong>ss</strong>:major subject: Space Sciences</p>
<p><strong>sta</strong>:major Subject: Space Technology and Applications</p>
</td>
<td>&nbsp;</td>
</tr>
<tr class="even">
<td>
<p>Master of Science in Physics  <strong>(phy)</strong></p>
</td>
<td>
<p><strong>re</strong>:option Research</p>
<p><strong>ps</strong>:option Physics for society</p>
</td>
<td>
<p>ENG</p>
</td>
</tr>
<tr class="odd">
<td>
<p>Master of Science in Fysica  <strong>(fys)</strong></p>
</td>
<td>
<p><strong>ow</strong>:optie Onderwijs</p>
<p><strong>oz</strong>:optie Onderzoek</p>
<p><strong>fm</strong>:optie Fysica in de maatschappij</p>
</td>
<td>
<p>NL</p>
</td>
</tr>
</tbody>
</table>


> If your master is not in the table above please start an issue with all the detail and we will create it as soon as possible. You can also send an email to template@gertjanandries.com. You can also add the master option yourself (do not forget to push this to our repository, so everyone can use it!). These options are defined in kulwet.cfg
	
# License

This file may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.2 of this license or (at your option) any later version. The latest version of this license is in: http://www.latex-project.org/lppl.txt and version 1.2 or later is part of all distributions of LaTeX version 1999/12/01 or later.
