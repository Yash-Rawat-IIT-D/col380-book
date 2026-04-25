% ppbook.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ppbook}[2026/01/26 Parallel Programming Book Class]

% --- option handling must happen BEFORE \LoadClass ---
\newif\ifppdraft
\ppdraftfalse

\DeclareOption{draft}{\ppdrafttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

% Base class AFTER processing options
\LoadClass[10pt,oneside,openany]{book}

% Now it is safe to load packages
\RequirePackage{styles/ppbook}
