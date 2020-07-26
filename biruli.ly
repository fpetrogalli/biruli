% Copyright 2014-2020 - Francesco Petrogalli

% This work is licensed under CC BY-SA 4.0. To view a copy of this
% license, visit https://creativecommons.org/licenses/by-sa/4.0"}
\version "2.18.2"

Dedication = \markup {"Per Olmino"}
Title = \markup {"Birulì"}
Version = \markup {"v1.0"}
Github = \markup {\with-url #"http://github.com/fpetrogalli/biruli/releases/latest" "github.com/fpetrogalli/biruli" "-" \Version}
Composer = \markup {"Francesco Petrogalli"}
Arranger = \markup {\with-url #"http://tubafranz.me" "tubafranz.me"}
Copyright = \markup {
  \center-column {
    \line { "Copyright © 2014-2020 Francesco Petrogalli"}
    \line { "This work is licensed under CC BY-SA 4.0." }
    \line {
      "To view a copy of this license, visit"
      \with-url #"https://creativecommons.org/licenses/by-sa/4.0"
      "https://creativecommons.org/licenses/by-sa/4.0"
    }
  }
}
CCLogo = \markup {
  \general-align #Y #DOWN {
    \with-url #"https://creativecommons.org/licenses/by-sa/4.0" \epsfile #X #20 #"by-sa.eps"
  }
}
BuyMeCoffee = \markup { "Do you like it? Buy me a coffee!" \with-url #"https://ko-fi.com/tubafranz" "ko-fi.com/tubafranz"}

\header {
  dedication = \Dedication
  title = \Title
  composer = \Composer
  arranger = \Arranger
  copyright = \Copyright
  opus= \BuyMeCoffee
  meter = \Github
  poet = \CCLogo
}
\paper {
  ragged-last-bottom = ##f
  ragged-bottom = ##f
}
global = {
  \key c \major
  \time 4/4
}

right = \relative c''' {
  \global
  % Music follows here.
  R1*2 |

  c16(\p b a8)  g-. a-. g8.-^ a16~a8 g-. |
  e-. c-. e-. g-. a8.-^ g16~ g8 r |
  c16( b a8)  g-. a-. e8.-^ g16~ g8 a-. |
  g8-. e-. c-. d-. c4-. r
  c'16( b a8)  g-. a-. g8.-^ a16~a8 g-. |
  e-. c-. e-. g-. a8.-^ g16~ g8 r |
  c16( b a8)  g-. a-. e8.-^ g16~ g8 a-. |
  g8-. e-. c-. d-. c4-. r

  \acciaccatura d'32 c16-.[ r16 r16 \acciaccatura d32 c16-.] r4 r2 |
  \acciaccatura a32 g16-.[ r16 r16 \acciaccatura a32 g16-.] r4 r2 |
  \acciaccatura d'32 c16-.[ r16 r16 \acciaccatura d32 c16-.] r4 r2 |
  \acciaccatura a32 g16-.[ r16 r16 \acciaccatura a32 g16-.] r4 r2 |

  r2 \ottava #1 <c' e,>8-.\pp

}


left = \relative c {
  \global
  % Music follows here.
  c8-.\p  g'-. d-. g-. e-. g-. d-. g-. |
  c,8_\markup \italic "sempre staccato" g' d g e g d g |

  c,8 g' d g e g d g |
  c,8 g' d g e g d g |
  c,8 g' d g e g d g |
  c,8 g' d g e g d g |
  c,8 g' d g e g d g |
  c,8 g' d g e g d g |
  c,8 g' d g e g d g |
  c,8 g' d g e g d g |

  c,8 g' d g e g d g |
  c,8 g' d g e g d g |
  c,8 g' d g e g d g |
  c,8 g' d g e g d g |
  c,8.-. c16-. r4 r2 \bar "|."
}

\score {
  \new PianoStaff \with {
    %    instrumentName = "Piano"
  } <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } \right
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass \left }
  >>
  \layout { }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
}
