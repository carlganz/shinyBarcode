#' Render Receipt as HTML
#'
#' @param logo Client logo
#' @param transactionId ID of transaction
#' @param cart table of items to print
#' @param name Name of user
#' @param template rmd template
#' @importFrom rmarkdown render
#' @note For use in [CannaData](https://www.cannadata.com)
#' @export
#'

render_receipt <-
  function(logo,
           transactionId,
           cart,
           name,
           template = system.file(package = "CannaBarcode", "templates", "template.rmd")) {
    rmarkdown::render(template,
                      params = list(
                        logo = logo,
                        transactionId = transactionId,
                        cart = cart,
                        name = name
                      ))
  }

#' Generate JsBarcode
#' 
#' @param code Value to convert to barcode
#' @export
#' 

barcode <- function(code) {
  paste0('JsBarcode("#barcode", ', code,');')
}