# Description:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot wiki me <query> - Searches for <query> on Wikipedia.
#
# Author:
#   jamiees2

module.exports = (robot) ->
  robot.respond /(wiki)( me)? (.*)/i, (msg) ->

    msg.http("http://en.wikipedia.org/w/api.php")
    .query({
      action: 'query',
      list: 'search',
      format: 'json',
      srsearch: msg.match[3]
    })
    .get() (err, res, body) ->
      wiki = JSON.parse(body).query.search
      msg.send "https://en.wikipedia.org/wiki/#{encodeURIComponent(wiki[0].title)}"

