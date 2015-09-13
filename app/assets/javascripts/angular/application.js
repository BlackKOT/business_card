//= require_self
//= require_directory ./shared
//= require_directory ./application

application = angular.module('application', [])

application.config([
    '$httpProvider', function($httpProvider) {
        $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
        //$httpProvider.defaults.useXDomain = true;
        //delete $httpProvider.defaults.headers.common["X-Requested-With"];
        //$httpProvider.defaults.headers.common["Accept"] = "application/json";
        //$httpProvider.defaults.headers.common["Content-Type"] = "application/json";
    }]);

application.run(function() { console.log('angular app running for application') });

