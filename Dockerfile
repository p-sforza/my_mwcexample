# build stage
FROM golang:alpine 
RUN apk update && apk add curl git tcpdump
RUN mkdir -p /go/src/github.com/jasonrichardsmith/mwcexample
WORKDIR /go/src/github.com/jasonrichardsmith/mwcexample
COPY main.go .
COPY glide.yaml .
COPY glide.lock .
RUN curl https://glide.sh/get | sh
RUN export GOPATH=$(echo $(pwd)) &&\
    glide install
RUN export GOPATH=$(echo $(pwd)) &&\
    CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o webhook



#COPY /go/src/github.com/jasonrichardsmith/mwcexample/webhook .
ENTRYPOINT ["/webhook"]
