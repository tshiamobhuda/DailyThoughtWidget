using Toybox.WatchUi;
using Toybox.Graphics;

var screen = 0;
var text = [];

class VerseView extends WatchUi.View {
    private var type = "";

    function initialize(contentType) {
        View.initialize();

        type = contentType;
        text = [];
        screen = 0;
    }

    function onLayout(dc) {
        if (text.size() > 0) {
            return;
        }

        var data = content.get(type);
        var isLoopRequired = true;
        var index = 0;

        if (data instanceof Toybox.Lang.Array) {
            // Turn data into String :)
            data = data.toString().substring(1, data.toString().length() - 1);
        }

        do {
            var textFromLastIndex = data.substring(index, data.length());

            // Left trim
            if (textFromLastIndex.toCharArray()[0] == " ") {
                textFromLastIndex = textFromLastIndex.substring(1, textFromLastIndex.length());
            }

            var displayText = Graphics.fitTextToArea(
                textFromLastIndex,
                Graphics.FONT_TINY,
                dc.getWidth() - 40,
                dc.getHeight() - 80,
                true
            );

            text.add(displayText);

            if (displayText.find("…") != null) {
               index = index + displayText.find("…");
            } else {
               isLoopRequired = false;
            }
        } while(isLoopRequired);
    }

    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        var myTextArea = new WatchUi.TextArea({
            :text => text[screen],
            :color => Graphics.COLOR_WHITE,
            :font => Graphics.FONT_TINY,
            :locX => 20,
            :locY => 40,
            :width => dc.getWidth() - 40,
            :height => dc.getHeight() - 80,
            :justification => Graphics.TEXT_JUSTIFY_CENTER
        });

        myTextArea.draw(dc);
    }
}
