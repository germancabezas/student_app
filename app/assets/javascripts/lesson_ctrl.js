(function() {
  "use strict";

  angular.module("app").controller("lessonCtrl", function($scope, $http, $sce, FileUploader){

    $scope.fetchLesson = function(id) {
      $http.get("/lesson_elements/" + id + ".json").then(function(response) {
        $scope.lessonElements = response.data["elements"];
        $scope.lessonId = id;
        $scope.chapterId = null;
      });
    };

    $scope.fetchChapter = function(id) {
      $http.get("/chapter_elements/" + id + ".json").then(function(response) {
        $scope.lessonElements = response.data["elements"];
        $scope.chapterId = id;
        $scope.lessonId = null;
      });
    };

    $scope.showTitleForm = function() {
      $scope.titleFormVisible = true;
    };
    $scope.cancelNewTitle = function() {
      $scope.titleFormVisible = false;
    };
    $scope.saveTitle = function(newTitle) {
      var array = [];
      for (var i = 0; i < $scope.lessonElements.length; i++) {
        array.push($scope.lessonElements[i].element_priority)
      };
      $scope.lastPriority = array[array.length - 1] +1;
      var lessonElement = {
        element_type: "title",
        element_text: newTitle,
        lesson_id: $scope.lessonId,
        chapter_id: $scope.chapterId,
        element_priority: $scope.lastPriority
      };

      $http.post('/lesson_elements.json', lessonElement).then(function(response) {
          $scope.lessonElements.push(lessonElement)
        });
      $scope.titleFormVisible = false;
    };


    $scope.showTextForm = function() {
      $scope.textFormVisible = true;
    };
    $scope.cancelNewText = function() {
      $scope.textFormVisible = false;
    };

    $scope.saveText = function(newText) {
      var array = [];
      for (var i = 0; i < $scope.lessonElements.length; i++) {
        array.push($scope.lessonElements[i].element_priority)
      };
      $scope.lastPriority = array[array.length - 1] +1;
      var lessonElement = {
        element_type: "text",
        element_text: newText,
        lesson_id: $scope.lessonId,
        chapter_id: $scope.chapterId,
        element_priority: $scope.lastPriority
      };
      $http.post('/lesson_elements.json', lessonElement).then(function(response) {
          $scope.lessonElements.push(lessonElement)
      });
      $scope.textFormVisible = false;
    };



    $scope.showVideoField = function() {
      $scope.videoFieldVisible = true;
    };
    $scope.cancelNewVideo = function() {
      $scope.videoFieldVisible = false;
    };
    $scope.saveVideo = function(newVideo) {
      var array = [];
      for (var i = 0; i < $scope.lessonElements.length; i++) {
        array.push($scope.lessonElements[i].element_priority)
      };
      $scope.lastPriority = array[array.length - 1] +1;
      var lessonElement = {
        element_type: "video",
        element_text: newVideo,
        lesson_id: $scope.lessonId,
        chapter_id: $scope.chapterId,
        element_priority: $scope.lastPriority
      };
      $http.post('/lesson_elements.json', lessonElement).then(function(response) {
          $scope.lessonElements.push(lessonElement)
        });
      $scope.videoFieldVisible = false;
    };
    $scope.makeTrust = function(html){
      return $sce.trustAsHtml(html);
    };



    $scope.showUploader = function() {
      $scope.imageUploaderVisible = true;
    };
    $scope.cancelNewUploader = function() {
      $scope.imageUploaderVisible = false;
    };

    $scope.uploadImage = function() {
 
     // This is to save the url

      if ($scope.lessonId) {
        $scope.uploader = new FileUploader({url: '/lesson_elements.json?lesson_id='+ $scope.lessonId + '&element_type=image'} );
      } else if ($scope.chapterId) {
        $scope.uploader = new FileUploader({url: '/lesson_elements.json?chapter_id='+ $scope.chapterId + '&element_type=image'} );
      }

      $scope.uploader.onSuccessItem = function(item, response, status, headers) {

        // Saving the priority of the new element
        // var array = [];
        // for (var i = 0; i < $scope.lessonElements.length; i++) {
        //   array.push($scope.lessonElements[i].element_priority)
        // };

        var lessonElement = {
          element_type: "image",
          element_url: response.element_url,
          lesson_id: $scope.lessonId,
          chapter_id: $scope.chapterId,
        };
        $scope.lessonElements.push(lessonElement);
        $scope.imageUploaderVisible = false;
        //
        for(var i = 0; i < $scope.lessonElements.length; i++) {
          var lessonElement = $scope.lessonElements[i]
          lessonElement.element_priority = i;
          $http.patch('/chapter_elements/' + $scope.lessonElements[i].id + '.json', {id: lessonElement.id, element_priority: i}).then(function(response) {
          });
        }
        //
      };
    };

    $scope.changePriority = function(index) {
      $scope.lessonElements.splice(index, 1);
      for(var i = 0; i < $scope.lessonElements.length; i++) {
        var lessonElement = $scope.lessonElements[i]
        lessonElement.element_priority = i;
        $http.patch('/chapter_elements/' + $scope.lessonElements[i].id + '.json', {id: lessonElement.id, element_priority: i}).then(function(response) {
        });
      }

    };




// send a patch request 
// Do and update in the controller
   



    window.scope = $scope;
  });

}());





