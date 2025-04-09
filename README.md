# nr-broker-openshift-knox-retriever
Use initContainer to get vault access wrapped token and envconsul in application to retrieve secrets for application

# inital setup for secrets
Set secrets in the project of the namespace to hold role id and broker JWT

# Images for containers
initContainer- get vault wrap access token
Image retrieve secrets in prod: 
```
ghcr.io/bcgov/nr-broker-openshift-knox-retriever/nr-broker-openshift-knox-retriever:v1.0.1
```
Container- sample NestJS application use envconsul to access secrets in vault configured for nodejs-sample service
Image for nest-app:

```
ghcr.io/bcgov/nr-broker-openshift-knox-retriever/nest-app:v1.0.1
```
# How to re-use the nr-broker-openshift-knox-retriever image for existing application in OpenShift

## Prerequisition:
- Setup project and service in Broker UI
- Generate Broker JWT and Role ID for the service and configured into OpenShift Namespace secrets

## Existing OpenShift Deployment Changes:
- Modify envconsul-configmap.yaml on secrets path and vault address for project/service
- Modify intention-configmap.yaml with project name, service name, environment and user name who is authorized to do the deployment
- Change application container name to actual application container in pod-vault.yaml
- Modify values.yaml with the application configuration

# Helm chart deployment
use Helm Chart to install/uninstall pod in openshift for your application
```
helm install knox-retriever-demo webapp-deployment/
helm uninstall knox-retriever-demo
```

After deployment into OpenShift c2053d-dev, the nest-app is up running 
It shows secrets that retrieved from Vault PROD under path: apps/dev/nodejs-sample/nodejs-sample/proxy-account-ready-only
