" This file describes all the commands needed for math mode text editing in
" LaTex

" math mode the text $ $
map! <TAB>$ $
nmap <TAB>$ lEa$<Esc>Bi$<Esc>
vmap <TAB>$ <Esc>`><Esc>a$<Esc>`<<Esc>i$<Esc>
map! <TAB>[ \[
nmap <TAB>[ lEa\]<Esc>Bi\[<Esc>
vmap <TAB>[ <Esc>`><Esc>a\]<Esc>`<<Esc>i\[<Esc>
map! <TAB>be \begin{equation}
nmap <TAB>be lEa\end{equation}<Esc>Bi\begin{equation}<Esc>
vmap <TAB>be <Esc>`><Esc>a\end{equation}<Esc>`<<Esc>i\begin{equation}<Esc>
map! <TAB>o  \overline{
nmap <TAB>o  lEa}<Esc>Bi\overline{<Esc>
vmap <TAB>o  <Esc>`><Esc>a}<Esc>`<<Esc>i\overline{<Esc>

if has ("gui_running")
  70amenu Math.modes.math\ mode\ $                  <TAB>$
  70amenu Math.modes.equations(no\ number)          <TAB>[
  70amenu Math.modes.equations(numbered)            <TAB>be
  70amenu Math.modes.equation\ array(numbered)      <TAB>ba1
  70amenu Math.modes.equation\ array(no\ number)    <TAB>ba2
  
  70amenu Math.style.underline\ u                   <TAB>u
  70nmenu Math.style.overline\ o                    <TAB>{\overline{<TAB>}
  70nmenu Math.style.wide\ ~                        <TAB>{\widetilde{<TAB>}
  70nmenu Math.style.wide\ ^                        <TAB>{\widehat{<TAB>}
  70nmenu Math.style.left\ arrow                    <TAB>{\overleftarrow{<TAB>}
  70nmenu Math.style.right\ arrow                   <TAB>{\overrightarrow{<TAB>}
  70nmenu Math.style.over\ brace                    <TAB>{\overbrace{<TAB>}
  70amenu Math.style.under\ brace                   <TAB>{\underbrace{<TAB>}
  
  70amenu Math.Delimiters.(                         i\left(
  70amenu Math.Delimiters.)                         i\right)
  70amenu Math.Delimiters.{                         i\left\{
  70amenu Math.Delimiters.}                         i\right\}
  70amenu Math.Delimiters.[                         i\left[
  70amenu Math.Delimiters.]                         i\right]
  70amenu Math.Delimiters.<                         i\left<
  70amenu Math.Delimiters.>                         i\right>
  70amenu Math.Delimiters.left\ floor               i\lfloor
  70amenu Math.Delimiters.right\ floor              i\rfloor
  70amenu Math.Delimiters.left\ ceil                i\lceil
  70amenu Math.Delimiters.right\ ceil               i\rceil
  "Math Menu
  70amenu Math.Math\ Operators.sumation             i\sum
  70amenu Math.Math\ Operators.product              i\prod
  70amenu Math.Math\ Operators.inv\ product         i\coprod
  70amenu Math.Math\ Operators.logical\ or          i\bigvee
  70amenu Math.Math\ Operators.logical\ and         i\bigvee
  70amenu Math.Math\ Operators.union                i\bigcup
  70amenu Math.Math\ Operators.intersection         i\bigcap
  70amenu Math.Math\ Operators.union\ with\ +       i\biguplus
  70amenu Math.Math\ Operators.square\ union        i\bigsqcup
  70amenu Math.Math\ Operators.square\ intersection i\bigsqcap
  70amenu Math.Math\ Operators.xor                  i\bigoplus
  70amenu Math.Math\ Operators.xnor                 i\bigotimes
  70amenu Math.Math\ Operators.circle\ with\ dot    i\bigodot
  70amenu Math.Math\ Operators.integration          i\int
  70amenu Math.Math\ Operators.o\ integration       i\oint
  70amenu Math.Math\ Operators.limit                i\lim
  
  70amenu Math.Operators.plus/minus                 i\pm
  70amenu Math.Operators.minus/plus                 i\mp
  70amenu Math.Operators.minus/plus                 i\mp
  70amenu Math.Operators.division                   i\div
  70amenu Math.Operators.times                      i\times
  70amenu Math.Operators.logical\ not               i\neg
  70amenu Math.Operators.logical\ or                i\lor
  70amenu Math.Operators.logical\ and               i\lor
  70amenu Math.Operators.xor                        i\oplus
  70amenu Math.Operators.xnor                       i\otimes
  70amenu Math.Operators.circle\ with\ -            i\ominus
  70amenu Math.Operators.circle\ with\ /            i\oslash
  70amenu Math.Operators.circle\ with\ dot          i\odot
  
  70amenu Math.Relations.negate\ relation           i\not
  70amenu Math.Relations.equivalent                 i\equiv
  70amenu Math.Relations.approx                     i\approx    
  70amenu Math.Relations.not\ equal                 i\ne    
  70amenu Math.Relations.dot\ equal                 i\doteq    
  70amenu Math.Relations.proportial\ to             i\propto
  70amenu Math.Relations.similar\ to                i\sim
  70amenu Math.Relations.similar\ equal             i\simeq
  70amenu Math.Relations.less\ than\ equal          i\le
  70amenu Math.Relations.greater\ than\ equal       i\ge
  70amenu Math.Relations.much\ less\ than           i\ll
  70amenu Math.Relations.much\ greater\ than        i\gg
  70amenu Math.Relations.if\ and\ only\ if          i\iff
  
  70amenu Math.Probability.small\ choose            i\left({}^{n}_{2}\right)
  70amenu Math.Probability.large\ choose            i\left(\begin{array}{c}n\\2\end{array}\right)
  
  70amenu Math.Sets.set                             i\{ \}
  70amenu Math.Sets.for\ all                        i\forall
  70amenu Math.Sets.there\ exists                   i\exists
  70amenu Math.Sets.union                           i\cup
  70amenu Math.Sets.intersection                    i\cap
  70amenu Math.Sets.union\ with\ +                  i\uplus
  70amenu Math.Sets.square\ union                   i\sqcup
  70amenu Math.Sets.square\ intersection            i\sqcap
  70amenu Math.Sets.subset                          i\subset       
  70amenu Math.Sets.superset                        i\supset       
  70amenu Math.Sets.subset\ equal                   i\subseteq       
  70amenu Math.Sets.superset\ equal                 i\supseteq       
  70amenu Math.Sets.square\ subset                  i\sqsubset
  70amenu Math.Sets.square\ superset                i\sqsupset
  70amenu Math.Sets.square\ subset\ equal           i\sqsubseteq       
  70amenu Math.Sets.square\ superset\ equal         i\sqsupseteq       
  70amenu Math.Sets.element\ of                     i\in
  70amenu Math.Sets.not\ element\ of                i\notin
  
  70amenu Math.Symbols.infinity                     i\infty
  70amenu Math.Symbols.alphabet                     i\aleph
  70amenu Math.Symbols.relation                     i\Re
  70amenu Math.Symbols.partial                      i\partial
  70amenu Math.Symbols.impartial                    i\impartial
  70amenu Math.Symbols.empty\ set(null)             i\emptyset
   
  70amenu Math.Arrows.left\ arrow                   i\leftarrow
  70amenu Math.Arrows.right\ arrow                  i\rightarrow
  70amenu Math.Arrows.up\ arrow                     i\uparrow
  70amenu Math.Arrows.down\ arrow                   i\downarrow
  70amenu Math.Arrows.large\ left\ arrow            i\Leftarrow
  70amenu Math.Arrows.large\ right\ arrow           i\Rightarrow
  70amenu Math.Arrows.large\ up\ arrow              i\Uparrow
  70amenu Math.Arrows.large\ down\ arrow            i\Downarrow
  
  70amenu Math.Variable\ Accents.'(acute)           i\acute{}
  70amenu Math.Variable\ Accents.bar                i\bar{}
  70amenu Math.Variable\ Accents.breve(frown)       i\breve{}
  70amenu Math.Variable\ Accents.check              i\check{}
  70amenu Math.Variable\ Accents.dot                i\dot{}
  70amenu Math.Variable\ Accents.double\ dot        i\ddot{}
  70amenu Math.Variable\ Accents.`(grave)           i\grave{}
  70amenu Math.Variable\ Accents.hat                i\hat{}
  70amenu Math.Variable\ Accents.tilde              i\tilde{}
  70amenu Math.Variable\ Accents.vec                i\vec{}
  
  70amenu Math.Geometry.perpendicular               i\perp
  70amenu Math.Geometry.parallel                    i\parallel
  70amenu Math.Geometry.left\ angle                 i\langle
  
  70amenu Math.lower\ case\ Greek.alpha             i\alpha
  70amenu Math.lower\ case\ Greek.beta              i\beta
  70amenu Math.lower\ case\ Greek.gamma             i\gamma
  70amenu Math.lower\ case\ Greek.delta             i\delta
  70amenu Math.lower\ case\ Greek.epsilon           i\epsilon
  70amenu Math.lower\ case\ Greek.eta               i\eta
  70amenu Math.lower\ case\ Greek.theta             i\theta
  70amenu Math.lower\ case\ Greek.iota              i\iota
  70amenu Math.lower\ case\ Greek.kappa             i\kappa
  70amenu Math.lower\ case\ Greek.lambda            i\lambda
  70amenu Math.lower\ case\ Greek.mu                i\mu
  70amenu Math.lower\ case\ Greek.nu                i\nu
  70amenu Math.lower\ case\ Greek.xi                i\xi
  70amenu Math.lower\ case\ Greek.o                 i\o
  70amenu Math.lower\ case\ Greek.pi                i\pi
  70amenu Math.lower\ case\ Greek.rho               i\rho
  70amenu Math.lower\ case\ Greek.sigma             i\sigma
  70amenu Math.lower\ case\ Greek.tau               i\tau 
  70amenu Math.lower\ case\ Greek.upsilon           i\upsilon
  70amenu Math.lower\ case\ Greek.phi               i\phi
  70amenu Math.lower\ case\ Greek.chi               i\chi
  70amenu Math.lower\ case\ Greek.psi               i\psi
  70amenu Math.lower\ case\ Greek.omega             i\omega
  70amenu Math.lower\ case\ Greek.varepsilon        i\varepsilon
  70amenu Math.lower\ case\ Greek.vartheta          i\vartheta
  70amenu Math.lower\ case\ Greek.varpi             i\varpi
  70amenu Math.lower\ case\ Greek.varrho            i\varrho 
  70amenu Math.lower\ case\ Greek.varsigma          i\varsigma
  70amenu Math.lower\ case\ Greek.varphi            i\varphi 
  70amenu Math.lower\ case\ Greek.zeta              i\zeta
  
  70amenu Math.upper\ case\ Greek.Gamma             i\Gamma
  70amenu Math.upper\ case\ Greek.Delta             i\Delta
  70amenu Math.upper\ case\ Greek.Theta             i\Theta
  70amenu Math.upper\ case\ Greek.Lambda            i\Lambda
  70amenu Math.upper\ case\ Greek.Xi                i\Xi
  70amenu Math.upper\ case\ Greek.Pi                i\Pi
  70amenu Math.upper\ case\ Greek.Sigma             i\Sigma
  70amenu Math.upper\ case\ Greek.Upsilon           i\Upsilon
  70amenu Math.upper\ case\ Greek.Phi               i\Phi    
  70amenu Math.upper\ case\ Greek.Psi               i\Psi    
  70amenu Math.upper\ case\ Greek.Omega             i\Omega  
  
  70amenu Math.Miscellaneous.lower\ dots            i\ldots
  70amenu Math.Miscellaneous.center\ dots           i\cdots
  70amenu Math.Miscellaneous.diagnol\ dots          i\ddots
  70amenu Math.Miscellaneous.vertical\ dots         i\vdots
  70amenu Math.Miscellaneous.copyright              i\copyright
  70amenu Math.Miscellaneous.small\ dot             i\cdot
  70amenu Math.Miscellaneous.circle                 i\circ
  70amenu Math.Miscellaneous.big circle             i\bigcirc
  70amenu Math.Miscellaneous.bullet                 i\bullet
  70amenu Math.Miscellaneous.diamond                i\diamond
  70amenu Math.Miscellaneous.triangle               i\bigtriangleup
  70amenu Math.Miscellaneous.upside-down triangle   i\bigtriangdown
  70amenu Math.Miscellaneous.left triangle          i\triangleleft
  70amenu Math.Miscellaneous.right triangle         i\triangleright
  70amenu Math.Miscellaneous.astrick                i\ast
  70amenu Math.Miscellaneous.dagger                 i\dagger
  70amenu Math.Miscellaneous.double\ dagger         i\ddagger
  70amenu Math.Miscellaneous.checkmark              i\surd
  70amenu Math.Miscellaneous.paragraph              i\P
  70amenu Math.Miscellaneous.sentence               i\S
endif
