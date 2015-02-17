angular.module('calendarioWeb', ['ngAnimate', 'ngResource'])

ready = ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])

$(document).on 'page:load', ready