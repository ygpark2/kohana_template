git init

git submodule add git://github.com/kohana/core.git system
git submodule add git://github.com/kohana/database.git modules/database
git submodule add git://github.com/kohana/userguide.git modules/userguide
git submodule add git://github.com/kohana/image.git modules/image
git submodule add git://github.com/kohana/codebench.git modules/codebench
git submodule add git://github.com/kohana/auth.git modules/auth
git submodule add git://github.com/kohana/pagination.git modules/pagination
git submodule add git://github.com/kohana/orm.git modules/orm

# for doctrine module
git submodule add https://github.com/Flynsarmy/KODoctrine2.git modules/doctrine2
cd modules/doctrine2
git filter-branch --prune-empty --subdirectory-filter modules/doctrine2 master
cd ../..

git clone git://github.com/doctrine/doctrine2.git doctrine2-orm && mv doctrine2-orm modules/doctrine2/classes/vendor/doctrine
# git submodule add https://github.com/doctrine/doctrine2.git modules/doctrine2/classes/vendor/doctrine

mkdir -m 0777 -p application/models/fixtures/schema
mkdir -m 0777 -p application/models/{proxies,repositories}

# git submodule add git://github.com/shadowhand/sprig.git modules/sprig

git submodule init
git commit -m 'Added initial submodules'


mkdir -p application/classes/{controller,model}
mkdir -p application/{config,views,i18n,messages}
mkdir -m 0777 -p application/{cache,logs}

echo '[^.]*' > application/{logs,cache}/.gitignore

curl -o index.php https://raw.github.com/kohana/kohana/3.2/master/index.php
curl -o application/bootstrap.php https://raw.github.com/kohana/kohana/3.2/master/application/bootstrap.php
curl -o .htaccess https://raw.github.com/kohana/kohana/3.2/master/example.htaccess
touch README

git add index.php
git add application
git add README
git commit -m 'Added initial directory structure'
