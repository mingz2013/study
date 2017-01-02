/**
 * Created by zhaojm on 4/11/16.
 */
var bookStoreControllers = angular.module('bookStoreControllers', []);

bookStoreControllers.controller('HelloController', ['$scope', function($scope){
    $scope.greeting = {
        text: 'Hello'
    };
}]);

bookStoreControllers.controller('BookListController', ['$scope', function($scope){
    $scope.books = [
        {title: "book1", author: "author1"},
        {title: "book2", author: "author2"},
        {title: "book3", author: "author3"}
    ]
}]);