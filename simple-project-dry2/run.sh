#! /bin/bash

ENVIRONMENT=$1
ACTION=$2
OPTIONS=${@:3}
PLAN_FILE=${@:$#} #plan file is last parameter of 'apply' action

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# console color codes
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

if [ $# -lt 2 ]; then
    echo "Usage: run.sh <environment> <terraform_action> [OPTIONS]"
    exit 1
elif [ ! -d ./$ENVIRONMENT ]; then
    echo -e "${RED}ERROR: Environment directory '$ENVIRONMENT' does not exists.${NC}"
    exit 1
fi

echo "==============================="
echo -e "Using environment ${YELLOW}${ENVIRONMENT}${NC}"
echo "==============================="


cd $SCRIPT_DIR

# set the directory where terraform data files are going to be stored
export TF_DATA_DIR=./$ENVIRONMENT/.terraform

if [ $ACTION == "init" ]; then
    terraform $ACTION -backend-config=./$ENVIRONMENT/config.tfbackend $OPTIONS
elif [ $ACTION == "apply" ] && [ -f "$PLAN_FILE" ]; then
    terraform $ACTION $OPTIONS
else
    terraform $ACTION -var-file=./$ENVIRONMENT/terraform.tfvars -var=environment=$ENVIRONMENT $OPTIONS
fi

unset TF_DATA_DIR