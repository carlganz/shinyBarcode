#' Include JsBarcode JS Script
#' @param cdn Indicate whether to get JsBarcode from CDN or server
#' @importFrom shiny includeScript tagList singleton
#' @export

includeJsBarcode <- function(cdn = FALSE) {
  if (cdn) {
    shiny::singleton(shiny::tagList(
      shiny::includeScript(
        "https://cdn.jsdelivr.net/jsbarcode/3.5.8/JsBarcode.all.min.js"
      ),
      shiny::includeScript(
        system.file(package = "CannaBarcode", "javascript",  "CannaBarcode.js")
      )
    ))
  } else {
    shiny::singleton(shiny::tagList(
      shiny::includeScript(
        system.file(
          package = "CannaBarcode",
          "javascript",
          "JsBarcode",
          "JsBarcode.all.min.js"
        )
      ),
      shiny::includeScript(
        system.file(package = "CannaBarcode", "javascript",  "CannaBarcode.js")
      )
    ))
  }
}