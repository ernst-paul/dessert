# This script creates a tibble with the yamls information of the spoons.

library(fs)
library(tibble)
library(rmarkdown)

yamls <- tibble::tibble(
  id          = character(),
  spoon       = character(),
  title       = character(),
  desc        = character(),
  category    = character(),
  classes     = list(),
  params      = list(),
  params_desc = list(),
  authors     = list(),
  formats     = list()
)

pkg_path <- fs::path_package("dessert")
files_path <- fs::path(pkg_path, "spoon")
files_path <- list.files(files_path, full.names = TRUE)

for (file_path in files_path) {
  yaml <- rmarkdown::yaml_front_matter(file_path)
  yamls <- tibble::add_row(
    yamls,
    id          = yaml$id,
    spoon       = base::sub("\\.qmd$", "", basename(file_path)),
    title       = yaml$title,
    desc        = yaml$description,
    category    = yaml$category,
    classes     = list(yaml$classes),
    params      = list(yaml$parameters),
    params_desc = list(yaml$parameters_description),
    authors     = list(yaml$authors),
    formats     = list(names(yaml$format))
  )
}

usethis::use_data(yamls, internal = TRUE, overwrite = TRUE)
