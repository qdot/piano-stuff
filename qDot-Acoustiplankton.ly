\version "2.16.2"

\header {
  title = "Acoustiplankton"
  composer = "qDot (Kyle Machulis)"
}

rh = {
  \clef "treble"
  \time 4/4
  \key c \major
  % intro/theme
  \repeat volta 2 {
    s4 b'2. |
    s4 \times 3/3 { a'4 b'4 g'4 } |
    s4 b'2. |
    s4 \times 3/3 { a'4 b'4 g'4 }
  }
  % end
  
}

lh = \relative c' {
  \time 4/4
  \clef "bass"
  \key c \major
  % intro/theme
  \repeat volta 2 {
    f,8 c'8 s2. |
    a8 c8 s2. |
    f,8 a8 s2. |
    a8 c8 s2. |
  }
  % end
}

\score {
  \new PianoStaff <<
    \new Staff = "rh" \rh
    \new Staff = "lh" \lh
  >>
}

