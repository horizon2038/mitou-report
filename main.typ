#import "/components/layout.typ" : template

#template(
    project_name: [天才的なアイデアによる未踏的なシステムの実装],
    creator: "未踏太郎",
    project_manager: "未踏花子",
    year: 2024,
    delivery_date: datetime(year: 2025, month: 3, day: 7),
    contract_number: "000",
    [
        #include "/pages/summary.typ"
        #include "/pages/background_and_objectives.typ"
        #include "/pages/project_overview.typ"
        #include "/pages/development_details.typ"
        #include "/pages/features_of_development_results.typ"
        #include "/pages/future_challenges_and_prospects.typ"
        #include "/pages/differences_from_the_original_implementation_plan.typ"
        // 複数人プロジェクトの場合に使用
        #include "/pages/development_responsibilities.typ"
        #include "/pages/self_analysis_of_glowth.typ"
        // 秘匿ノウハウが含まれる場合に使用
        #include "/pages/designation_of_confidential_know_how.typ"
        // 特記事項が存在する場合に使用
        #include "/pages/others.typ"
        #include "/pages/appendix.typ"
    ],
)
