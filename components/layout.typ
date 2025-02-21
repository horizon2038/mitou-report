#import "/components/title.typ" : title_block
#import "/components/toc.typ" : toc

#let template(
    project_name: "excellent_project_name",
    creator: "excellent_creator",
    project_manager: "excellent_project_manager",
    year: 2024,
    delivery_date: datetime(year: 2025, month: 3, day: 7),
    contract_number: "123456",
    doc
) = {
    // page global settings
    set page(
        margin: (x: 8em, y: 8em),
    )
    set par(
        leading: 1.24em,
        first-line-indent: 0em,
    )
    set math.equation(
        numbering: "(1.1)"
    )

    // heading style settings
    show heading.where(level: 1): it => {
        let current_chapter_number = counter(heading.where()).at(here()).first()

        pagebreak(to: "odd", weak: true)
        block(width:100%)[
            #set align(right)
            #set text(20pt, weight: "bold")
            #v(5%)
            #text(40pt)[#current_chapter_number]
            #v(1%)
            #it.body
            #v(5%)
        ]
    }
    show heading.where(level: 2): it => {
        block(width:100%)[
            #v(1em)
            #set align(left)
            #set text(15pt, weight: "regular")
            #it
            #v(1em)
        ]
    }
    show heading.where(level: 3): it => {
        block(width:100%)[
            #v(1em)
            #set align(left)
            #set text(13pt, weight: "regular")
            #it
            #v(1em)
        ]
    }
    set heading(numbering: "1.")

    // font settings
    // body
    /*
    set text(
        font: "<font>",
    )
    */
    // code 
    /*
    show raw: set text(font: "<monospace font>")
    */

    // code block settings
    show raw: set block(fill: luma(240), inset: 2em, radius: 0.5em, width: 100%)

    title_block(
        project_name: project_name,
        creator: creator,
        project_manager: project_manager,
        year: year,
        delivery_date: delivery_date,
        contract_number: contract_number
    )

    toc()

    // section-specific page settings (without title, toc)
    set page(
        header: [
            #block(width: 100%, stroke: (bottom: (thickness: 0.5pt, cap: "butt")), inset: 1em)[
                #set text(10.5pt)
                #h(1fr)
                #context {
                    // search current chapter
                    let current_chapter = query(heading.where(level: 1))
                        .filter(it =>
                            // filter out chapters that are after the current page
                            it
                            .location()
                            .page() <= here().page()
                        )
                        .at(-1, default: none) // get the last chapter
                    let page_number = counter(page).at(here()).first()

                    if current_chapter == none {
                        ""
                    } else {
                        if calc.even(page_number) {
                            current_chapter.body
                        } else {
                        }
                    }
                 }
            ]
        ],
        numbering: {
            "1"
        },
        number-align: center,
        footer: context {
            let page_number = counter(page).at(here()).first()
            align(center, [#page_number])
        }
    )

    pagebreak()
    counter(page).update(1)

    // extract the content of the document
    doc
}
