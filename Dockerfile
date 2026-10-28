FROM golang:1.22.4

COPY *.mod *.go *.html .

ENTRYPOINT ["go", "run", "."]
