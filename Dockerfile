FROM koenkk/zigbee2mqtt

RUN echo "advanced:" >> /app/data/configuration.yaml
RUN echo "channel: 26" >> /app/data/configuration.yaml
RUN echo "test" > /app/data/test.yaml
RUN cp /app/data/configuration.yaml /app/data/copy_configuration.yaml

