#!/usr/bin/env bash

set -o errexit # 只要出错就退出
set -o nounset # 不允许引用不存在的变量
set -o pipefail # 各管道内不允许出错


# 脚本所在目录
export SCRIPT_HOME=$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )

DIST_DIR="${SCRIPT_HOME}/dist"
DIST_ZIP_FILE="${DIST_DIR}/app.zip"

mkdir -p ${DIST_DIR}

# 如果存在zip文件就先删除
[[ -f ${DIST_ZIP_FILE} ]] && rm -rf ${DIST_ZIP_FILE}

# 将依赖包打入app.zip
site_packages_dir="$DIST_DIR/site_package_dir"
mkdir -p ${site_packages_dir} && cd ${site_packages_dir}
pip install -r ${SCRIPT_HOME}/requirements.txt --target .

find . -name '*.pyc' \
    -o -name '*.egg-info' \
    -o -name '*.dist-info' \
    | xargs -n1 -I{} rm {} -rf

zip -9mrv ${DIST_ZIP_FILE} .
rm -rf ${site_packages_dir}


# 考虑源码
cd ${SCRIPT_HOME}/src
zip -9r ${DIST_ZIP_FILE} .
