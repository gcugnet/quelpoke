FROM golang:1.22.4 AS build
WORKDIR /src
COPY go.mod ./
COPY *.go *.html ./
RUN CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o /quelpoke .

FROM gcr.io/distroless/static-debian12:nonroot
COPY --from=build /quelpoke /quelpoke
EXPOSE 8080
ENTRYPOINT ["/quelpoke"]
