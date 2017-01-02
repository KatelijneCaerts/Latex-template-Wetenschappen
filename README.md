#Unofficial Latex-template-Wetenschappen

	*This template was adopted from the kulemt template made by Luc Van Eycken* and was adapted by Gert-Jan Andries and Katelijne Caerts

##Template structure
	
	###thesis.tex

		This is the main tex file. This file contains all the settings and the structure of your thesis. 

		To setup your thesis fill in thes setup. All non-optional fields are required.

		```tex
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
		
		```tex
			\setup{
				filingcard,
	    		translatedtitle={place english translation of title here}, 
	    		udc=621.3,
	    		shortabstract={Hier komt een heel bondig abstract van hooguit 500 woorden. \LaTeX\ commando's mogen hier gebruikt worden. Blanco lijnen (of het commando \texttt{\string\pa r}) zijn wel niet toegelaten!\endgraf}
	    	}
		```
		General structure of the thesis:
		
		```tex
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

	###setup.tex

		This file contains all the package imports, configurations etc. If you want to include or setup a new package, you can add it in this file.

	###referenties.bib

		This file contains you bibtex references.

##Supported masters

	All supported master options are in the file kulwet.cfg. In order to select you master options you need to change te thesis.tex file: 

		```tex
			\documentclass[master=wis,masteroption=ow,oneside]{kulwet}
		```
	First, setup you main master (e.g. wis for maths). Than select you masteroption (e.g. ow for onderwijs). The list below contains all supported options:

	+-------------------------------------------------------------------+-----------------------------------------------------------------------------------+-----------+
	| Master        													| Options       																	| Language  |
	+-------------------------------------------------------------------+-----------------------------------------------------------------------------------+-----------+
	| Master of Science in de Wiskunde (wis)							| ow:optie Onderwijs																| NL		|
	|               													| oz:optie Onderzoek																| 			|
	|               													| po:optie Professionele															| 			|
	+-------------------------------------------------------------------+-----------------------------------------------------------------------------------+-----------+
	| Master of Science of Mathematics (math)							| re:option Research																| ENG		|
	|               													| po:option Professional															| 			|
	+-------------------------------------------------------------------+-----------------------------------------------------------------------------------+-----------+
	| Master of Science in de bio-informatica (bin)						| none																				| NL		|
	+-------------------------------------------------------------------+-----------------------------------------------------------------------------------+-----------+
	| Master in de milieutechnologie en de milieuwetenschappen (mtw)	| none																				| NL		|
	+-------------------------------------------------------------------+-----------------------------------------------------------------------------------+-----------+
	| Master of Science in de Statistiek (sta)							| asm:specialisatie Algemene statistische methodologie								| NL		|
	|               													| bm:specialisatie Biometrie														| 			|
	|               													| bs:specialisatie Business statistiek												| 			|
	|																	| is:specialisatie Industriële statistiek 											|			|
	|																	| sgp:specialisatie Statistiek in de sociale, gedrags- en pedagogische wetenschappen|			|
	|																	| so:specialisatie Statistiek en Onderwijs 											|			|
	+-------------------------------------------------------------------+-----------------------------------------------------------------------------------+-----------+
	| Master of Science in de medische stralingsfysica (mms)			| none																				| NL		|
	+-------------------------------------------------------------------+-----------------------------------------------------------------------------------+-----------+
	| Master of Science in Nuclear Engineering (mne)					| none																				| ENG		|
	+-------------------------------------------------------------------+-----------------------------------------------------------------------------------+-----------+
	| Master of Science in Space Studies (mss)							| slpbm:major subject: Space Law, Policy, Business and Management					| ENG		|
	|               													| ss:major subject: Space Sciences													| 			|
	|               													| sta:major Subject: Space Technology and Applications								| 			|
	+-------------------------------------------------------------------+-----------------------------------------------------------------------------------+-----------+

	> If your master is not in the table above please start an issue with all the detail and we will create it as soon as possible. You can also send an email to template@gertjanandries.com. You can also add the master option yourself (do not forget to push this to our repository, so everyone can use it!). These options are defined in kulwet.cfg
	
#License

	This file may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.2 of this license or (at your option) any later version. The latest version of this license is in: http://www.latex-project.org/lppl.txt and version 1.2 or later is part of all distributions of LaTeX version 1999/12/01 or later.