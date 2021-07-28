bundle exec jekyll build
rsync -v -rz --checksum  _site/ circl@cppz.circl.lu:/var/www/ail-project.org/
