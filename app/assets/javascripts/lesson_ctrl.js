(function() {
  "use strict";

  angular.module("app", ['ngSanitize','xeditable']).controller("lessonCtrl", function($scope, $http){
    $scope.fetchLesson = function(id) {
      $http.get("/lesson_elements/" + id + ".json").then(function(response) {
        buildHtml(response.data["elements"]);
      });
    };


    $scope.fetchChapter = function(id) {
      $http.get("/chapter_elements/" + id + ".json").then(function(response) {
        buildHtml(response.data["elements"]);
      });
    };


    function buildHtml(elements) {
      var html = ""
      for(var i = 0; i < elements.length; i++){
        var element = elements[i];
        if(element["element_type"] === "image"){
          html += "<img src='" + element["element_url"] + "' width='300' height='auto'>"
        }
        else if(element["element_type"] === "text"){
          html += "<p>" + element["element_text"] + "</p>"
        }
        else if(element["element_type"] === "title"){
          html += "<h2>" + element["element_text"] + "</h2>"
        }
      }

      $scope.htmlElement = html;
    }

    window.scope = $scope;
  });

}());

