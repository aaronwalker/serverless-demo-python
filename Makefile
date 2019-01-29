
STAGE?=dev
CF_ENV=dev
REGION=ap-southeast-2

SHELL := /bin/bash

test:
	cd functions/hello; \
	python -m venv venv; \
	source venv/bin/activate; \
	pip install -r requirements.txt; \
	coverage run setup.py test

ssm:
ifneq (,$(wildcard ssm-params-${CF_ENV}.yml))
	awsenv create ssm-params-${CF_ENV}.yml
endif

deploy-package:
	sls deploy -v --cfenv $(CF_ENV) --stage $(STAGE) --region $(REGION)


deploy: ssm deploy-package
