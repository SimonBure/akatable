#let academic-table(
  caption,
  cells,
  stroke-strength:1pt,
  header: (),
  footer: (),
  label:none,
  ..args
  ) = {
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
        stroke: none,
        table.header(
          table.hline(),
          ..header,
          table.hline(),
        ),
        ..cells,
        if footer != () {
          table.footer(
            table.hline(),
            ..footer,
          )
        },
        table.hline()
      ),
      caption: caption,
    ) #label
  ]
}