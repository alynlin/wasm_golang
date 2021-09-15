prepare:
	cp "$(shell go env GOROOT)/misc/wasm/wasm_exec.js" .
clean:
	rm -rf ./main.wasm
build: clean
	GOOS=js GOARCH=wasm go build -o main.wasm
run: prepare clean build
	goexec 'http.ListenAndServe(`:8080`, http.FileServer(http.Dir(`.`)))'
