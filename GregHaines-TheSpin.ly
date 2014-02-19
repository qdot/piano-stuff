\version "2.16.2"

\header {
  title = "The Spin"
  composer = "Greg Haines"
}

splitGroup = #(define-music-function (parser location repeats group1 group2)
               (number? ly:music? ly:music?)
               #{
               \repeat unfold $repeats { \relative c' { $group1 } } |
               \repeat unfold $repeats { \relative c' { $group2 } } |
               #})

splitChords = #(define-music-function (parser location repeats group1 group2)
               (number? ly:music? ly:music?)
                #{
                \repeat unfold $repeats {
                \override Stem #'(details beamed-lengths) = #'(1.5)
                \change Staff=lh
                \relative c' { \stemUp $group1 } 
                \change Staff=rh
                \relative c' { \stemDown $group2 }
                \revert Stem #'details
                }
               #})

\parallelMusic #'(partAlh partArh) {
  \tempo 4. = 60
  \mark "A"
  \splitGroup 1 <c ees>1\arpeggio <g' ees'>1\arpeggio
  \splitGroup 1 <c ees>1\arpeggio <g' ees'>1\arpeggio^"accel."
  \splitGroup 2 <c ees>2\arpeggio <g' ees'>2\arpeggio
  \splitGroup 8 <c ees>4\arpeggio <g' ees'>4\arpeggio
  
  \tempo 4. = 130
  \mark "B"
  \splitGroup 8 <c ees>\arpeggio <g' ees'>\arpeggio
  \splitGroup 4 <c ees>\arpeggio <g' d'>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' c>\arpeggio

  \splitGroup 4 <aes ees'>\arpeggio <g' ees'>\arpeggio
  \splitGroup 4 <aes ees'>\arpeggio <g' d'>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' c>\arpeggio

  \mark "C"
  \splitGroup 4 <c ees>\arpeggio <g' bes ees>\arpeggio
  \splitGroup 4 <c ees>\arpeggio <g' bes d>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' bes c>\arpeggio

  \splitGroup 4 <aes ees'>\arpeggio <g' bes ees>\arpeggio
  \splitGroup 4 <aes ees'>\arpeggio <g' bes d>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' bes c>\arpeggio

  \splitGroup 3 <c ees>\arpeggio <g' bes ees>\arpeggio
  \splitGroup 2 <c ees>\arpeggio <g' bes f'>\arpeggio
  \splitGroup 3 <c ees>\arpeggio <g' bes d>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' bes ees>\arpeggio

  \splitGroup 3 <aes ees'>\arpeggio <g' bes ees>\arpeggio
  \splitGroup 2 <aes ees'>\arpeggio <g' bes f'>\arpeggio
  \splitGroup 3 <aes ees'>\arpeggio <g' bes d>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' bes ees>\arpeggio

  \splitGroup 3 <c ees>\arpeggio <g' bes ees>\arpeggio
  \splitGroup 2 <c ees>\arpeggio <g' bes f'>\arpeggio
  \splitGroup 3 <c ees>\arpeggio <g' bes d>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' bes ees>\arpeggio

  \splitGroup 4 <g ees'>\arpeggio <g' bes d>\arpeggio
  \splitGroup 4 <aes ees'>\arpeggio <g' bes d>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' bes c>\arpeggio
}

partBrh = \relative c' {
  \mark "D"
  \splitChords 1 <c,>16 <g' bes c>8.\arpeggio
  \splitChords 7 <c ees f>16 <g' bes c>8.\arpeggio 
  \splitChords 1 <bes,>16 <g' bes c>8.\arpeggio
  \splitChords 7 <c ees g>16 <g' bes c>8.\arpeggio 
  \splitChords 1 <aes,>16 <g' bes c>8.\arpeggio
  \splitChords 7 <c ees aes>16 <g' bes c>8.\arpeggio 

  \splitChords 1 <c,>16 <g' bes c>8.\arpeggio
  \splitChords 7 <c ees f>16 <g' bes c>8.\arpeggio 
  \splitChords 1 <bes,>16 <g' bes c>8.\arpeggio
  \splitChords 7 <c ees g>16 <g' bes c>8.\arpeggio 
  \splitChords 1 <aes,>16 <g' bes c>8.\arpeggio
  \splitChords 7 <c ees aes>16 <g' bes c>8.\arpeggio 

  \splitChords 1 <c,>16 <g' bes c>8.\arpeggio
  \splitChords 7 <c ees f>16 <g' bes c>8.\arpeggio 
}

partBlh = { s1 * 14 }

\parallelMusic #'(partClh partCrh) {
  \splitGroup 6 <c ees>4\arpeggio <g' c>\arpeggio
  c2 | r2 |

  \mark "E"
  \splitGroup 4 <c ees>4\arpeggio <aes' aes'>\arpeggio
  \splitGroup 4 <c ees>4\arpeggio <c' c'>\arpeggio
  \splitGroup 8 <c ees>4\arpeggio <g' g'>\arpeggio

  \splitGroup 4 <c ees>4\arpeggio <aes' aes'>\arpeggio
  \splitGroup 4 <c ees>4\arpeggio <c' c'>\arpeggio
  \splitGroup 8 <c ees>4\arpeggio <g' g'>\arpeggio

  \mark "F"
  \splitGroup 6 <f, c'>4\arpeggio <aes' aes'>\arpeggio
  \splitGroup 2 <g ees'>4\arpeggio <c' c'>\arpeggio
  \splitGroup 8 <aes ees'>4\arpeggio <g' g'>\arpeggio

  \splitGroup 1 <c,>4\arpeggio <aes' aes'>\arpeggio
  \splitGroup 3 <c ees>4\arpeggio <aes' aes'>\arpeggio
  \splitGroup 4 <c ees>4\arpeggio <c' c'>\arpeggio
  \splitGroup 1 <c,>4\arpeggio <g' g'>\arpeggio
  \splitGroup 7 <c ees>4\arpeggio <g' g'>\arpeggio

  \splitGroup 1 <c,>4\arpeggio <aes' aes'>\arpeggio
  \splitGroup 3 <c ees>4\arpeggio <aes' aes'>\arpeggio
  \splitGroup 4 <c ees>4\arpeggio <c' c'>\arpeggio
  \splitGroup 1 <c,>4\arpeggio <g' g'>\arpeggio
  \splitGroup 7 <c ees>4\arpeggio <g' g'>\arpeggio

  \mark "G"
  \splitGroup 6 <f, c'>4\arpeggio <aes' aes'>\arpeggio
  \splitGroup 2 <g ees'>4\arpeggio <c' c'>\arpeggio
  \splitGroup 8 <ees bes ees'>4\arpeggio <g' g'>\arpeggio

}

rh = {
  \time 4/4
  \key ees \major
  % Intro. Slowly speeds up until we hit 16th note pace
  \partArh
  \partBrh
  \partCrh
}

lh = \relative c' {
  \clef "bass"
  \key ees \major
  \partAlh
  \partBlh
  \partClh
}

\score {
  \new PianoStaff <<
    \set PianoStaff.connectArpeggios = ##t
    \new Staff = "rh" \rh
    \new Staff = "lh" \lh
  >>
}

