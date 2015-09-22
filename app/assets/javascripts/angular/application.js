//= require_self
//= require_directory ./application

application = angular.module('application', []);

application.config([
    '$httpProvider', function($httpProvider) {
        $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
    }]);

application.run(function() { console.log('angular app running for application') });

