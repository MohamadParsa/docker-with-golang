FROM alpine:3.18 as base
FROM base
RUN apk add --no-cache git make musl-dev go
ENV port=8082
WORKDIR /app
ADD . /app/
RUN go mod tidy
EXPOSE ${port}
CMD ["go","run","cmd/main.go"]


# sudo docker build -t docker_with_golang .
# sudo docker run -p 8080:9000 -it docker_with_golang
# sudo docker run --env port=8083 --env path=siteContentProduction -p 8083:9000 -it docker_with_golang
# sudo docker run --env-file envirments.txt -p 8083:9000 -it docker_with_golang