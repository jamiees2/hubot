# Description:
#   Messing around with the YouTube API.
#
# Commands:
#   hubot youtube me <query> - Searches YouTube for the query and returns the video embed link.
module.exports = (robot) ->
  robot.respond /(youtube|yt)( me)? (.*)/i, (msg) ->
    query = msg.match[3]
    msg.http("http://gdata.youtube.com/feeds/api/videos")
      .query({
        orderBy: "relevance"
        'max-results': 10
        alt: 'json'
        q: query
      })
      .get() (err, res, body) ->
        videos = JSON.parse(body)
        videos = videos.feed.entry
        video  = msg.random videos

        msg.send "http://youtu.be/" + video.id.$t.split("/").slice(-1)[0]

