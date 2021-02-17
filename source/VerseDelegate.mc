using Toybox.WatchUi;

class VerseViewDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_DOWN);

        return true;
    }

    function onSelect() {
        if (text.size() == 1) {
            return false;
        }

        screen = (text.size() > 1 && screen != (text.size() - 1)) ? screen + 1 : 0;
        WatchUi.requestUpdate();

        return true;
    }
}
