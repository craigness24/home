#
# Usage: 
#  make start (or just make, start is default)
#  make stop
#
.PHONY: start stop 


SERVICE_PATH := /opt/nixservice


all: start

start: startMongodb startNats
stop: stopMongodb stopNats

# Create the service directory if it doesn't exist
init:
ifeq (,$(wildcard ${SERVICE_PATH}))
	@sudo mkdir -p ${SERVICE_PATH} 
	@sudo chown `whoami`:admin ${SERVICE_PATH}
	@mkdir -p ${SERVICE_PATH}/log
	@mkdir -p ${SERVICE_PATH}/run
endif

startMongodb: init
	@mkdir -p ${SERVICE_PATH}/mongodb/data
	mongod --fork --bind_ip localhost --dbpath ${SERVICE_PATH}/mongodb/data --logpath ${SERVICE_PATH}/log/mongod.log
	@# stop annoying banner for free monitoring
	@mongosh --host localhost --eval "db.disableFreeMonitoring()"

stopMongodb:
	@# - to ignore the error exit code when stopping
	-mongosh admin --host localhost --eval "db.shutdownServer()" --quiet

startNats: init
	nats-server --addr localhost --log ${SERVICE_PATH}/log/nats-server.log --pid ${SERVICE_PATH}/run/nats-server.pid &

stopNats:
	nats-server --signal stop=${SERVICE_PATH}/run/nats-server.pid

