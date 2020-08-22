using Toybox.WatchUi;
using Toybox.Communications;

class DailyThoughtView extends WatchUi.View {
    var url = "https://daily-thought-app.netlify.app/.netlify/functions/get-daily-thought";

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
        if (isCached) {
            return;
        }

        var view = new WatchUi.ProgressBar("Loading", null);
        WatchUi.pushView(view, null, WatchUi.SLIDE_UP);

        var params = {
            :method => Communications.HTTP_REQUEST_METHOD_GET,
        };

        Communications.makeWebRequest(url, null, params, method(:onResponseCallback));
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // onResponseCallback() will be fired once the makeWebRequest() returns
    function onResponseCallback(responseCode, data) {
        Application.Storage.clearValues();

        Application.Storage.setValue(key, data);
        isCached = true;

        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }
}
