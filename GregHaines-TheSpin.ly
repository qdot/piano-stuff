\version "2.16.2"

\header {
  title = "The Spin"
  composer = "Greg Haines"
}

introChord = #(define-music-function (parser location speed repeats)
               (ly:duration? number?)
               #{
               \repeat unfold $repeats {
               \relative c' {
               \change Staff = lower
               c$speed (ees
               \change Staff = upper
               g ees') } }
               #})

aa = \relative c' {c ees g ees'}
bb = \relative c' {c16 (ees g des')}
cc = \relative c' {c16 (ees g c)}
dd = \relative c' {aes16 (ees' g ees')}
ee = \relative c' {aes16 (ees' g des')}

upper = \relative c' {
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
  \bb
  \cc
  \dd
  \ee
}

lower = \relative c' {
  \clef "bass"
  \key aes \major
  s1 * 100
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
}

