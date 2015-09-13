//= require_directory ./shared
//= require_self
//= require_directory ./admin

window.appModule = angular.module('admin', []);

appModule.config([
    '$httpProvider', function($httpProvider) {
        $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
    }]);

appModule.run(function() { console.log('angular app running') });

