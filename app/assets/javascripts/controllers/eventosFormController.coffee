class EventosFormController
  @$inject = ['$scope', '$http']

  constructor: ($scope, $http) ->
    $http.get('/evento_tipos.json').success((data) => @eventoTipos = data)

    $scope.$watch('evento.tipo', (tipo) -> $('#evento_evento_tipo_id').val(tipo.id) if tipo)

    $scope.evento = {
      tipo: {id: parseInt($('#evento_evento_tipo_id').val())}
    }

    console.log($scope.evento)

angular.module('calendarioWeb').controller('eventosFormController', EventosFormController)