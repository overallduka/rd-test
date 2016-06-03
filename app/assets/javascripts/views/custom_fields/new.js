
/*
 * Angular 
 */

var app = angular.module( 'customFieldApp' , [] );

var mainController = function($scope, $http, $window, $location){
  var token                 = $('meta[name = csrf-token]').attr('content');
  $scope.loading            = false;
  $scope.custom_field       = {};
  $scope.custom_options     = [];
  $scope.custom_field_types = {
    text:      0,
    text_area: 1,
    combo_box: 2
  };

  /*
   * View methods
   */ 
  $scope.addOption = function(){
    var option = $scope.newOption;
    if( optionValid(option) ){
      $scope.custom_options.push( option );
      $scope.newOption = "";
    }
  };

  $scope.removeOption = function(option){
    var index = $scope.custom_options.indexOf( option );
    $scope.custom_options.splice( index, 1 );
  };

  $scope.saveCustomField = function(){
    if( comboNoOptions() ){
      alert("Necessário criar ao menos uma opção para caixa de seleção");
      return false;
    }
    $scope.loading = true;
    $scope.custom_field.custom_field_type = parseInt($scope.custom_field.custom_field_type);
    var params = {
      authenticity_token: token,
      custom_field:       $scope.custom_field,
      custom_options:     $scope.custom_options
    };

    $http.post( '/custom_fields', params ).then( function( response ){
      $window.location.href = window.location.origin + "/custom_fields"; 
    });
  };

  /*
   * Protected methods
   */

  var comboNoOptions = function(){
    var isCombo = ( $scope.custom_field_types.combo_box === parseInt($scope.custom_field.custom_field_type) );
    console.log(" is combo" + isCombo);
    return ( isCombo && !$scope.custom_options.length );
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
  };

};


app.controller( 'mainController', mainController );
