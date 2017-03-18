
clientcli:
	cd client && go build -o $(GOBIN)/crunchy crunchy.go
operatorimage:
	cd operator && go install crunchy-operator.go
	cp $(GOBIN)/crunchy-operator bin/crunchy-operator
	docker build -t crunchy-operator -f $(CCP_BASEOS)/Dockerfile.crunchy-operator.$(CCP_BASEOS) .
	docker tag crunchy-operator crunchydata/crunchy-operator:$(CCP_BASEOS)-$(CCP_PGVERSION)-$(CCP_VERSION)
all:
	make operatorimage
default:
	all

