// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_directory ./shared
//= require angular
//= require angular-animate
//= require angular-resource

//= require jquery-ias.min

//= require_directory ./application

//= require blueimp-gallery
//= require blueimp-gallery-fullscreen
//= require blueimp-gallery-indicator
//= require blueimp-gallery-video
//= require blueimp-gallery-youtube
//= require jquery.blueimp-gallery
//= require bootstrap-image-gallery

jQuery.ias({
    container : '.comments_block, .projects_block',
    item: '.comment_item, .project',
    pagination: '.pagination',
    next: 'span.next a',
    loader: '<img src="/assets/loading.gif" class=/"text-center" />',
    onRenderComplete: function() {}
});
