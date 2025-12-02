// templates/monthly-report.typ - Your working hours report
#import "../lib/working-hours.typ": working-table

#set page("a4", margin: 1cm)
#set text(8pt, font: "Victor Mono", weight: 300, lang: "de")

// Header
#align(right)[
  #image("../assets/BG.png", width: 30%)
]
#align(right)[
  Unfallchirurgie, Orthopädie und Sporttraumatologie ]

= Zoh, Rou
= Arbeitszeit - Dezember 2025

// Load data directly
#let data = csv("../data/12.2025.csv")

// Generate table
#working-table(
  data,
  lines: true,
  tag: "Dezember 2025",
  numbered: false,
)

// Optional: Add a simple summary
#v(1em)
#block(
  fill: luma(245),
  inset: 1em,
  radius: 4pt,
)

// Footer
#v(2em)
Hamburg, den 30.12.2025

#align(left)[
  #image("../assets/US.png", width: 30%)
]
