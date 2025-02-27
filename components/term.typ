#let technical_term(description, name: [Example]) = context {
    block(width: 100%)[
        #set align(left)
        *#name*
        #linebreak()
        #pad(left: 1em)[
            #description
        ]
    ]
    v(0.5em)
}
