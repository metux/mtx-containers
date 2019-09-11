
Simple build container for seamonkey.

* create the image by running 'make'
* startup via script ./build-seamonkey
* the script mounts the whole homedir into the container

How to run a build:
* prepare the source tree somewhere in your homedir
* join into the container namespace using docker-enter tool
  (sorry, "docker enter" does not work)
* su to your user
* chdir to the source dir and run the build
