#let title_block(
    project_name: "excellent_project_name",
    creator: "excellent_creator",
    project_manager: "excellent_project_manager",
    year: 2024,
    delivery_date: datetime(year: 2025, month: 3, day: 7),
    contract_number: "123456"
) = {
    set page(
        header: [
            #h(1fr)
            #year 情財第#{contract_number}号
        ],
    )
    align(center, text(20pt)[
        #v(1fr)
        *#{year}年度未踏IT人材発掘・育成事業* \
        #v(0.3fr)
        *#project_name* \
        #v(0.3fr)
        *成果報告書* \
        #v(1fr)
        #text(15pt)[クリエータ : #creator] \ 
        #text(15pt)[担当PM  : #project_manager]
        #v(1fr)
        #text(15pt)[#{delivery_date.year()}年#{delivery_date.month()}月#{delivery_date.day()}日]
        #v(0.5fr)
    ])
}
