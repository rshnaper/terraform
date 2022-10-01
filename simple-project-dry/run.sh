#! /bin/bash

ENVIRONMENT=$1
ACTION=$2


if [ ! $# -eq 2 ]; then
    echo "Usage: run.sh <environment> <terraform_action>"
    exit 1
fi


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Using environment $ENVIRONMENT $SCRIPT_DIR"

cd $SCRIPT_DIR

# if [ $2 == "init" ]; then
#     terraform ${@:2} -reconfigure -backend-config=./$ENVIRONMENT/config.tfbackend
# else
#     terraform init -reconfigure -backend-config ./$ENVIRONMENT/config.tfbackend && \
#     terraform $ACTION -var-file ./$ENVIRONMENT/terraform.tfvars -var=environment=$ENVIRONMENT
# fi


if [ $2 == "init" ]; then
    terraform -chdir=./$ENVIRONMENT ${@:2} -backend-config=config.tfbackend
else
    terraform -chdir=./$ENVIRONMENT $ACTION -var-file=terraform.tfvars -var=environment=$ENVIRONMENT
fi

cd --