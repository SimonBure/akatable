#let academic-table(caption, cells, header: none, footer: none, stroke-strength:1pt, label:none, ..args) ={
  let columns = args.named().at("columns", default: 1)
  let n-cols = if type(columns) == int {
    columns
  } else {
    columns.len()
  }
  let n-rows = calc.ceil(cells.len() / n-cols)

  set figure.caption(position: top)

  [
    #figure(
      table(
        columns: columns,
        ..args,
        stroke: (_, y) => if y == 0 {(top: stroke-strength, bottom: stroke-strength)} else if y == n-rows {(bottom: stroke-strength)} else {none},
        table.header(
          ..header,
        ),
        ..cells,
        table.footer(
          ..footer,
        ),
      ),
      caption: caption,
    ) #label]
}