all: docker ccr acr

docker:
	./build.sh docker.io/imroc/grpcurl

ccr:
	./build.sh ccr.ccs.tencentyun.com/imroc/grpcurl

acr:
	./build.sh registry.cn-hangzhou.aliyuncs.com/imroc/grpcurl
