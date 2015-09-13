//= require_directory ./shared
//= require_self
//= require_directory ./admin

window.appModule = angular.module('admin', []);
appModule.run(function() { console.log('angular app running') });

