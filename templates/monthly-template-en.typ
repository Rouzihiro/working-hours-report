// templates/monthly-report.typ - Your working hours report (English/American version)
#import "../lib/working-hours.typ": working-table

#set page("a4", margin: 1cm)
#set text(8pt, font: "Victor Mono", weight: 300, lang: "en")

// Header
#align(right)[
  #image("../assets/company.png", width: 10%)
]
#align(right)[
  {DEPARTEMENT} ]

= {EMPLOYE_NAME}
= Working Hours - January 2026

// Load data directly
#let data = csv("../data/01.2026.csv")

// Generate table
#working-table(
  data,
  lines: true,
  tag: "January 2026",
  numbered: false,
)

// Optional: Add a simple summary
#v(1em)
#block(
  fill: luma(245),
  inset: 1em,
  radius: 4pt,
  [**Summary**: This document serves as official record of working hours for the month.],
)

// Footer
#v(2em)
{CITY}, {DATE}

#align(left)[
  #image("../assets/siganture.png", width: 30%)
]
