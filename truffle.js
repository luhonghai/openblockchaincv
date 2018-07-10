// Allows us to use ES6 in our migrations and tests.
require('babel-register')
const ganache = require('ganache-cli');
module.exports = {
    networks: {
        development: {
            host: '127.0.0.1',
            port: 8545,
            network_id: '*' // Match any network id
        },
        ganache_cli: {
            provider: ganache.provider(),
            network_id: '*'
        }
    }
};
