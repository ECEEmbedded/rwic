$ ->
    totalHeight = 0
    scrolling = 0
    window.rrlog = (msg, type) ->
        msg = "#{(new Date).toLocaleTimeString()} - #{msg}"
        if (type == "error")
            $("#subLogArea").append("<h1 class='error'>#{msg}</h1>")
        else if (type == "warn")
            $("#subLogArea").append("<h1 class='warn'>#{msg}</h1>")
        else
            $("#subLogArea").append("<h1 class='normal'>#{msg}</h1>")

        height = $("#subLogArea h1").last().height()

        totalHeight += height
        if scrolling == 0
            if totalHeight >= $("#subLogArea").height()
                scrolling = 1
                totalHeight = 0
                $("#subLogArea").animate {"top": "-#{totalHeight}px"}
        else
                $("#subLogArea").animate {"top": "-#{totalHeight}px"}


    window.rrlog("This is an error log message", "error")
    window.rrlog("This is a worning message", "warn")
    window.rrlog("Just some info", "normal")
    window.rrlog("Some more info", "normal")
    window.rrlog("Uh oh!", "warn")
