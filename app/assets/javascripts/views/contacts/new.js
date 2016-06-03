
/*
 * Angular 
 */

var app = angular.module( 'customFieldApp' , [] );

var mainController = function($scope, $http){
  var token                 = $('meta[name = csrf-token]').attr('content');
  $scope.loading            = false;

};


app.controller( 'mainController', mainController );

