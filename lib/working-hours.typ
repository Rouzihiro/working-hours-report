// lib/working-hours.typ

#let wh-tag(content) = {
  text(
    size: 0.8em,
    weight: "medium",
    fill: blue.darken(40%),
    block(
      fill: blue.lighten(90%),
      inset: (x: 0.5em, y: 0.2em),
      radius: 4pt,
      content,
    ),
  )
}

#let working-table(
  data,
  lines: false,
  row-height: auto,
  tag: none,
  numbered: false,
) = {
  let header = data.at(0)
  let body = data.slice(1)

  // Add numbering
  if (numbered) {
    header.insert(0, "Nr")
    body = body.enumerate().map(((i, row)) => (str(i + 1), ..row))
  }

  let cols = (auto,) * header.len()
  let stroke-color = luma(200)

  // Create the grid
  let table = grid(
    columns: cols,
    rows: row-height,
    inset: 0.6em,
    stroke: stroke-color,
    fill: (_, row) => if calc.odd(row) { luma(240) } else { white },
    align: (col, _) => if (numbered and col == 0) {
      horizon + end
    } else {
      horizon + start
    },

    // FIXED: Render header cells properly
    ..header.map(h => {
      // Ensure h is treated as content, not code
      grid.cell(strong(text(h)))
    }),

    grid.hline(stroke: stroke-color),
    ..body.flatten(),
    if (numbered) { grid.vline(x: 1, stroke: stroke-color) }
  )

  // Add vertical lines if requested
  if (lines) {
    show grid.cell: it => {
      it.stroke = (right: stroke-color)
    }
  }

  table
}
