\version "2.16.2"

\header {
  title = "The Spin"
  composer = "Greg Haines"
}

lhc = \change Staff = lh
rhc = \change Staff = rh

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
                \change Staff=lh
                \relative c' { $group1 } 
                \change Staff=rh
                \relative c' { $group2 }
                }
               #})

\parallelMusic #'(partAlh partArh) {
  \tempo 4. = 60
  \splitGroup 1 <c ees>1\arpeggio <g' ees'>1\arpeggio
  \mark "accel."
  \splitGroup 1 <c ees>1\arpeggio <g' ees'>1\arpeggio
  \splitGroup 2 <c ees>2\arpeggio <g' ees'>2\arpeggio
  \splitGroup 8 <c ees>4\arpeggio <g' ees'>4\arpeggio

  \tempo 4. = 130
  \splitGroup 8 <c ees>\arpeggio <g' ees'>\arpeggio
  \splitGroup 4 <c ees>\arpeggio <g' des'>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' c>\arpeggio
  
  \splitGroup 4 <aes ees'>\arpeggio <g' ees'>\arpeggio
  \splitGroup 4 <aes ees'>\arpeggio <g' des'>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' c>\arpeggio

  \splitGroup 4 <c ees>\arpeggio <g' bes ees>\arpeggio
  \splitGroup 4 <c ees>\arpeggio <g' bes des>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' bes c>\arpeggio

  \splitGroup 4 <aes ees'>\arpeggio <g' bes ees>\arpeggio
  \splitGroup 4 <aes ees'>\arpeggio <g' bes des>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' bes c>\arpeggio

  \splitGroup 3 <c ees>\arpeggio <g' bes ees>\arpeggio
  \splitGroup 2 <c ees>\arpeggio <g' bes f'>\arpeggio
  \splitGroup 3 <c ees>\arpeggio <g' bes des>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' bes ees>\arpeggio

  \splitGroup 3 <aes ees'>\arpeggio <g' bes ees>\arpeggio
  \splitGroup 2 <aes ees'>\arpeggio <g' bes f'>\arpeggio
  \splitGroup 3 <aes ees'>\arpeggio <g' bes des>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' bes ees>\arpeggio

  \splitGroup 3 <c ees>\arpeggio <g' bes ees>\arpeggio
  \splitGroup 2 <c ees>\arpeggio <g' bes f'>\arpeggio
  \splitGroup 3 <c ees>\arpeggio <g' bes des>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' bes ees>\arpeggio

  \splitGroup 4 <g ees'>\arpeggio <g' bes des>\arpeggio
  \splitGroup 4 <aes ees'>\arpeggio <g' bes des>\arpeggio
  \splitGroup 8 <c ees>\arpeggio <g' bes c>\arpeggio
}

partBrh = \relative c' {
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
  \splitGroup 6 <c ees>4\arpeggio <g' bes c>\arpeggio
  c2 | r2
}

rh = {
  \time 4/4
  \key aes \major
  % Intro. Slowly speeds up until we hit 16th note pace
  \partArh
  \partBrh
  \partCrh
}

lh = \relative c' {
  \clef "bass"
  \key aes \major
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

