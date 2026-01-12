\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mlubrief2}[2026/01/12 MLU Halle-Wittenberg Letter Class]

% Load base class
\LoadClass[parskip=half,fontsize=11pt,foldmarks=hp,backaddress=false]{scrlttr2}

% Modern packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[ngerman]{babel}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage[left=3cm,right=2cm,bottom=3cm,top=2cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{atbegshi}

% Define faculty color (CMYK: teal/green for university)
\definecolor{mlugreen}{cmyk}{1,0,0.79,0.60}

% Letter positioning
\setplength{toaddrvpos}{50.8mm}
\setplength{toaddrhpos}{24.1mm}
\setplength{toaddrwidth}{75mm}
\setplength{toaddrheight}{40mm}
\setplength{toaddrindent}{0mm}
\setplength{backaddrheight}{5mm}
\setplength{refaftervskip}{5em}
\removereffields

% Initialize sender variables with empty defaults
\newcommand{\SenderName}{}
\newcommand{\SenderAddress}{}
\newcommand{\SenderPhone}{}
\newcommand{\SenderEmail}{}
\newcommand{\SenderURL}{}
\newcommand{\SenderDepartment}{}
\newcommand{\SenderInstitute}{}
\newcommand{\SenderChair}{}
\newcommand{\SenderDate}{\today}

% Reference field variables
\newcommand{\RefYourRef}{}
\newcommand{\RefYourMail}{}
\newcommand{\RefMyRef}{}

% Commands to set sender information
\newcommand{\setname}[1]{\renewcommand{\SenderName}{#1}\setkomavar{fromname}{#1}}
\newcommand{\setaddress}[1]{\renewcommand{\SenderAddress}{#1}\setkomavar{fromaddress}{#1}}
\newcommand{\setphone}[1]{\renewcommand{\SenderPhone}{#1}\setkomavar{fromphone}{#1}}
\newcommand{\setemail}[1]{\renewcommand{\SenderEmail}{#1}\setkomavar{fromemail}{#1}}
\newcommand{\seturl}[1]{\renewcommand{\SenderURL}{#1}\setkomavar{fromurl}{#1}}
\newcommand{\setdepartment}[1]{\renewcommand{\SenderDepartment}{#1}}
\newcommand{\setinstitute}[1]{\renewcommand{\SenderInstitute}{#1}}
\newcommand{\setchair}[1]{\renewcommand{\SenderChair}{#1}}
\newcommand{\setletterdate}[1]{\renewcommand{\SenderDate}{#1}}

% Commands to set reference fields
\newcommand{\setyourref}[1]{\renewcommand{\RefYourRef}{#1}}      % Ihre Zeichen
\newcommand{\setyourmail}[1]{\renewcommand{\RefYourMail}{#1}}    % Ihr Schreiben vom
\newcommand{\setmyref}[1]{\renewcommand{\RefMyRef}{#1}}          % Unsere Zeichen

% Keep KOMA date empty - we print it manually
\setkomavar{date}{}

\pagestyle{empty}

% Header design
\setkomavar{firsthead}{%
  \begin{tikzpicture}[remember picture,overlay,shift={(current page.north west)}]
    % Horizontal line at top
    \draw[line width=0.5pt] (115mm,-22mm) -- (210mm,-22mm);
    
    % Faculty colored square
    \fill[mlugreen] (134mm,-26mm) rectangle (139mm,-31mm);
    
    % Return address line
    \draw (25mm,-50.8mm-3pt) node [below right,inner sep=0pt]
          {\fontsize{7pt}{9pt}\selectfont\sffamily Martin-Luther-Universität~Halle-Wittenberg,~06099~Halle~(Saale)};
    
    % Department/Institute info
    \draw (144mm,-26mm) node (arbeitsgruppe) [below right,inner sep=0pt] {%
      \fontsize{10pt}{12pt}\selectfont\sffamily
      \begin{tabular}{@{}l@{}}
        \ifx\SenderDepartment\empty\else\SenderDepartment\\[6pt]\fi
        \ifx\SenderInstitute\empty\else\SenderInstitute\\[6pt]\fi
        \ifx\SenderChair\empty\else\SenderChair\fi
      \end{tabular}};
    
    % Vertical line next to seal
    \coordinate (A) at (142mm,0mm);
    \coordinate (B) at (142mm,-44mm);
    \coordinate (C) at (arbeitsgruppe.south east);
    \coordinate (D) at (arbeitsgruppe.south west);
    \coordinate (E) at (intersection of A--B and C--D);
    \path let \p1 = (E), \p2 = (B), \n1 = {min(\y1,\y2)} in coordinate (F) at (\x1, \n1);
    \draw[line width=0.5pt] (142mm,0mm) -- (F);
    
    % Address field corner markers
    \fill[black]
          ($(24.1mm,-50.8mm) + (0mm,0mm)$) circle (1pt)
          ($(24.1mm,-50.8mm) + (85mm,0mm)$) circle (1pt)
          ($(24.1mm,-50.8mm) + (0mm,-40mm)$) circle (1pt)
          ($(24.1mm,-50.8mm) + (85mm,-40mm)$) circle (1pt);
    
    % Reference field labels
    \draw (25mm,-103mm) node [above right,inner sep=0pt]
          {\fontsize{7pt}{9pt}\selectfont\sffamily Ihre~Zeichen};
    \draw (60mm,-103mm) node [above right,inner sep=0pt]
          {\fontsize{7pt}{9pt}\selectfont\sffamily Ihr~Schreiben~vom};
    \draw (100mm,-103mm) node [above right,inner sep=0pt]
          {\fontsize{7pt}{9pt}\selectfont\sffamily Unsere~Zeichen};
    \draw (140mm,-103mm) node [above right,inner sep=0pt]
          {\fontsize{7pt}{9pt}\selectfont\sffamily Datum};
    
    % Reference field values
    \draw (25mm,-103mm-6pt) node [below right,inner sep=0pt] {\RefYourRef};
    \draw (60mm,-103mm-6pt) node [below right,inner sep=0pt] {\RefYourMail};
    \draw (100mm,-103mm-6pt) node [below right,inner sep=0pt] {\RefMyRef};
    
    % University seal
    \node[above right,inner sep=0pt] at (117mm,-19mm) {\includegraphics[height=12mm]{mlubriefSiegelMitText.pdf}};
    
    % Date value
    \draw (140mm,-103mm-6pt) node [below right,inner sep=0pt] {\SenderDate};
  \end{tikzpicture}%
}

% Footer design - added to every page
\AtBeginShipout{\AtBeginShipoutUpperLeft{%
  \begin{tikzpicture}[remember picture,overlay,shift={(current page.south west)}]
    % Vertical separator lines (4 columns)
    \draw[line width=0.5pt] (30mm,15mm) -- (30mm,0mm);
    \draw[line width=0.5pt] (70mm,15mm) -- (70mm,0mm);
    \draw[line width=0.5pt] (110mm,15mm) -- (110mm,0mm);
    \draw[line width=0.5pt] (150mm,15mm) -- (150mm,0mm);
    
    % Column 1: Address
    \draw (33mm,15mm) node [below right,inner sep=0pt]
          {\fontsize{7pt}{9pt}\selectfont\sffamily
           \begin{tabular}{@{}l@{}}Hausanschrift:\\\SenderAddress\end{tabular}};
    
    % Column 2: Phone
    \draw (73mm,15mm) node [below right,inner sep=0pt]
          {\fontsize{7pt}{9pt}\selectfont\sffamily
           \begin{tabular}{@{}l@{}}Tel\\\SenderPhone\end{tabular}};
    
    % Column 3: Email
    \draw (113mm,15mm) node [below right,inner sep=0pt]
          {\fontsize{7pt}{9pt}\selectfont\sffamily
           \begin{tabular}{@{}l@{}}e-mail:\\\SenderEmail\end{tabular}};
    
    % Column 4: URL
    \draw (153mm,15mm) node [below right,inner sep=0pt]
          {\fontsize{7pt}{9pt}\selectfont\sffamily
           \begin{tabular}{@{}l@{}}Internet:\\\SenderURL\end{tabular}};
  \end{tikzpicture}%
}}

\endinput
