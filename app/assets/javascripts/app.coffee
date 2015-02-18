angular.module('calendarioWeb', ['ngAnimate', 'ngResource'])

ready = ->
  $('[data-toggle="tooltip"]').tooltip()

$(document).ready ready

$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
  ready()