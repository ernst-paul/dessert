#' Get YAMLS
#'
#' @return A list.
#' @export
#'
#' @examples
#' get_yamls()
get_yamls <- function() {
  pkg_path <- fs::path_package("dessert")
  files_path <- fs::path(pkg_path, "spoon")
  files_path <- list.files(files_path, full.names = TRUE)
  yamls <- list()
  for (file_path in files_path) {
    yaml <- quarto::quarto_inspect(file_path)
    yaml_formats <- names(yaml$formats)
    yaml_items <- c(
      "title", "description", "category", "classes", "parameters",
      "parameters_description", "authors", "id"
    )
    yaml <- yaml[["formats"]][[1]][["metadata"]][yaml_items]
    yaml$formats <- yaml_formats
    yaml$path <- file_path
    yaml$name <- fs::path_ext_remove(basename(file_path))
    yamls <- append(yamls, list(yaml))
  }
  invisible(yamls)
}





