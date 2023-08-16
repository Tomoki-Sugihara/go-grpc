# $ cd api
# $ protoc --go_out=../pkg/grpc --go_opt=paths=source_relative \
	--go-grpc_out=../pkg/grpc --go-grpc_opt=paths=source_relative \
	hello.proto
# を実行したい

# 以下のようにすると、
# $ cd api
# $ make protoc
# と実行できる

.PHONY: protoc
protoc:
	cd api && \
	protoc --go_out=../pkg/grpc --go_opt=paths=source_relative \
		--go-grpc_out=../pkg/grpc --go-grpc_opt=paths=source_relative \
		hello.proto && \
	cd ..

.PHTONY: run-server
run-server:
	go run cmd/server/main.go

.PHTONY: run-client
run-client:
	go run cmd/client/main.go