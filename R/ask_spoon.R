#' Ask Spoon
#'
#' Render and preview a Spoon document. Note, this function is a wrapper
#' for the `quarto_preview()` function from the `quarto` package.
#'
#' @param spoon A character scalar of the name of the quarto file.
#'
#' @export
#'
#' @examples
#' \dontrun{ask_spoon("linearity")}
ask_spoon <- function(spoon) {
  yaml <- yamls[yamls$spoon == spoon,]

  # cat(stringr::str_trunc(yaml$desc, 30, ellipsis = "\U2026"))
  yaml
  NULL
}
