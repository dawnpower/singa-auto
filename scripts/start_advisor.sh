docker run --rm --name $ADVISOR_HOST \
  --network $DOCKER_NETWORK \
  -e LOGS_DIR_PATH=$LOGS_DIR_PATH \
  -e DATA_DIR_PATH=$DATA_DIR_PATH \
  -e LOGS_DOCKER_DIR_PATH=$LOGS_DOCKER_DIR_PATH \
  -e DATA_DOCKER_DIR_PATH=$DATA_DOCKER_DIR_PATH \
  -v $LOGS_DIR_PATH:$LOGS_DOCKER_DIR_PATH \
  -v $DATA_DIR_PATH:$DATA_DOCKER_DIR_PATH \
  -p $ADVISOR_EXT_PORT:$ADVISOR_PORT \
  $RAFIKI_IMAGE_ADVISOR:$RAFIKI_VERSION