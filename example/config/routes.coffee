## this is only to test something...

module.exports = ->
    @use 'my-middleware-0'
    @root 'root' # this points to middlewares/root.coffee
    @get '/test', to: 'test', # this points to middlewares/test.coffee
        before: 'my-middleware-before-test'

    @resource '/users', model: 'user' # is using kosq internal middleware

    @scope '/admin', ->
        @use 'my-middleware-1' # points to middlewares/my-middleware-1.coffee 
        @use 'my-middleware-2' # points to middlewares/my-middleware-2.coffee 
        @use 'my-middleware-3' # points to middlewares/my-middleware-3.coffee
        
        @use 'my-middleware-4', 'my-middleware-5', 'my-middleware-6'
        
        @get '/dashboard', to: 'admin/dashboard' # this points to middlewares/admin/dashboard.coffee
        @resource '/users', model: 'user', 
            actions:
                index: 'admin/index-user' # override internal middleware action with own
                create: 'admin/create-user' # override internal middleware action with own
                show: 'admin/show-user' # override internal middleware action with own
                update: 'admin/update-user' # override internal middleware action with own
                destroy: 'admin/destroy-user' # override internal middleware action with own
            before:
                index: ['my-index-middleware']
                create: ['my-create-middleware']
                show: ['my-show-middleware']
                update: ['my-update-middleware']
                destroy: ['my-destroy-middleware']