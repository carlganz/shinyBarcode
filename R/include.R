#' Include JsBarcode JS Script
#' @importFrom shiny includeScript
#' @export

includeJsBarcode <- function() {
  shiny::includeScript(
    system.file(package = "CannaBarcode", "javascript", "JsBarcode", "JsBarcode.all.min.js")
  )
}