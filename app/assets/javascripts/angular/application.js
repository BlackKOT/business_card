//= require_self
//= require_directory ./shared
//= require_directory ./application

window.appModule = angular.module('application', []);
appModule.run(function() { console.log('angular app running for application') });

