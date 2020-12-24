#!/bin/sh -x

vvv_process_jekyll_shelldoc() {
	MDFILE="${1}"
	echo -e "---\ncategory: 10. Function Reference\ntitle: ${DOCFILE}\ndescription: Shellscript documentation for ${DOCFILE}\n---\n\n$(shdoc < $DOCFILE)" > $MDFILE
}

wget "https://github.com/Varying-Vagrant-Vagrants/VVV/archive/develop.zip" -P /tmp/vvv
wget "https://github.com/Varying-Vagrant-Vagrants/custom-site-template/archive/master.zip" -P /tmp/vvv-site-template
git clone --recursive https://github.com/reconquest/shdoc
cd shdoc
sudo make install
cd -
unzip /tmp/vvv/develop.zip -d /tmp/vvv/
unzip /tmp/vvv-site-template/master.zip -d /tmp/vvv-site-template/
cp /tmp/vvv/VVV-develop/.github/CONTRIBUTING.md ./docs/en-US/contributing.md
cp /tmp/vvv/VVV-develop/CHANGELOG.md ./docs/en-US/changelog.md
cat "/tmp/vvv-site-template/custom-site-template-master/README.md" >> ./docs/en-US/site-templates/custom-site-template-parameters.md
mkdir -p ./docs/en-US/function-reference
echo -e "---\ncategory: Function Reference\ntitle: provision/provision.sh\ndescription: Shellscript documentation for provision/provision.sh\n---\n\n$(shdoc < /tmp/vvv/VVV-develop/provision/provision.sh)" > ./docs/en-US/function-reference/provision-provision.sh.md
echo -e "---\ncategory: Function Reference\ntitle: provision/provision-site.sh\ndescription: Shellscript documentation for provision/provision-site.sh\n---\n\n$(shdoc < /tmp/vvv/VVV-develop/provision/provision-site.sh)" > ./docs/en-US/function-reference/provision-provision-site.sh.md
ls -lah ./docs/en-US/function-reference/
