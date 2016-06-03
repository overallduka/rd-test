
/*
 * Angular 
 */

var app = angular.module( 'contactApp' , [] );

var mainController = function($scope, $http, $window){
  var token                  = $('meta[name=csrf-token]').attr('content');
  $scope.loading             = false;
  $scope.contact             = {};
  $scope.custom_fields       = window.custom_fields;
  $scope.custom_field_values = {};

  $scope.createContact = function(){
    if( !$scope.contact.email ){
      alert( "Voce deve preencher ao menos o email" );
      return false;
    }
    $scope.loading = true;
    var params = { 
      authenticity_token:  token, 
      contact:             $scope.contact, 
      custom_field_values: $scope.custom_field_values 
    };
    $http.post( '/contacts', params ).then( function( response ) {
      $window.location.href = window.location.origin + "/contacts"; 
    }, function( response ){
      alert( response.data.error );
      $scope.loading = false;
    });

    console.log("Values: ");
    console.dir($scope.custom_field_values);
  };

};


app.controller( 'mainController', mainController );

