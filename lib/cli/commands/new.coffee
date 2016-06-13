
module.exports = (cli) ->
    cli
    .command 'new <name>'
    .description 'initialise a new kosq application'
    .option '-y, --yes', 'accept everything with default values'
    .action (name, options) ->
        console.log name
    .on '--help', ->
        console.log '  Examples:'
        console.log()
        console.log '    $ new my-new-application'
        console.log()
        
