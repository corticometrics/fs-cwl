all:
	docker build -f ./docker/dockerfile--fs6-base -t fs6-base .
	docker build -f ./docker/dockerfile--fs6-cwl -t fs6-cwl .

all-no-cache:
	docker build --no-cache -f ./docker/dockerfile--fs6-base -t fs6-base .
	docker build --no-cache -f ./docker/dockerfile--fs6-cwl -t fs6-cwl .

