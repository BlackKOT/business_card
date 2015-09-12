//= require_self
//= require_directory ./admin

admin = angular.module('admin', []);

admin.config([
    '$httpProvider', function($httpProvider) {
        $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
    }]);

admin.run(function() { console.log('angular app running') });

