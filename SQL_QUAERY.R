library(WikidataR)
sparql_query <- extract_example(c("Cats", "Horses"))
WikidataR::get_example(example_name = c("Cats", "Horses"))
