#' Preview Spoon
#'
#' Render and preview a Spoon document. Note, this function is a wrapper
#' for the `quarto_preview()` function from the `quarto` package.
#'
#' @param spoon A character scalar of the name of the quarto file.
#' @inheritParams quarto::quarto_preview
#'
#' @export
#'
#' @examples
#' \dontrun{preview_spoon("linearity")}
preview_spoon <- function(
    spoon,
    render = "auto",
    port = "auto",
    host = "127.0.0.1",
    browse = TRUE,
    watch = TRUE,
    navigate = TRUE) {
  tmp_path <- tempdir()
  pkg_path <- fs::path_package("dessert")
  spoon <- sub('\\.qmd$', '', spoon)
  spoon_path <- fs::path(pkg_path, "spoon", spoon, ext = "qmd")
  if (!file.exists(spoon_path)) {
    stop(
      paste0("cannot open file \"", spoon,".qmd\": No such file or directory")
    )
  }
  file.copy(spoon_path, tmp_path)
  spoon_path <- fs::path(tmp_path, spoon, ext = "qmd")
  quarto::quarto_preview(spoon_path)
  cat(" from the quarto package or use the function quit_preview()")
}

#' @rdname preview_spoon
#' @export
quit_preview <- function() {
  quarto::quarto_preview_stop()
}
