@Library(['ciinabox', 'pipelines']) _
serverlessPipeline {
  name = 'demo-serverless-python'
  region = 'eu-central-1'
  accounts = [
    dev:  env.DEV_ACCOUNT_ID,
    prod: env.PROD_ACCOUNT_ID
  ]
}