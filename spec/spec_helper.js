var chromedriver = require('chromedriver');
var exec = require('child_process').exec;

module.exports = {
  before : function(done) {
    console.log('\nstarting chromedriver...')
    chromedriver.start();

    exec(`make serve`, function(err, stdout, stderr) {
      console.log('starting Jekyll...');
      done();
    });
  },

  after : function(done) {
    console.log('\nstopping chromedriver...')
    chromedriver.stop();

    exec(`make stop`, function(err, stdout, stderr) {
      console.log('stopping Jekyll...');
      done();
    });
  }
};
