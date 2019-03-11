FROM golang:1.11.5

ENV GOBIN /go/bin

# build directories
RUN mkdir /app
RUN mkdir /go/src/app
ADD ./app /go/src/app
WORKDIR /go/src/app

# Go dep!
RUN go get -u github.com/golang/dep/...
RUN go get -u github.com/githubnemo/CompileDaemon/...
RUN dep ensure

# This runs go w/o a binary
CMD ["go","run","main.go"]
# CMD CompileDaemon -command="make kill & make build & make run & go run main.go"

# This builds a binary
# RUN go build -o /app/main .
# CMD ["/app/main"]