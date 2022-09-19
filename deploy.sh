echo "\033[32mhedwig를 배포할 환경을 입력해주세요. (입력 가능한 환경: dev/qa/stage/prod)\033[0m"

read -p "env: " env
if ! [[ "$env" =~ ^dev|qa|stage|prod$ ]] 
then 
    echo "잘못된 입력입니다." 
    exit 1 
fi

echo "\033[34m== 빌드를 시작합니다. ==\033[0m"
sam build --use-container

echo "\033[34m== s3에 코드 파일 업로드를 시작합니다. ==\033[0m"
sam package --config-env $env

echo "\033[34m== 배포를 시작합니다. ==\033[0m"
sam deploy --config-env $env