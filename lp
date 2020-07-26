\version "2.16.2"
% Solution 1: Using a simple markup with a particular halign value
% Drawback: It's a markup, not a dynamic command, so \dynamicDown
%           etc. will have no effect
pLeggero = \markup { \halign #1.4  \dynamic "p" \italic "leggero"}
#(set-global-staff-size 24.0)

\header {
  dedication = "Per Olmino"
  title = "Birulì"
  composer = "franZ"
  tagline= ""
}
\paper {  
  ragged-last-bottom = ##f
  ragged-bottom = ##f
}
global = {
  \key c \major
  \time 4/4
  % the actual music

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
  c8-._\pLeggero  g'-. d-. g-. e-. g-. d-. g-. |
  c,8_\markup \italic "sempre staccato" g' d g e g d g |

  c,8  g' d g e g d g |
  c,8 g' d g e g d g |
  c,8 g' d g e g d g |
  c,8 g' d g e g d g |
  c,8  g' d g e g d g |
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
