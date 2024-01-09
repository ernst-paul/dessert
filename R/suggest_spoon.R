#' Suggest Spoon
#'
#' Suggest a spoon.
#'
#' @param object An input object.
#'
#' @export
#'
#' @examples
#' \dontrun{suggest_spoon("linearity")}
suggest_spoon <- function(object) {
  x <- yamls
  if (!missing(object)) {
    classes <- class(object)
    keep <- sapply(
      X = yamls$classes,
      FUN = function(yaml_classes) any(yaml_classes %in% classes)
    )
    x <- x[keep,]
  }

  for (i in 1:nrow(x)) {
    cat(i, x[[i, "spoon"]], "\n")
  }

  return(x)
}


