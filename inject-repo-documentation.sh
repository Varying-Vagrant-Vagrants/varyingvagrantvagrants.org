#!/bin/bash

vvv_process_jekyll_shelldoc() {
	local DOCFILE="${1}"
	local TARGETFILE="${2//.sh/}"
	local TITLE="${3}"
	local PERMALINK="${TARGETFILE//.md/}"
	PERMALINK=${PERMALINK#.}
	echo -e "---\ncategory: Function Reference\ntitle: ${TITLE}\ndescription: Shellscript documentation for ${TITLE}\npermalink: ${PERMALINK}/\n---\n\n$(shdoc < $DOCFILE)" > $TARGETFILE
}

vvv_process_sh() {
	local FOLDER="${1}"
	local TARGET="${2}"
	local DOCFOLDER="${3}"
	local SHFILE="${TARGET//${FOLDER}/}"
	local TARGETFILENAME="${SHFILE////-}"
	vvv_process_jekyll_shelldoc $TARGET "${DOCFOLDER}${SHFILE//\//-}.md" "${SHFILE}"
}

wget "https://github.com/Varying-Vagrant-Vagrants/VVV/archive/develop.zip" -P /tmp/vvv
wget "https://github.com/Varying-Vagrant-Vagrants/custom-site-template/archive/master.zip" -P /tmp/vvv-site-template

if ! command -v shdoc &> /dev/null; then
	git clone --recursive https://github.com/reconquest/shdoc
	cd shdoc
	sudo make install
	cd -
fi
unzip /tmp/vvv/develop.zip -d /tmp/vvv/
unzip /tmp/vvv-site-template/master.zip -d /tmp/vvv-site-template/
cp /tmp/vvv/VVV-develop/.github/CONTRIBUTING.md ./docs/en-US/contributing.md
cp /tmp/vvv/VVV-develop/CHANGELOG.md ./docs/en-US/changelog.md
cat "/tmp/vvv-site-template/custom-site-template-master/README.md" >> ./docs/en-US/site-templates/custom-site-template-parameters.md
mkdir -p ./docs/en-US/function-reference

#find /tmp/vvv/VVV-develop/provision -name '*.sh'

vvv_process_sh "/tmp/vvv/VVV-develop/" "/tmp/vvv/VVV-develop/provision/provisioners.sh" ./docs/en-US/function-reference/
vvv_process_sh "/tmp/vvv/VVV-develop/" "/tmp/vvv/VVV-develop/provision/provision-helpers.sh" ./docs/en-US/function-reference/
vvv_process_sh "/tmp/vvv/VVV-develop/" "/tmp/vvv/VVV-develop/provision/provision-site.sh" ./docs/en-US/function-reference/
vvv_process_sh "/tmp/vvv/VVV-develop/" "/tmp/vvv/VVV-develop/provision/core/env.sh" ./docs/en-US/function-reference/
ls -lah ./docs/en-US/function-reference/
