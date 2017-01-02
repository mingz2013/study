/**
 * Created by zhaojm on 4/11/16.
 */
var bookStoreApp = angular.module('bookStoreApp', [
    'ngRoute',
    'ngAnimate',
    'bookStoreControllers',
    'bookStoreFilters',
    'bookStoreServices',
    'bookStoreDirectives'
]);

bookStoreApp.config(function($rooteProvider){
   $rooteProvider.when('/hello', {
       templateUrl: 'templates/hello.html',
       controller: 'HelloController'
   }).when('/list', {
       templateUrl: 'templates/bool_list.html',
       controller: 'BookListController'
   }).otherwise({
       redirectTo: '/hello'
   })
});