using Toybox.WatchUi;

class ErrorView extends WatchUi.View {
    function initialize() {
        View.initialize();
    }

    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_BLACK);
        dc.clear();
    
        var displayText = Graphics.fitTextToArea(
            "Phone not connected",
            Graphics.FONT_SMALL,
            dc.getWidth() - 40,
            dc.getHeight() - 80,
            true
        );

        var txtChapter = new WatchUi.Text({
            :text => displayText,
            :font => Graphics.FONT_SMALL,
            :locX => dc.getWidth() / 2,
            :locY => dc.getHeight() / 2,
            :width => dc.getWidth() - 40,
            :height => dc.getHeight() - 80,
            :justification => Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        });

        txtChapter.draw(dc);
    }
}
