module.exports =
    default:
        dialect: 'sqlite'
    
    development: ->
        storage: 'development.sqlite'
        
    test: ->
        storage: 'test.sqlite'
        
    production: ->
        storage: 'production.sqlite'