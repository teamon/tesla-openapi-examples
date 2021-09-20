SPECS = petstore.json slack.json realworld.json docusign.json
TARGETS = ${patsubst %,priv/specs/%,$(SPECS)}

all: $(TARGETS)

priv/specs/petstore.json:
	curl -sL https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/examples/v2.0/json/petstore.json > $@

priv/specs/slack.json:
	curl -sL https://raw.githubusercontent.com/slackapi/slack-api-specs/master/web-api/slack_web_openapi_v2.json > $@

priv/specs/realworld.json:
	curl -sL https://raw.githubusercontent.com/gothinkster/realworld/main/api/swagger.json > $@

priv/specs/docusign.json:
	curl -sL https://raw.githubusercontent.com/docusign/OpenAPI-Specifications/master/esignature.rest.swagger-v2.1.json > $@
