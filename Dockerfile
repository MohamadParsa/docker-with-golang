FROM alpine:3.18 as base
FROM base

RUN apk add --no-cache git make musl-dev go

ENV port=8082

WORKDIR /app
ADD . /app/

RUN go mod tidy

ARG OS
ARG ARCH
RUN env GOOS=${OS} GOARCH=${ARCH} go build -o docker_with_golang ./cmd/main.go


EXPOSE ${port}
CMD ["./docker_with_golang"]


# sudo docker build -t docker_with_golang .
# sudo docker run -p 8080:9000 -it docker_with_golang
# sudo docker run --env port=8083 --env path=siteContentProduction -p 8083:9000 -it docker_with_golang
# sudo docker run --env-file envirments.txt -p 8083:9000 -it docker_with_golang
# sudo docker build --build-arg OS=linux --build-arg ARCH=amd64 -t docker_with_golang_amd64 .