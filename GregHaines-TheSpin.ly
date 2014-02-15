\version "2.16.2"

\header {
  title = "The Spin"
  composer = "Greg Haines"
}

splitGroup = #(define-music-function (parser location repeats group1 group2)
               (number? ly:music? ly:music?)
               #{
               \repeat unfold $repeats {
               \relative c' {
               \change Staff = lh
               $group1
               \change Staff = rh
               $group2 } }
               #})

introChord = #(define-music-function (parser location speed repeats)
               (ly:duration? number?)
               #{
               \repeat unfold $repeats {
               \relative c' {
               \change Staff = lh
               c$speed (ees
               \change Staff = rh
               g ees') } }
               #})

aa = \relative c' {c ees g ees'}
bb = \relative c' {c16 (ees g des')}
cc = \relative c' {c16 (ees g c)}
dd = \splitGroup 8 {aes16 (ees' } { g ees')}
ee = \relative c' {aes16 (ees' g des')}

rh = \relative c' {
  \time 4/4
  \key aes \major
  \tempo 4. = 60
  % Intro. Slowly speeds up until we hit 16th note pace
  \introChord 2 1
  \mark "accel."
  \introChord 4 2
  \introChord 8 4
  \introChord 16 4
  \tempo 4. = 130
  \introChord 16 8
  \dd
}

lh = \relative c' {
  \clef "bass"
  \key aes \major
  s1 * 100
}

\score {
  \new PianoStaff <<
    \new Staff = "rh" \rh
    \new Staff = "lh" \lh
  >>
}

