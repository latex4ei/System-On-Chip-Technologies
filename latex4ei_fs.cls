% Layout,	Macros für LaTeX4EI							Stand 04.04.13
% Erstellt von Emanuel Regnath, Martin Zellner
%
% Lizenz: Dieses package darf nur für Dokumente für LaTeX4EI verwendet werden!
% Bei anderem Verwendungszweck bitte Erlaubnis einholen: info@latex4ei.de
% © 2013, LaTeX4EI

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{latex4ei_fs}[2014/07/16 Formelsammlungsvorlage von LaTeX4EI]

%---------------------------------------%
%             O P T I O N S             %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% forward options to latex4ei package
\newif\ifcolor\colortrue
\DeclareOption{color}{\colortrue\PassOptionsToPackage{color}{latex4ei}}
\DeclareOption{nocolor}{\colorfalse\PassOptionsToPackage{nocolor}{latex4ei}}
\DeclareOption{german}{\colorfalse\PassOptionsToPackage{german}{latex4ei}}
\DeclareOption{english}{\colorfalse\PassOptionsToPackage{english}{latex4ei}}


% define baseclass
\def\baseclass{scrartcl}

% make three column design possible
\newcounter{columnnumber}
\setcounter{columnnumber}{4}
\DeclareOption{threecolumn}{\setcounter{columnnumber}{3}}

% legacy boxes
\newif\iflegacyboxes\legacyboxesfalse
\DeclareOption{legacyboxes}{\legacyboxestrue}

% set default options for base class 
\PassOptionsToClass{6pt, a4paper, landscape}{\baseclass}

% forward unknown options to class 
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{\baseclass}%
}

% process options
\ProcessOptions\relax

% load baseclass
\LoadClass{\baseclass}

%---------------------------------------%
%           P A C K A G E S             %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% load latex4ei packages
\RequirePackage{scientific}  		% scientific macros for LaTeX4EI
\RequirePackage{latex4ei}  			% base definitions for LaTeX4EI (privat) 


%---------------------------------------%
%             L A Y O U T               %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% Geometry =====================================================================
\RequirePackage{geometry}
\geometry{a4paper,landscape, left=6mm,right=6mm, top=6mm, bottom=5mm,includefoot, footskip=1.7em}


% Multicolumn ==================================================================
\RequirePackage{multicol}			% for columns

% start multicolumn
\AtBeginDocument{
    \begin{multicols*}{\value{columnnumber}}
}
\AtEndDocument{
	\label{LastPage}
	\end{multicols*}
}


% Header and Footer ============================================================
\RequirePackage{fancyhdr}
\RequirePackage{scrtime}			% Änderungsdatum

\pagestyle{fancy}
\fancyhf{}

\AtBeginDocument{
\fancyfoot[C]{\EngGer{from}{von} \theauthor\ -- Mail: \email{\theemail}}
}
\renewcommand{\headrulewidth}{0.0pt} %obere Linie ausblenden
\renewcommand{\footrulewidth}{0.1pt} %obere Linie ausblenden

\fancyfoot[R]{\EngGer{Last revised}{Stand}: \today, \thistime \qquad \thepage/\pageref{LastPage}}
\fancyfoot[L]{Homepage: \url{\thewebsite} -- \EngGer{Please report mistakes \emph{immediately}}{Fehler bitte \emph{sofort} melden}.}




% Title ========================================================================
\providecommand{\fstitle}[1]{
	\vspace{-20mm}{
	\parbox{2.3cm}{
		\includegraphics[height=1.4cm]{Logo.pdf}		
	}
	\parbox{4cm}{
		\huge\textbf{#1}
	}}
}

\renewcommand{\maketitle}{\fstitle{\thetitle}}


% Chapters and Sections ========================================================
\RequirePackage{titlesec}
%\titleformat{ command }[ shape ]{ format }{ label }{ sep }{ before-code }[ after-code ]
%\titlespacing*{ command }{ left }{ beforesep }{ aftersep }[ right ]


\makeatletter
\@addtoreset{section}{part}
\makeatother

\titleformat{\part}{\pagebreak\huge \bfseries}{}{0em}{\huge \bfseries}
\providecommand{\chapter}[1]{\pagebreak\vspace{0.5em}\noindent\textbf{\huge{#1}}\vspace{0.5em}}
%\titleformat{\chapter}{\huge \bfseries}{\thechapter}{0em}{\huge \bfseries}
\titleformat{\section}{\Large\bfseries\color{col_section}}{\thesection .}{0.5em}{\color{col_section}}[]%
\titleformat{\subsection}{\large\bfseries\color{col_subsection}}{\thesubsection .}{0.3em}{}


%\titlespacing{Überschriftart}{keine Ahnung}{Abstand oberhalb}{Abstand unterhalb}
\titlespacing{\section}{0em}{1.0em}{0.1em}
\titlespacing{\subsection}{0em}{0.2em}{-0.4em}
\titlespacing{\subsubsection}{0em}{0em}{-0.5em}



% Paragraphs ===================================================================
\RequirePackage{parskip} 			% Verhindert das einrücken am Zeilenanfang
\setlength{\parskip}{1pt}



% Font Settings ================================================================

% Schriftart SANS für bessere Lesbarkeit bei kleiner Schrift
\renewcommand{\familydefault}{\sfdefault}

% Array- und Tabellenabstände vergrößern
\renewcommand{\arraystretch}{1.2}



%---------------------------------------%
%       E N V I R O N M E N T S         %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
\setlength{\itemindent}{0em}
\setlength\leftmargini{1.0em}
\setlength\itemsep{0em}



%---------------------------------------%
%             O T H E R	                %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

% SI-Units Settings ============================================================
\sisetup{per-mode=fraction}
\sisetup{sticky-per=true}
\AtBeginDocument{\sisetup{math-rm=\mathrm, text-rm=\rmfamily}}





%---------------------------------------%
%       C O L O R    S C H E M E        %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

\ifcolor
	\colorlet{col_section}{tum_blue_dark}
	\colorlet{col_subsection}{black}
	\colorlet{col_subsubsection}{black}
	
	\colorlet{col_sectionbox}{gray}
	\colorlet{col_emphbox}{tum_red}
	\colorlet{col_topicbox}{tum_blue_dark}
	\colorlet{col_symbolbox}{tum_orange}
	\colorlet{col_cookbox}{tum_blue_dark}
	
	%\colorlet{col_table}{tum_green_leaf}
	\colorlet{col_table}{tum_blue_dark}
\else
	\colorlet{col_section}{black}
	\colorlet{col_subsection}{black}
	\colorlet{col_subsubsection}{black}

	\colorlet{col_sectionbox}{gray}
	\colorlet{col_emphbox}{black}
	\colorlet{col_topicbox}{black}
	\colorlet{col_symbolbox}{black}
	\colorlet{col_cookbox}{black}
	
	\colorlet{col_table}{black}
\fi




\lstset{
	backgroundcolor=\color{col_lst!10},
}

%---------------------------------------%
%             B O X E S	                %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
\RequirePackage{pbox}				% Intelligent parbox: \pbox{maximum width}{blabalbalb \\ blabal}


\iflegacyboxes

	% colored boxes
	\providecommand{\topicbox}[2]{
	\fcolorbox{col_topicbox}{col_topicbox!10}{\color{col_topicbox}\parbox{\columnwidth-2\fboxsep}{{\large \textbf{ #1}}\\\hspace*{-\fboxsep}\rule[2pt]{\columnwidth}{0.5pt}\\ \color{black}#2}}}

	\providecommand{\emphbox}[1]{{\fboxrule1pt\fcolorbox{col_emphbox}{col_emphbox!10}{\parbox{\columnwidth-2\fboxsep-2pt}{\centering #1}}}}
	\providecommand{\symbolbox}[1]{{\fboxrule1pt\fcolorbox{col_symbolbox}{col_symbolbox!10}{\parbox{\columnwidth-2\fboxsep-2pt}{#1}}}}
	\providecommand{\tablebox}[1]{{\fboxsep0pt\colorbox{col_table!10}{\parbox{\columnwidth}{#1}}}}
	\providecommand{\sectionbox}[1]{{\fboxsep0.5em\hspace*{-1.5\fboxsep}
	\fcolorbox{col_sectionbox}{col_sectionbox!3}{%
	\parbox{\columnwidth}{%
		\titlespacing{\subsection}{0em}{0.2em}{0.2em}%
		\titlespacing{\subsubsection}{0em}{0.2em}{0.2em}%
	#1
	}}}}


	% blue cook box
	\providecommand{\cookbox}[2]{{\fboxsep0pt\colorbox{col_cookbox!10}{\parbox{\columnwidth}{
	{\color{col_cookbox}\hrule\hrule}\vspace{2pt}
	  \begin{center}
	\textbf{#1}
	\end{center}
	\vspace{3pt}{\color{col_cookbox!55}\hrule\hrule}
	\vspace{3pt}
	\begin{itemize}
	#2
	\end{itemize}
	\vspace{2pt}{\color{col_cookbox}\hrule\hrule}
	}}}}

	% blue cook box as list
	\providecommand{\cooknumbox}[2]{{\fboxsep0pt\colorbox{col_cookbox!10}{\parbox{\columnwidth}{
	{\color{col_cookbox}\hrule\hrule}\vspace{2pt}
	  \begin{center}
	\textbf{#1}
	\end{center}
	\vspace{3pt}{\color{col_cookbox!55}\hrule\hrule}
	\vspace{3pt}
	\begin{enumerate}
	#2
	\end{enumerate}
	\vspace{2pt}{\color{col_cookbox}\hrule\hrule}
	}}}}

\else
	% load new boxes
	\RequirePackage{latex4ei_boxes} 
\fi
