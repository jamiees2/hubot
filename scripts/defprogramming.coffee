# Description:
#   None
#
# Dependencies:
#   "htmlparser": "1.7.6"
#   "soupselect: "0.2.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot def programming - Display a random programming quote from defprogramming.com
#
# Author:
#   daviferreira

cheerio = require 'cheerio'

module.exports = (robot) ->
    robot.respond /def programming/i, (msg) ->
        msg.http("http://www.defprogramming.com/random")
           .get() (err, res, body) ->
               $ = cheerio.load body
               msg.send $("cite a p").text()
