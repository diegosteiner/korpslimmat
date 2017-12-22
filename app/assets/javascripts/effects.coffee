$ ->
  if $(window).width() <= 767
    $("body").addClass('mobile')
    $("body").removeClass('single_page')

  if $("body").hasClass('single_page')
    $("header")
    .attr("data-0", "height: 100%;")
    .attr("data-500", "height: 10%;")

    $("header #brand-outer")
    .attr("data-0", "height: 100%;")
    .attr("data-500", "height: 10%;")

    $("header #logo img")
    .attr("data-0", "height: 180px; transform: rotate(-3deg);")
    .attr("data-500", "height: 60px; transform: rotate(0deg);")

    $("header #title")
    .attr("data-0", "font-size: 3em;")
    .attr("data-500", "font-size: 1em; ")

    $("header #nav")
    .attr("data-0", "font-size: 1.5em;")
    .attr("data-500", "font-size: 1em; ")

    $(".prallax").each( ->
      $(this).attr("data-bottom-top", "position: relative; bottom: -500px;")
      $(this).attr("data-top-bottom", "position: relative; bottom: 500px;")
      $(this).attr("data-anchor-target", "#" + $(this).parents("section").attr("id"))
    )

    $("#news li").each( ->
      $(this).attr("data-bottom-top", "position: relative; left: -500px;")
      $(this).attr("data-center-top", "position: relative; left: 0px;")
#      $(this).attr("data-anchor-target", "#" + $(this).parents("section").attr("id"))
    )

    $("#team .member-picture")
    .attr("data-bottom-top", "opacity: 0;")
    .attr("data-center", "opacity: 1;")

    $("#lilie-big")
    .attr("data-0", "opacity: 0.5; display: block;")
    .attr("data-250", "opacity: 0;")

    $("#scroll-down")
    .attr("data-0", "opacity: 1; display: block;")
    .attr("data-200", "opacity: 0;")

    s = skrollr.init()
    $("body").css("height", $("body").height() - $(window).height() + "px")