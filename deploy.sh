echo "\033[34m== 빌드를 시작합니다. ==\033[0m"
sam build --use-container

echo "\033[34m== s3에 코드 파일 업로드를 시작합니다. ==\033[0m"
sam package --profile jimin-private \
--s3-bucket hedwig-sam \
--output-template-file packaged.yaml 

echo "\033[34m== 배포를 시작합니다. ==\033[0m"
sam deploy --profile jimin-private \
--s3-bucket hedwig-sam \
--template-file packaged.yaml \
--stack-name hedwig-sam-qa \
--parameter-overrides Environment=qa \
--capabilities CAPABILITY_IAM --region=ap-northeast-2