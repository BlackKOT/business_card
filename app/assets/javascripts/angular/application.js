//= require ../dirPagination
//= require_self
//= require_directory ./shared
//= require_directory ./application

window.appModule = angular.module('application', ['angularUtils.directives.dirPagination']);
appModule.run(function() { console.log('angular app running for application') });

