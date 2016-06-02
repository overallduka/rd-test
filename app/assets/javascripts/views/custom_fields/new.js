
/*
 * Angular 
 */

var app = angular.module( 'customFieldApp' , [] );

var mainController = function($scope, $http){
  var token                 = $('meta[name = csrf-token]').attr('content');
  $scope.custom_field       = {};
  $scope.custom_options     = [];
  $scope.custom_field_types = {
    text:      0,
    text_area: 1,
    combo_box: 2
  };

  var optionExists = function(option){
    return $scope.custom_options.indexOf( option ) != -1;
  };

  var optionValid = function(option){
    if( optionExists(option) ){
      alert("Essa opção já existe"); 
      return false;
    } else if( !option ){
      alert("Por favor preencha o campo com a opção que deseja adicionar");
      return false;
    } else {
      return true;
    } 
  }

  $scope.addOption = function(){
    var option = $scope.newOption;
    if( optionValid(option) ){
      $scope.custom_options.push( option );
      $scope.newOption = "";
    }
  };
   
};


app.controller( 'mainController', mainController );
