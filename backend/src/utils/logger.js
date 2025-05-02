const winston = require('winston');

const logger = winston.createLogger({
  level: process.env.LOG_LEVEL || 'info',
  format: winston.format.combine(
    winston.format.timestamp({
      format: 'YYYY-MM-DD HH:mm:ss'
    }),
    winston.format.printf(info => `${info.timestamp} [${info.level}]: ${info.message} ${info.service ? JSON.stringify(info, null, 2) : ''}`)
  ),
  transports: [
    new winston.transports.Console()
  ]
});

module.exports = logger;