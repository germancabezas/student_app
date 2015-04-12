(function() {
  "use strict";

  angular.module("app").controller("courseCtrl", function($scope, $http, $sce, FileUploader){
   
    $scope.showAlphabetSearch = function() {
      $scope.alphabetVisible =  !$scope.alphabetVisible;
    };


    window.scope = $scope;
  });

}());





