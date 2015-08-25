# Database Commands
alias startPostgres="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias stopPostgres="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias startMysql="mysql.server start"
alias stopMysql="mysql.server stop"
alias startMongo="mongod --config /usr/local/etc/mongod.conf"