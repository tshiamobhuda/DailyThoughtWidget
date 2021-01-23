using Toybox.WatchUi;
using Toybox.Communications;
using Toybox.Graphics;

class DailyThoughtView extends WatchUi.View {
    //Find a way to set this in some .env file
    var url = "https://daily-thought-app.netlify.app/.netlify/functions/get-daily-thought";

    function initialize() {
        View.initialize();
    }

    function onShow() {
        if (isCached) {
            content = Application.Storage.getValue(key);

            return;
        }

        var view = new WatchUi.ProgressBar("Loading", null);
        WatchUi.pushView(view, null, WatchUi.SLIDE_UP);

        var options = {
            :method => Communications.HTTP_REQUEST_METHOD_GET,
        };

        Communications.makeWebRequest(url, null, options, method(:onResponseCallback));
    }

    function onUpdate(dc) {
        if (!isCached) {
            return;
        }

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        var txtChapter = new WatchUi.Text({
            :text => content.get("chapter"),
            :font => Graphics.FONT_SMALL,
            :locX => dc.getWidth() / 2,
            :locY => dc.getHeight() / 2,
            :justification => Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        });

        txtChapter.draw(dc);
    }

    function onResponseCallback(responseCode, data) {
        Application.Storage.clearValues();

        Application.Storage.setValue(key, data);
        isCached = true;

        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }
}
