class EventosFormController
  @$inject = ['$scope', '$http']

  constructor: ($scope, $http) ->
    $http.get('/evento_tipos.json').success((data) =>
      @eventoTipos = data

      $scope.evento = {
        tipo: (tipo for tipo in @eventoTipos when tipo.id is parseInt($('#evento_evento_tipo_id').val()))[0]
      }
    )

    $scope.$watch('evento.tipo', (tipo) -> $('#evento_evento_tipo_id').val(tipo.id) if tipo)

    console.log($scope.evento)

angular.module('calendarioWeb').controller('eventosFormController', EventosFormController)