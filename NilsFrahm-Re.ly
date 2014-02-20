\version "2.16.2"

\header {
  title = "Re"
  composer = "Nils Frahm"
}

lhc = \change Staff = lh
rhc = \change Staff = rh

rh = \relative c' {
  \time 12/8
  \key e \major
  \repeat volta 2 { r2. r2 fis8 cis' |
  cis8 b4 b8 a4 gis8 fis4 fis4 b8 |
  gis8 a8 fis8 fis2.. cis'8 cis8 |
  b4 b8 a4 gis8 fis4 fis4 fis4 |
  r2. r2 cis'8 cis |
  cis8 b4 b8 a4 gis8 fis4 fis4 b8 |
  gis8 a8 fis8 fis2.. cis'8 cis8 |
  b4 b8 a4 gis8 fis4 fis4 fis4 |
  r1. |  }
}

lh = \relative c' {
  \clef "bass"
  \key e \major
  \repeat volta 2 { r1. |
  < a cis >2. < b dis  >2. |
  < a cis >2.  < b dis  >2. |
  < a cis >2.  < b dis  >2. |
  < fis cis'>2. cis'4. fis,4. |
  < a d >2. < gis cis e >2. |
  < fis a cis >2.  < e a cis  >2. |
  < a d >2.  < gis cis e  >2. |
  < fis b dis>2. b4. fis4. }
}

\score {
  \new PianoStaff <<
    \new Staff = "rh" \rh
    \new Staff = "lh" \lh
  >>
}

