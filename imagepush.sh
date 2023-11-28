#!/bin/bash

docker image push rabbitmq:3-management-alpine

docker image push pitstop/vehiclemanagementapi:1.0

docker image push pitstop/customermanagementapi:1.0

docker image push pitstop/workshopmanagementapi:1.0

docker image push pitstop/auditlogservice:1.0

docker image push pitstop/invoiceservice:1.0

docker image push pitstop/notificationservice:1.0

docker image push pitstop/timeservice:1.0

docker image push pitstop/workshopmanagementeventhandler:1.0

docker image push pitstop/webapp:1.0


