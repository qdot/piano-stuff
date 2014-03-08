\version "2.16.2"

\header {
  title = "Solêr"
  composer = "Otto A Totland"
}

lhc = \change Staff = lh
rhc = \change Staff = rh

rhpa = {
  r8 b' bes aes es4 |
  des2 r4 |
  b8 des ees ges bes r8 |
  bes b bes aes ees des |
  ees2 r4 |
  r4 ees'4 des |
  des8 b ges4 ees |
  f8 ges aes ees des ees |
}

rhpb = {
  r4 c des |
  r4 des ees |
  ees8 des ees ges bes4 |
  bes8 aes ees4 des4 |
  r4 c des |
  r4 des ees |
  ees8 des ees ges bes b |
  bes aes ees4 des4 |
}

rh = \relative c' {
  \time 6/8
  \key des \major
  \repeat volta 2 {
    r2. | r2. | r2. | r2.
  }
  \break
  \repeat volta 2 {
    \rhpa
  }
  \break
  \repeat volta 2 {
    \rhpb
  }
  \break
  \repeat volta 2 {
    s2 ees8 ges |
    s2 ees8 b' |
    s2 ees,8 aes |
    s2 ees8 bes' |
  }
  \break
  \relative c'' {
    \repeat volta 2 {
      \rhpa
    }
    \break
    \repeat volta 2 {
      \rhpb
    }
    \break
    s4 aes8 bes b aes |
    bes b ees aes aes, bes |
    b s8 s2
  }

}

lhp = {
  aes,8 ees' bes' ees, aes ees  |
  bes ees g ees aes ees |
  b ees ges ees bes' ees, |
  des ees aes ees f aes |
}

lh = \relative c' {
  \clef "bass"
  \key des \major
  \repeat volta 2 {
    \lhp
  }
  \repeat unfold 2 {
    \repeat volta 2 {
      \repeat unfold 2 {
        \lhp
      }
    }
  }
  \repeat volta 2 {
    aes,8 ees' bes' b s4 |
    aes,8 ees' bes' b s4 |
    aes,8 ees' bes' b s4 |
    aes,8 ees' bes' b s4 |
  }
  \relative c'' {
    \repeat unfold 2 {
      \repeat volta 2 {
        \repeat unfold 2 {
          \lhp
        }
      }
    }
    aes,8 ees' s2 |
    s2. |
    s8 ees8 aes,2
  }
}

\score {
  \new PianoStaff <<
    \new Staff = "rh" \rh
    \new Staff = "lh" \lh
  >>
}

