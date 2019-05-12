window.TRACKER = (function(){
  function TRACKER(){
    return localStorage.getItem("guid") || newGuid()
  }

  TRACKER.version = "0.0.1"

  TRACKER.defaultEndpoint = "http://localhost:3000/visits"
  
  TRACKER.setEndpoint = function(endpoint){
    localStorage.setItem("trackerEndpoint", endpoint)
  }

  TRACKER.track = function(){
    fetch(endpoint(), {
      headers: {
        "Content-Type": "application/json; charset=utf-8"
      },
      method: 'POST',
      body: buildBody()
    })
  }

  function newGuid(){
    var guid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8)
      return v.toString(16)
    })
    localStorage.setItem("guid", guid)
    return guid
  }

  function endpoint(){
    return localStorage.getItem("trackerEndpoint") || TRACKER.defaultEndpoint
  }

  function buildBody(){
    return JSON.stringify({
      visit: {
        guid: TRACKER(),
        url: location(),
        timestamp: timestamp()
      }
    })
  }

  function location(){
    return window.location.href
  }

  function timestamp(){
    var date = new Date
    return date.getTime()
  }

  return TRACKER
})()