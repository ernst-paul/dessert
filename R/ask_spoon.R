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
  # add type control character scalar
  if (nrow(yaml) == 0) {
    stop(paste("no spoon matches", spoon))
  }

  cat("id:", yaml$id, "\n")
  cat("title:", yaml$title, "\n")
  cat("description:", yaml$desc, "\n")
  cat("category:", yaml$category, "\n")
  cat("classes:", paste(yaml$classes[[1]], collapse = ", "), "\n")
  cat("parameters:", paste(names(yaml$params[[1]]), collapse = ", "), "\n")
  for (para in names(yaml$params[[1]])) {
    cat(" ", para)
    para_value = yaml$params[[1]][[para]]
    if (!is.null(para_value)) {
      cat(" =", para_value)
    }
    para_desc = yaml$params_desc[[1]][[para]]
    if (!is.null(para_desc)) {
      cat(",", para_desc)
    }
    cat("\n")
  }
  auth_names <- sapply(yaml$authors[[1]], function(x) x$name)
  cat("authors:", paste(auth_names, collapse = ", "), "\n")
  cat("format:", paste(yaml$formats[[1]], collapse = ", "))

  invisible(yaml)
}
