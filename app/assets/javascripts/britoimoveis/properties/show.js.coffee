Britoimoveis.Properties ?= {}

Britoimoveis.Properties.Show =
  init: ->
    $('.fotorama:not([data-auto="false"])').fotorama()

  modules: -> []
