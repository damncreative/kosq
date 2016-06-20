require('coffee-script/register');
const application = module.exports = require('./app');

if(!module.parent) {
    application.start();
}
