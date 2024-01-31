FROM swift:5.9

WORKDIR /app

COPY generator/Sources Sources
COPY generator/Package.resolved Pacakge.resolved
COPY generator/Package.swift Package.swift

RUN swift package resolve
RUN swift build -c release

ENTRYPOINT ["/app/.build/release/solbench"]