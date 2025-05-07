FROM python:3.13-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

COPY / /app

WORKDIR /app

EXPOSE 2121

RUN uv pip install --system -e . && \
    crawl4ai-setup
# Command to run the MCP server
CMD ["uv", "run", "src/crawl4ai_mcp.py"]