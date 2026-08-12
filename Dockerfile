FROM node:22-alpine

# Install both packages at BUILD time, when network is available.
RUN npm install -g supergateway bring-mcp

ENV PORT=10000
EXPOSE 10000

# bring-mcp is now a local binary - no download at request time.
CMD ["sh", "-c", "supergateway --stdio bring-mcp --outputTransport streamableHttp --stateful --sessionTimeout 1800000 --port 10000 --streamableHttpPath ${MCP_PATH}"]
