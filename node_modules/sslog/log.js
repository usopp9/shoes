var util = require('util')
  , fs = require('fs')
  , disable_colours = process.env.NODE_DISABLE_COLORS
  , log = exports;

/**
 * Setup log levels
 */

var levels = {
    error:   { level: 1, alias: 'ERROR', color: '\033[31m\033[7m%s\033[27m\033[39m' }
  , warn:    { level: 2, alias: 'WARN', color: '\033[31m%s\033[39m' }
  , info:    { level: 3, alias: 'INFO', color: '\033[33m%s\033[39m' }
  , verbose: { level: 4, alias: 'VERB', color: '\033[36m%s\033[39m' }
  , trace:   { level: 5, alias: 'TRACE', color: '\033[90m%s\033[39m' }
};

/**
 * Parse env to determine log level
 */

log.level = 3;
if (process.env.DISABLE_LOGGING) {
    log.level = 0;
} else if (process.env.V) {
    log.level = 5;
} else if (process.env.LOG_LEVEL) {
    log.level = process.env.LOG_LEVEL;
}

/**
 * Allow for a custom output stream
 */

var stream = process.stdout;
log.setStream = function (s, enable_colour) {
    stream = s;
    disable_colours = !enable_colour;
};
if (process.env.LOG_FILE) {
    stream = fs.createWriteStream(process.env.LOG_FILE);
    disable_colours = true;
}

/**
 * Generic output functions
 */

log.output = function (type, msg) {
    var args = Array.prototype.slice.call(arguments, 1)
      , date = new Date().toISOString().replace('T', ' ').replace('Z', '')
      , self = this;
    msg = util.format.apply(util, args);
    if (!disable_colours) {
        type = util.format(levels[type].color, levels[type].alias);
    } else {
        type = levels[type].alias;
    }
    msg.split('\n').forEach(function (msg) {
        msg = util.format(
            '[%s] %s %s'
          , date
          , type
          , msg
        );
        self.write(msg);
    });
};

/**
 * Utility methods
 */

log.newline = function () {
    stream.write('\n');
};

log.write = function (msg) {
    stream.write(msg + '\n');
};

/**
 * Create a function for each log level
 */

Object.keys(levels).forEach(function (type) {
    log[type] = function () {
        if (levels[type].level > log.level) return;
        var args = [type].concat(Array.prototype.slice.call(arguments));
        this.output.apply(this, args);
    };
});

/**
 * Output a message then exit.
 *
 * @param {String} msg (optional)
 * @param {Number} code (optional)
 * @api public
 */

log.exit = function (msg, code) {
    if (msg) {
        log[code ? 'error' : 'info'](msg);
    }
    process.exit(code || 0);
};

