using Toybox.WatchUi;

class MainMenuDelegate extends WatchUi.Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onMenuItem(item) {
        var contentView = null;

        if (:open_verse == item) {
            contentView = new VerseView("verse");
        }

        if (:open_notes == item) {
            contentView = new VerseView("notes");
        }

        if (:open_prayer == item) {
            contentView = new VerseView("prayer");
        }

        if (null == contentView) {
            return false;
        }

        WatchUi.pushView(contentView, new VerseViewDelegate(), WatchUi.SLIDE_BLINK);

        return true;
    }
}
