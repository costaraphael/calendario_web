class EventosController
  @$inject = ['$scope']

  constructor: ($scope) ->
    $scope.$watch('evento', (evento) -> console.log(evento))

calendario.controller('eventoController', EventosController)