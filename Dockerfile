FROM golang:alpine AS build

ARG VERSION

RUN apk add --no-cache git

RUN go install github.com/fullstorydev/grpcurl/cmd/grpcurl@v${VERSION}

FROM alpine:latest

COPY --from=build /go/bin/grpcurl /usr/local/bin/grpcurl

ENTRYPOINT [ "/usr/local/bin/grpcurl" ]
