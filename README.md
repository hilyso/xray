### Usage

  `git clone https://github.com/hilyso/xray.git`  

### Build image

  ```bash
  docker build \
  --build-arg VERSION=$VERSION \
  -t xray:$VERSION \
  .
  ```

### Start container

  ```bash
  docker run -d \
  --name $CONTAINER_NAME \
  -p $HOST_PORT:$CONTAINER_PORT \
  -v $HOST_CONFIG_FILE:/etc/xray/config.json \
  xray:$VERSION
  ```
