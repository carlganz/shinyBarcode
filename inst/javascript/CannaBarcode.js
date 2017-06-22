var barcodeOutputBinding = new Shiny.OutputBinding();
$.extend(barcodeOutputBinding, {
  find: function(scope) {
    return $(scope).find('.shiny-barcode-output');
  },
  renderValue: function(el, data) {
    $(el).JsBarcode(data.barcode, data.options);
  }
});
Shiny.outputBindings.register(barcodeOutputBinding, "Canna.barcodeOutputBinding");