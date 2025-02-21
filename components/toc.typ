// Definition of chapter outline
#let toc() = {
  set text(size: 12pt)
  set par(leading: 1.24em, first-line-indent: 0pt)
  text(size: 15pt)[目次 \ ]
  v(0.5fr)
  context {
    let loc = here()
    let elements = query(heading.where(outlined: true))

    for el in elements {
      let before_toc = query(heading.where(outlined: true).before(loc)).find((one) => {one.body == el.body}) != none

      let page_num = if before_toc {
        numbering("1", counter(page).at(el.location()).first())
      } else if (el.level >= 1) and (el.level <= 3) {
        counter(page).at(el.location()).first()
      } else {
      }

      link(el.location())[#{
        // acknoledgement has no numbering
        let chapt_num = if el.numbering != none {
          numbering(el.numbering, ..counter(heading).at(el.location()))
        } else {none}

        if el.level == 1 {
          set text(weight: "black")
          if chapt_num == none {} else {
            chapt_num
            "  "
          }
          el.body
        } else if el.level == 2 {
          h(1em)
          chapt_num
          " "
          el.body
        } else {
          h(2em)
          chapt_num
          " "
          el.body
        }
      }]
      box(width: 1fr, h(0.5em) + box(width: 1fr, repeat[.]) + h(0.5em))
      [#page_num]
      linebreak()
    }
  }
  v(1fr)
}

