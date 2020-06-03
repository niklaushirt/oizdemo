# Tekton Demo

## Install

### Create Namespaces
```bash
kubectl create ns demo-oiz-prod
kubectl create ns demo-oiz-test
kubectl create ns demo-oiz-dev
```

### Create Dashboard
```bash
kubectl apply -n openshift-pipelines -f ./misc/tekton-dashboard-release.yaml
```


### Adapt RBAC (ugly hack)
```bash
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:oiz-demo-pipeline:oiz-demo-service-account
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:demo-oiz-prod:default
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:demo-oiz-dev-nikh:default
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:demo-oiz-test:default
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:demo-oiz-dev:default
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:openshift-pipelines:tekton-dashboard
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:tekton-pipelines:default
```


### Create Pull Secret
```bash
kubectl create -n oiz-demo-pipeline secret docker-registry regcred \
                    --docker-server=quay.io \
                    --docker-username=<MY_USERNAME> \
                    --docker-password=<MY_PASSWORD> \
                    --docker-email=<MY_EMAIL>
```

### Create Base Stuff

Manifests in folder `deploy`

```bash
kubectl apply -n demo-oiz-prod -f ./deploy/prod/
kubectl apply -n demo-oiz-prod -f ./deploy/db

kubectl apply -n demo-oiz-test -f ./deploy/test/
kubectl apply -n demo-oiz-test -f ./deploy/db

kubectl apply -n demo-oiz-dev -f ./deploy/dev/
kubectl apply -n demo-oiz-dev -f ./deploy/db/
```

### Create Pipeline

Manifests in folder `tekton`

```bash
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-init.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-resources.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-tasks.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-pipeline-complete.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-pipeline-local.yaml
```

### Create Triggers

Create two GitHub WebHooks to the triggers.
dev: push
prod: pull_request

```bash
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-trigger.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-trigger-global.yaml
```

### Create Pipeline Runs

Manifests in folder `tekton`

```bash
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-pipeline-run-local.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-pipeline-run-complete.yaml
```






## Delete Pipeline Resources
```bash
kubectl delete -n oiz-demo-pipeline taskrun --all
kubectl delete -n oiz-demo-pipeline pipelinerun --all
kubectl delete -n oiz-demo-pipeline pipeline --all
kubectl delete -n oiz-demo-pipeline tasks --all
kubectl delete -n oiz-demo-pipeline pipelineresource --all
```





