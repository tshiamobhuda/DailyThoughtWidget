using Toybox.Application;
using Toybox.Time;

var isCached = false;
var key = Time.today().value();
var content;

class DailyThoughtApp extends Application.AppBase {
    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
        if (Application.Storage.getValue(key)) {
           isCached = true;
        }
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new DailyThoughtView(), new DailyThoughtDelegate() ];
    }
}
