#' Render barcodes in Shiny applications
#' 
#' @inheritParams shiny::renderImage
#' @inheritParams shiny::imageOutput
#' @param ... additional options passed to JsBarcode
#' @importFrom jsonlite toJSON
#' @importFrom shiny exprToFunction validateCssUnit
#' @export
#' 
#' 

renderBarcode <- function(expr, env=parent.frame(), quoted=FALSE, ...) {
  func <- shiny::exprToFunction(expr, env, quoted)
  options <- list(...)
  function() {
    val <- func()
    jsonlite::toJSON(list(barcode = val[1],
                          options = options), auto_unbox = TRUE)
  }
}

#'@export
#'@rdname renderBarcode
#'@importFrom shiny tag
#'

barcodeOutput <- function(outputId, width = "100%", height = "400px") {
  style <- paste("width:", shiny::validateCssUnit(width), ";", "height:", 
          shiny::validateCssUnit(height))
  
  tag("svg", list(id = outputId, style = style, class = "shiny-barcode-output"))
}