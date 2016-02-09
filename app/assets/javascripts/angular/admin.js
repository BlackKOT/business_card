//= require ../dirPagination
//= require_self
//= require_directory ./shared
//= require_directory ./admin

window.appModule = angular.module('admin', ['angularUtils.directives.dirPagination']);
appModule.run(function() { console.log('angular app running') });

