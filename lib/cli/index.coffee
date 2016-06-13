debug = require 'debug'
cli = require 'commander'
_ = require 'lodash'
requireDir = require 'require-dir'

pkg = require '../../package.json'

log = debug 'kosq:cli'

module.exports = ->
    cli.version pkg.version
    
    # load commands
    commands = requireDir './commands'
    command cli for key, command of commands
    
    # default command action - seems command not found
    cli.action (cmd) -> console.log "Command #{cmd} not found."
    
    # parse argv
    cli.parse process.argv
    
    # output help if no command passed
    cli.outputHelp() unless process.argv.slice(2).length
    