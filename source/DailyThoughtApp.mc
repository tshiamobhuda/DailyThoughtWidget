using Toybox.Application;
using Toybox.Time;

var isCached = false;
var key = Time.today().value();

class DailyThoughtApp extends Application.AppBase {
    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
        if (Application.Storage.getValue(key)) {
           isCached = true;
        }
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new DailyThoughtView() ];
    }
}
