using Toybox.WatchUi;

class DailyThoughtDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onSelect() {
        //Show main menu
        WatchUi.pushView(
            new Rez.Menus.MainMenu(), 
            new MainMenuDelegate(), 
            WatchUi.SLIDE_BLINK
        );

        return true;
    }
}
