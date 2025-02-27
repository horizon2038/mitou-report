#let link_with_description(url: "example.com", description: [This is an Example]) = {
    block(width: 100%)[
        #set align(left)
        #link(url)
        #linebreak()
        #pad(left: 1em)[
            #description
        ]
    ]
    v(0.5em)
}
