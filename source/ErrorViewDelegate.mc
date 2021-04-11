using Toybox.WatchUi;

class ErrorViewDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onBack() {
        System.exit();
    }
}
