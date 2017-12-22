$ ->
  $("#nav a").each( ->
    link = $(this)
    target_id = link.attr("href")
    return unless /^#\S+/.test(target_id)
    target = $(target_id)
    return unless target.length > 0

    link.click( (e) ->
      e.preventDefault() if e?
      st =  target.offset().top - 200
      console.log(st)

      $("html, body").animate(
        {
          scrollTop: st
        }
        800
        (e) ->
          e.preventDefault() if e?
          location.hash = target_id
      )
    )
  )

  if $("body").hasClass("mobile")
    nav = $("#nav ul")
    fader = $("#header-fader")
    $("header #logo a").click (e) ->
      e.preventDefault() if e?
      shown = nav.is(":visible")

      nav.toggle()
      $("header #brand-outer").css("margin-bottom", $("#nav").height()  + fader.height() + "px")
