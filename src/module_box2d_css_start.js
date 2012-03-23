// AMD Stuff 
(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['box2d', 'caat-css'], factory);
    } else {
        // Browser globals
        root.CAAT = factory();
    }
}(this, function (Box2D, CAAT) { 
