# OSCAL Documentation

## Documentation Development

The OSCAL documentation is developed using the [Slate](https://github.com/lord/slate) platform. Below are instructions for standing up your local development environment.

The [`source/`](source/) directory contains the editable markdown files. If you prefer, you can edit the markdown files directly without having to install any of the devlopment tooling described below.

## Developing with Docker

You can quickly and easily get started with doc development using Docker. You can get Docker for your appropriate platform [here](https://www.docker.com/community-edition). Once you've installed Docker, you can use the included `Dockerfile` and `docker-compose.yml` files to spin up a documentation server that supports live reload.

    $ docker-compose up

You can then launch your web browser and connect to `http://localhost:4567` to view the documentation. As you make updates to the source, the browser will automatically refresh to reflect the changes.

## Developing without Docker

If you prefer not to use Docker for local development, you can also install the required components directly onto your machine. You'll need the following:

- Ruby 2.3.1
  - On macOS, it's best to install using [Homebrew](https://www.ruby-lang.org/en/documentation/installation/#homebrew) or [Ruby Version Manager (rvm)](https://rvm.io/)
  - On Linux, you can install via your distro's [package manager](https://www.ruby-lang.org/en/documentation/installation/#package-management-systems) or with [Ruby Version Manager (rvm)](https://rvm.io/)
  - On Windows, use [RubyInstaller](https://rubyinstaller.org/) (with Devkit) or Windows Subsystem for Linux (WSL)
- [Bundler](http://bundler.io/) - `gem install bundler`

Install the dependencies:

    $ bundle install

You can then initialize and start the development server as follows:

    $ bundle exec middleman server --watcher-force-polling

Launch your web browser and connect to `http://localhost:4567` to view the docs. As you make changes to the source, the web page will automatically refresh.

## Publishing to pages.nist.gov

In order to publish to pages.nist.gov, the static documents need to be built. The commands below will generate static documentation in the [`build/`](build/) directory.

Using Docker:

    $ docker build -t oscal-docs .
    $ docker run --rm -v $PWD:/usr/src/app/source -w /usr/src/app/source oscal-docs bundle exec middleman build --clean

Without Docker:

    $ bundle exec middleman build --clean

You can also use the included `deploy.sh` script to automate both the build and publishing to the `nist-pages` branch.

Refer to the pages.nist.gov publishing [instructions](https://github.com/usnistgov/pages-root/wiki) for more information on how to configure the GitHub repo.

## Updating Slate

You'll need to take into account any customizations you've made to the core framework before updating. Nonetheless, if it is deemed that the Slate framework itself needs to be updated, you'll first need to fork the upstream [`lord/slate`](https://github.com/lord/slate) repository. You can then set an upstream remote (if you haven't already) to your fork and fetch the latest changes as follows:

    $ git remote add slate-upstream <your-slate-fork.git>
    $ git fetch slate-upstream

Then, checkout the `docs` branch and create a merge commit from the `slate-upstream/master` branch, correcting any merge conflicts as necessary. Bear in mind that if you've made a substantial number of framework/theming customizations, you may have a lot of merge conflicts to resolve.

    $ git checkout docs
    $ git merge slate-upstream/master
