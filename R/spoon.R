#' Spoon
#'
#' Run a spoon.
#'
#' @param spoon An input object.
#'
#' @export
#'
#' @examples
#' \dontrun{suggest_spoon("linearity")}
spoon <- function(spoon, output_path = NULL) {
  # perform suggest_spoon()
  pkg_path <- fs::path_package("dessert")
  spoon_path <- fs::path(pkg_path, "spoon", spoon, ext = "qmd")

  if (is.null(output_path)) {
    if (!rstudioapi::isAvailable()) {
      output_path <- getwd()
    } else {
      output_path <- rstudioapi::getSourceEditorContext()$path
      if (is.null(output_path)) {
        output_path <- getwd()
      } else {
        output_path <- dirname(output_path)
      }
    }
  }
  if (!dir.exists(output_path)) {
    stop("output path does not exist")
  }
  output_path <- fs::path(output_path, paste("spoon", spoon, sep = "_"))
  if (dir.exists(output_path)) {
    base_path <- output_path
    i <- 1
    while (dir.exists(output_path) & i <= 10000) {
      output_path <- paste(base_path, i, sep = "_")
      i <- i + 1
    }
  }
  dir.create(output_path)
}
