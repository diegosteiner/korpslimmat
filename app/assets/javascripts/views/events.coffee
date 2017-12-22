load_events = (amount) ->
  calendar_id = "u041.ch_2oks1rk0m9up32uar4gjeohbqg@group.calendar.google.com"
  url = "http://www.google.com/calendar/feeds/" + calendar_id + "/public/full"
  params = {
    orderby: "starttime"
    sortorder: "ascending"
    'max-results': amount
    futureevents: true
    alt: "json"
  }

  $.ajax(
    url: url
    async: false
    data: params
    dataType: "jsonp"
    success: (data) ->
      populate_events(data.feed.entry)
  )

populate_events = (events) ->
  list = $("ul#events");

  for event, i in events
    console.log(event)

    el = list.find("#template_event").clone()
    el
    .attr('id', "event_" + i)

    startDate = new Date(event.gd$when[0].startTime)
    endDate = new Date(event.gd$when[0].endTime)
    where = event.gd$where[0].valueString


    el.find(".agenda-icon > .agenda-icon-inner").append(startDate.getDay())
    el.find(".what").append(event.title.$t)
    el.find(".when>span").append(I18n.l("time.formats.short", startDate))
    el.find(".who>span").append(event.title.$t)
    el.find(".where>span").append($("<a>" + where + "</a>").attr('href', "http://maps.google.com/?q=" + where)) if where.length > 0
    el.find(".description p").append(event.content.$t.replace(/\n/, "<br />"))
    el.find("a.more").click ->
      $(this).parent(".description").children("p").toggle()

    list.append(el)


$ ->
  load_events(10)

