curl -v \                                                                                                                                   
-H 'X-GitHub-Event: pull_request' \
-H 'X-Hub-Signature: sha1=0835c8c5dc317870c4e48659df5f3c53213cd348' \
-H 'Content-Type: application/json' \
-d '{"head_commit":{"id":"master"},"repository":{"url": "https://github.com/tektoncd/triggers"}}' \
http://github-oiz-demo-pipeline.oizdemo1-a376efc1170b9b8ace6422196c51e491-0000.eu-de.containers.appdomain.cloud/



curl -v \  
-H 'X-GitHub-Event: pull_request' \
-H 'X-Hub-Signature: sha1=0835c8c5dc317870c4e48659df5f3c53213cd348' \
-H 'Content-Type: application/json' \
-d '{"head_commit":{"id":"master"},"repository":{"url": "https://github.com/tektoncd/triggers"}}' \
http://github-prod-oiz-demo-pipeline.oizdemo1-a376efc1170b9b8ace6422196c51e491-0000.eu-de.containers.appdomain.cloud/