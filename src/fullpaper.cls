\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fullpaper}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=fp, prefix=fp@}

\DeclareStringOption[11pt]{fontsize}
\DeclareStringOption[13pt]{leading}
\ProcessKeyvalOptions*

\LoadClass[a4paper, twoside]{article}
\RequirePackage{fontsize}
\changefontsize[\fp@leading]{\fp@fontsize}

\setlength{\overfullrule}{5pt}
\setlength{\emergencystretch}{2em}

\RequirePackage[american]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{fixcmex}

\newcommand{\fp@label}{\bfseries}
\newcommand{\fp@thmnote}{\normalfont}
\newcommand{\fp@quiet}{\itshape}
\newcommand{\fp@proofhead}{\itshape}
\newcommand{\fp@titlefont}{\bfseries}
\newcommand{\fp@namefont}{\scshape}
\newcommand{\fp@afffont}{\itshape}
\newcommand{\fp@listlabel}{\bfseries}
\newcommand{\fp@itemlabel}{\textendash}
\newcommand{\fp@headfont}{\scshape}
\newcommand{\fp@titlerule}{\noindent{\color{accent}\rule{\linewidth}{0.6pt}}}
\RequirePackage{microtype}
\RequirePackage[a4paper, top=3.2cm, bottom=3.2cm, left=2.9cm, right=2.9cm,
                headheight=24pt, headsep=14pt,
                marginparwidth=2.4cm, marginparsep=3mm]{geometry}

\RequirePackage[rgb]{xcolor}

\definecolor{mid-green}{rgb}{0.15,0.65,0.15}
\definecolor{dark-green}{rgb}{0.15,0.25,0.15}
\definecolor{dark-red}{rgb}{0.7,0.15,0.15}
\definecolor{dark-blue}{rgb}{0.15,0.15,0.9}
\definecolor{medium-blue}{rgb}{0,0,0.5}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{color-Ig}{rgb}{0.15,0.7,0.15}
\definecolor{darkmagenta}{rgb}{0.30, 0.0, 0.30}

\definecolor{goodred}{HTML}{CC6677}
\definecolor{goodblue}{HTML}{332288}
\definecolor{goodyellow}{HTML}{DDCC77}
\definecolor{goodgreen}{HTML}{117733}
\definecolor{goodcyan}{HTML}{88CCEE}
\definecolor{goodwine}{HTML}{882255}
\definecolor{goodteal}{HTML}{44AA99}
\definecolor{goodolive}{HTML}{999933}
\definecolor{goodpurple}{HTML}{AA4499}

\definecolor{accent}{HTML}{1F4E5F}
\definecolor{accentwarm}{HTML}{8C2F39}

\newcommand{\dblue}{\textcolor{dark-blue}}
\newcommand{\red}{\textcolor{red}}
\newcommand{\dred}{\textcolor{dark-red}}
\newcommand{\dgreen}{\textcolor{dark-green}}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{mathtools}
\RequirePackage{complexity}
\RequirePackage{xspace}

\renewcommand{\ComplexityFont}[1]{{\ensuremath{\mathsf{#1}}}\xspace}
\xspaceaddexceptions{[}

\RequirePackage{enumitem}
\RequirePackage{outlines}
\RequirePackage[labelsep=period, font=small, skip=6pt]{caption}
\captionsetup{labelfont=bf}

\setlist{itemsep=4pt, topsep=4pt, parsep=4pt}

\setlist[enumerate,1]{label=\fp@listlabel\arabic*.}
\setlist[enumerate,2]{label=\fp@listlabel(\alph*)}
\setlist[itemize,1]{label=\fp@itemlabel}

\newlist{romanenumerate}{enumerate}{1}
\setlist[romanenumerate]{label=\fp@listlabel(\roman*),
                         ref=(\roman*)}

\RequirePackage{titlesec}
\RequirePackage{fancyhdr}

\titleformat{\section}{\large\sffamily\bfseries}
            {\thesection}{0.7em}{}
\titleformat{\subsection}{\normalsize\sffamily\bfseries}
            {\thesubsection}{0.6em}{}
\titleformat{\subsubsection}{\normalsize\sffamily\bfseries\slshape}
            {\thesubsubsection}{0.6em}{}

% contents: a number box of 2em (article: 1.5em), so that two-digit section numbers keep a gap before the title
\RequirePackage{etoolbox}
\patchcmd{\l@section}{\setlength\@tempdima{1.5em}}{\setlength\@tempdima{2em}}{}{%
  \ClassWarning{fullpaper}{could not widen the section numbers in the contents}}

\renewcommand{\paragraph}{%
  \@startsection{paragraph}{4}{\z@}%
    {\medskipamount}%
    {-1em}%
    {\normalfont\normalsize\bfseries}%
}

\newcommand{\fp@shorttitle}{}
\newcommand{\fp@shortauthors}{}
\newcommand{\shorttitle}[1]{\gdef\fp@shorttitle{#1}}
\newcommand{\shortauthors}[1]{\gdef\fp@shortauthors{#1}}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\leaders\hrule height
  \headrulewidth\hfill}}
\fancyhead[EL]{\small\fp@headfont\fp@shorttitle}
\fancyhead[OR]{\small\fp@headfont\fp@shortauthors}
\fancyfoot[C]{\small\fp@headfont\thepage}
\fancypagestyle{plain}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}%
  \fancyfoot[C]{\small\fp@headfont\thepage}}

\RequirePackage[autostyle=false, style=american]{csquotes}
\RequirePackage[backend=biber, style=numeric-comp, sorting=nyt, giveninits=true,
                maxcitenames=2, maxbibnames=99, doi=true, url=true, isbn=false]{biblatex}

\DeclareSourcemap{
  \maps[datatype=bibtex]{
    \map{
      \step[fieldsource=doi,
            match=\regexp{\A\s*(?:https?://)?(?:dx\.)?doi\.org/},
            replace={}]
    }
  }
}

\RequirePackage{hyperref}
\RequirePackage{zref-clever}
\RequirePackage{orcidlink}

\hypersetup{colorlinks, linkcolor={goodblue}, citecolor={accentwarm},
            urlcolor={goodblue}}

% Citations by shorthand. \citeas{key}{text} cites key like \cite{key}, printing
% text in place of the number, as a link to the bibliography entry of key.
% \CI and \CII are the two papers of Hatzel, Kreutzer, Garlet Milani, and Muzi. In a
% section title write \CI{} Theorem, since a bookmark cannot use \xspace and
% would lose the space.
\DeclareCiteCommand{\fp@citeas}{}{\bibhyperref{\fp@citeastext}}{}{}
\NewDocumentCommand{\citeas}{mm}{\begingroup\def\fp@citeastext{#2}\fp@citeas{#1}\endgroup}
\NewDocumentCommand{\CI}{}{\citeas{HKMM26a}{CI}\xspace}
\NewDocumentCommand{\CII}{}{\citeas{HKMM26b}{CII}\xspace}
\pdfstringdefDisableCommands{%
  \def\citeas#1#2{#2}%
  \def\CI{CI}%
  \def\CII{CII}%
}

% no serial comma before the last type group ("Lemma 2.1, Theorem 3.2 and Remark 4.1"), as in the prose and as
% lastsep within one type
\zcsetup{cap, nameinlink=single, tlastsep={~and\nobreakspace}}
\zcLanguageSetup{english}{
  type = part,      Name-pl = parts,
  type = chapter,   Name-pl = chapters,
  type = section,   Name-pl = sections,
  type = paragraph, Name-pl = paragraphs,
  type = appendix,  Name-pl = appendices,
  type = page,      Name-pl = pages,
  type = line,      Name-pl = lines,
  type = figure,    Name-pl = figures,
  type = table,     Name-pl = tables,
  type = item,      Name-pl = items,
  type = footnote,  Name-pl = footnotes,
  type = equation,  Name-pl = equations,
  type = algorithm, Name-pl = algorithms,
  type = listing,   Name-pl = listings,
}

\NewDocumentCommand{\fref}{O{f} m}{\hyperref[#2]{\ensuremath{#1_{\ref*{#2}}}}}
\newcommand{\caseref}[2]{%
	\hyperref[#2]{\zcref*[noref]{#1}~\zcref*[noname]{#1}~\ref*{#2}}%
}

\newcommand{\titlemath}[1]{\texorpdfstring{$#1$}{#1}\xspace}

\RequirePackage{keytheorems}

\newkeytheoremstyle{paperplain}{
  headfont     = \fp@label,
  numberfont   = \fp@label,
  notefont     = \fp@thmnote,
  bodyfont     = \itshape,
  headpunct    = {.},
  spaceabove   = 1.1\topsep,
  spacebelow   = 1.1\topsep,
}
\newkeytheoremstyle{paperdefinition}{
  inherit-style = paperplain,
  bodyfont      = \normalfont,
}
\newkeytheoremstyle{paperremark}{
  inherit-style = paperplain,
  headfont      = \fp@quiet,
  numberfont    = \fp@quiet,
  bodyfont      = \normalfont,
}
\newkeytheoremstyle{paperclaim}{
  inherit-style = paperdefinition,
  headfont      = \fp@quiet,
  numberfont    = \fp@quiet,
}

\newkeytheorem{theorem}[style=paperplain, parent=section,
  refname={theorem,theorems}, Refname={Theorem,theorems}]
\newkeytheorem{lemma}[style=paperplain, sibling=theorem,
  refname={lemma,lemmas}, Refname={Lemma,lemmas}]
\newkeytheorem{corollary}[style=paperplain, sibling=theorem,
  refname={corollary,corollaries}, Refname={Corollary,corollaries}]
\newkeytheorem{proposition}[style=paperplain, sibling=theorem,
  refname={proposition,propositions}, Refname={Proposition,propositions}]
\newkeytheorem{conjecture}[style=paperplain, sibling=theorem,
  refname={conjecture,conjectures}, Refname={Conjecture,conjectures}]
\newkeytheorem{observation}[style=paperplain, sibling=theorem,
  refname={observation,observations}, Refname={Observation,observations}]
\newkeytheorem{property}[style=paperplain, sibling=theorem,
  refname={property,properties}, Refname={Property,properties}]
\newkeytheorem{definition}[style=paperdefinition, sibling=theorem,
  refname={definition,definitions}, Refname={Definition,definitions}]
\newkeytheorem{example}[style=paperdefinition, sibling=theorem,
  refname={example,examples}, Refname={Example,examples}]
\newkeytheorem{remark}[style=paperremark, sibling=theorem,
  refname={remark,remarks}, Refname={Remark,remarks}]
\newkeytheorem{note}[style=paperremark, sibling=theorem,
  refname={note,notes}, Refname={Note,notes}]
\newkeytheorem{claim}[style=paperclaim, sibling=theorem,
  refname={claim,claims}, Refname={Claim,claims}]

\renewcommand{\qedsymbol}{\ensuremath{\square}}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont\topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep\fp@proofhead#1\@addpunct{.}]%
  \ignorespaces
}{\popQED\endtrivlist}

\newenvironment{cproof}
  {\begin{proof}[Proof of the claim]}
  {\end{proof}}

\RequirePackage{tikz,ifthen}
\RequirePackage{tkz-berge}

\usetikzlibrary{mindmap,positioning}
\usetikzlibrary{graphs}
\usetikzlibrary{patterns}
\usetikzlibrary{arrows,automata,positioning}
\usetikzlibrary{decorations.pathreplacing}
\usetikzlibrary{decorations}
\usetikzlibrary{decorations.pathmorphing}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{quotes}
\usetikzlibrary{shapes.callouts}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{calc}
\usetikzlibrary{backgrounds}
\usetikzlibrary{fit}

\tikzset{faded/.style={gray,very thin}}
\tikzset{vertex/.style={draw,circle,minimum size=5pt,inner sep=0pt}}
\tikzset{novertex/.style={circle,minimum size=5pt,inner sep=0pt}}
\tikzset{blackvertex/.style={draw,circle,minimum size=5pt,inner sep=0pt, fill=black}}
\tikzset{redvertex/.style={draw,circle,minimum size=5pt,inner sep=0pt, fill=red}}
\tikzset{redvertexfaded/.style={draw,circle,faded,minimum size=5pt,inner sep=0pt, fill=red!50}}
\tikzset{greenvertex/.style={draw,circle,minimum size=5pt,inner sep=0pt, fill=green}}
\tikzset{greenvertexfaded/.style={draw,circle,faded,minimum size=5pt,inner sep=0pt, fill=green!50}}
\tikzset{bluevertex/.style={draw,circle,minimum size=5pt,inner sep=0pt, fill=blue}}
\tikzset{bluevertexfaded/.style={draw,circle,faded,minimum size=5pt,inner sep=0pt, fill=blue!50}}
\tikzset{yellowvertex/.style={draw,circle,minimum size=5pt,inner sep=0pt, fill=yellow}}
\tikzset{yellowvertexfaded/.style={draw,circle,faded,minimum size=5pt,inner sep=0pt,
fill=yellow!50}}
\tikzset{arrow/.style={-{Latex[scale=1]},shorten >= 0pt}}

\tikzset{snake it/.style={decorate, decoration=snake}}
\tikzset{big snake/.style={decorate, decoration={snake,segment length=7mm, amplitude=3mm}}}
\tikzset{ultra snake/.style={decorate, decoration={snake,segment length=7mm, amplitude=6mm}}}

\renewcommand{\@maketitle}{%
  \begingroup
    \raggedright
    \let\footnote\thanks
    {\large\fp@titlefont\@title\par}%
    \vskip 0.9em%
    \@author\par
    \ifx\@date\@empty\else\vskip 0.6em{\@date}\par\fi
  \endgroup
  % the rule follows the affiliations closely: \nointerlineskip drops the baselineskip glue above it
  \par\nointerlineskip\vskip 0.6em%
  \fp@titlerule\par
  \vskip 0.5em}

\let\fp@maketitle\maketitle
\renewcommand{\maketitle}{%
  \fp@maketitle
  \thispagestyle{empty}%
  \setcounter{page}{0}}

\newcommand{\authorname}[1]{%
  \par\noindent{\normalsize\fp@namefont #1}%
  \par\nobreak}
\newcommand{\affiliation}[1]{\par\nobreak\noindent{\footnotesize\fp@afffont #1}\par\nobreak}
\newcommand{\authormail}[1]{%
  \par\nobreak\noindent{\footnotesize\ttfamily\href{mailto:#1}{#1}}\par}
\newcommand{\authormails}[2]{%
  \par\nobreak\noindent{\footnotesize\ttfamily
    \href{mailto:#1}{#1}, \href{mailto:#2}{#2}}\par}

\renewenvironment{abstract}{%
  \par\vskip 0.3em
  {\centering\fp@label\abstractname\par}% centered heading
  \nobreak\vskip 0.25em
  \begingroup\small\noindent\ignorespaces
}{%
  \par\endgroup\vskip 0.4em}

\newcommand{\metadatum}[2]{%
  \par\bigskip\noindent
  {\small{\fp@label#1\enskip}#2}\par}

\newcommand{\funding@list}{}
\newcommand{\addfunding}[2]{%
  \g@addto@macro\funding@list{\funding@entry{#1}{#2}}}
\newcommand{\funding@entry}[2]{\emph{#1}: #2\par}
\newcommand{\printfunding}{%
  \ifx\funding@list\@empty\else
    \par\medskip\noindent
    \begingroup
      \small\parindent\z@
      {\fp@label Funding\enskip}\funding@list
    \endgroup
  \fi}

\RequirePackage[loadshadowlibrary, shadow]{todonotes}
\setuptodonotes{tickmarkheight=3pt}
\newcommand{\todowarn}{\PackageWarning{todonotes}{something to be done there.}}

\newcommand{\newtodoauthor}[3][red]{%
  \expandafter\newcommand\csname #2\endcsname[2]{%
    \todo[author=#3]{##2}\textcolor{#1}{##1}\todowarn}%
  \expandafter\newcommand\csname #2in\endcsname[1]{%
    \todo[inline,noshadow,author=#3]{##1}\todowarn}}
