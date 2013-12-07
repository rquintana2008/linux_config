if has("gui_running")
  source $VIMRUNTIME/syntax/tex.vim
endif
source $HOME/.vim/latex_math.vim

map ;v   {WWgq}                     " formats paragraph

"set keywordprg=ispell " This does not work .. core dumps VIM
set fo=trq2                         
set ai                              "  Set autoindent
imap       <Esc>i
map! <TAB>}  <Esc>a
map  <TAB>}  <Esc>
imap <TAB>{  <Esc>i
nmap <TAB>{  lEa}<Esc>Bi
vmap <TAB>{  <Esc>`><Esc>a}<Esc>`<<Esc>i

" dc emphasizes the text {\em
map! <TAB>dc {\em don't care}
map! <TAB>dk {\em don't know}

" em emphasizes the text {\em
map! <TAB>em {\em 
map  <TAB>em <TAB>{{\em <Esc>

" bf boldfaces the test {\bf
map! <TAB>bf {\bf 
map  <TAB>bf <TAB>{{\bf <Esc>

" u underline text \underline{
map! <TAB>u  \underline{
map  <TAB>u  <TAB>{\underline{<Esc>

"single values
map! <TAB>c  ~\cite{
map  <TAB>c  <TAB>{~\cite{<Esc>
map! <TAB>i  \item
map  <TAB>i  \item <Esc>
map! <TAB>l  \label{
map  <TAB>l  <TAB>{\label{<Esc>
map! <TAB>r  ~\ref{
map  <TAB>r  <TAB>{~\ref{<Esc>

map! <TAB>s1 \section{
map  <TAB>s1 i\section{ <Esc>
map! <TAB>s2 \subsection{
map  <TAB>s2 i\subsection{ <Esc>
map! <TAB>s3 \subsubsection{
map  <TAB>s3 i\subsubsection{ <Esc>

if has("gui_running")
  "Latex Menu
  60amenu Latex.Style.emphasize\ em                <TAB>em
  60amenu Latex.Style.italics                      <TAB>it
  60amenu Latex.Style.boldface\ bf                 <TAB>bf
  60amenu Latex.Style.underline\ u                 <TAB>u
  60amenu Latex.Style.CAPS                         <TAB>{{\sc <TAB>}
  60amenu Latex.Style.Roman                        <TAB>{{\rm <TAB>}
  60amenu Latex.Style.San\ Serf                    <TAB>{{\sf <TAB>}
  60amenu Latex.Style.True\ Type                   <TAB>{{\tt <TAB>}

  60amenu Latex.Size.tiny                          <TAB>{{\tiny <TAB>}
  60amenu Latex.Size.scriptsize                    <TAB>{{\scriptsize <TAB>}
  60amenu Latex.Size.footnotesize                  <TAB>{{\footnotesize <TAB>}
  60amenu Latex.Size.small                         <TAB>{{\small <TAB>}
  60amenu Latex.Size.normalsize                    <TAB>{{\normalsize <TAB>}
  60amenu Latex.Size.large                         <TAB>{{\large <TAB>}
  60amenu Latex.Size.Large                         <TAB>{{\Large <TAB>}
  60amenu Latex.Size.LARGE                         <TAB>{{\LARGE <TAB>}
  60amenu Latex.Size.huge                          <TAB>{{\huge <TAB>}
  60amenu Latex.Size.Huge                          <TAB>{{\Huge <TAB>}
  
  "Sectioning Menu
  60amenu Latex.Sections.part                      <TAB>{\part{<TAB>}
  60amenu Latex.Sections.chapter                   <TAB>{\chapter{<TAB>}
  60amenu Latex.Sections.section                   <TAB>{\section{<TAB>}
  60amenu Latex.Sections.subsection                <TAB>{\subsection{<TAB>}
  60amenu Latex.Sections.subsubsection             <TAB>{\subsubsection{<TAB>}
  60amenu Latex.Sections.paragraph                 <TAB>{\paragraph{<TAB>}
  60amenu Latex.Sections.subparagraph              <TAB>{\subparagraph{<TAB>}
  60amenu Latex.Sections.appendix                  i\appendix
  60amenu Latex.Sections.Table\ of\ Contents       i\tableofcontents
  
  "References Menu
  60amenu Latex.References.cite                   <TAB>c
  60amenu Latex.References.label                  <TAB>l
  60amenu Latex.References.item                   <TAB>i
  60amenu Latex.References.caption                <TAB>{\caption{<TAB>}
  60amenu Latex.References.reference(to\ label)   <TAB>r
  
  60amenu Latex.BeginEnd.abstract   <ESC>i\begin{abstract}<CR>\end{abstract}<ESC>O
  60amenu Latex.BeginEnd.array      <ESC>i\begin{array}[]{}<CR>\end{array}<ESC>O
  60amenu Latex.BeginEnd.center     <ESC>i\begin{center}<CR>\end{center}<ESC>O
  60amenu Latex.BeginEnd.description <ESC>i\begin{description}<CR>\item[<CR>                                         <ESC>02cw\end{description}<ESC>j
  60amenu Latex.BeginEnd.definition  <ESC>i\begin{definition}<CR>\end{definition}<ESC>O
  60amenu Latex.BeginEnd.enumerate   <ESC>i\begin{enumerate}<CR>\item<CR><ESC>02cw\end{enumerate}<ESC>ji
  60amenu Latex.BeginEnd.example     <ESC>i\begin{example}<CR>\end{example}<ESC>O
  60amenu Latex.BeginEnd.figure      <ESC>i\begin{figure}[tb2]<CR>\begin{center}<CR> \centerline{\psfig{figure={figure.eps}}}<CR> \caption{}<CR> \label{}<CR> \end{center}<CR>\end{figure}<CR>
  
  60amenu Latex.BeginEnd.flushright  <ESC>i\begin{flushright}<CR>\end{flushright}<ESC>O
  60amenu Latex.BeginEnd.flushleft   <ESC>i\begin{flushleft}<CR>\end{flushleft}<ESC>O
  60amenu Latex.BeginEnd.itemize     <ESC>i\begin{itemize}<CR>\item<CR><ESC>02cw\end{itemize}<ESC>ji
  60amenu Latex.BeginEnd.quotation   <ESC>i\begin{quotation}<CR>\end{quotation}<ESC>O
  60amenu Latex.BeginEnd.quote       <ESC>i\begin{quote}<CR>\end{quote}<ESC>O
  60amenu Latex.BeginEnd.table       <ESC>i\begin{table}[]<CR>\end{table}[]<ESC>O
  60amenu Latex.BeginEnd.tabular  <ESC>i\begin{tabular}[]{}<CR>\end{tabular}<ESC>O
  60amenu Latex.BeginEnd.verbatim   <ESC>i\begin{verbatim}<CR>\end{verbatim}<ESC>0
  
  60amenu Latex.Break-Space.line\ break           i\linebreak
  60amenu Latex.Break-Space.page\ break           i\pagebreak
  60amenu Latex.Break-Space.new\ page             i\newpage
  60amenu Latex.Break-Space.horizontal\ space     i\hspace{}
  60amenu Latex.Break-Space.vertical\ space       i\vspace{}
  60amenu Latex.Break-Space.horizontal\ fill      i\hfill
  60amenu Latex.Break-Space.vertical\ fill        i\vfill
endif

