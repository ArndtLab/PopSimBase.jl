using PopSimBase
using Documenter

DocMeta.setdocmeta!(PopSimBase, :DocTestSetup, :(using PopSimBase); recursive=true)

makedocs(;
    modules=[PopSimBase],
    authors="Peter Arndt <arndt@molgen.mpg.de> and contributors",
    sitename="PopSimBase.jl",
    format=Documenter.HTML(;
        canonical="https://ArndtLab.github.io/PopSimBase.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
    warnonly = [:missing_docs],
)

deploydocs(;
    repo="github.com/ArndtLab/PopSimBase.jl",
    devbranch="main",
)
