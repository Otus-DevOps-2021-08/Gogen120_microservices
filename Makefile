APP_DIR := src
APPS := comment post-py ui

MONITORING_DIR := monitoring
MONITORING := prometheus blackbox

build:
	for i in ${APPS}; do cd ${APP_DIR}/$$i; bash docker_build.sh; done

	for i in ${MONITORING}; do docker build -t ${USER_NAME}/$$i ${MONITORING_DIR}/$$i; done

push:
	for i in ${APPS} ${MONITORING}; do docker push ${USER_NAME}/$$i; done
