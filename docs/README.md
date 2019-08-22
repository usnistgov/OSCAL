# OSCAL Website

This subdirectory contains source code for the OSCAL Pages web site. For development you may need to know how to run it.

## Developing with Jekyll

Jekyll, a static web site generator implemented in Ruby, is documented with a Quickstart here: https://jekyllrb.com/docs/ 

The USWDS framework, a Jekyll customization we are using, is documented here: https://designsystem.digital.gov/


On Windows 10, for best results, install a Linux subsystem (LSW) such as an Ubuntu VM. This avoids Windows-related Jekyll configuration madness.

```
sudo gem install bundler -v 1.17.3
```

Next after you have installed the bundler gem, Ruby sources for Jekyll (as configured in the Gemfile) must be acquired and compiled:

```
bundle install
```

Now you can run Jekyll. To build a site for preview (from the `docs` subdirectory):

```
bundle exec jekyll build
```

To build the entire site including schema documentation requires more:

```
JEKYLL_ENV=production bundle exec jekyll build
```


To serve the site, rebuilding on changes to contents or templates:

```
JEKYLL_ENV=production bundle exec jekyll serve
```

or even

```
JEKYLL_ENV=production bundle exec jekyll serve --incremental
``` 

At that point you should have a Jekyll site running at http://localhost:4000

## Developing with Docker

The website can also be developed and built using the included Docker resources. Assuming you've [installed Docker](https://docs.docker.com/install/) and [Docker Compose](https://docs.docker.com/compose/install/) for your system, you can build and serve the site using Docker Compose as follows:

```
docker-compose up
```

Once the site is running, it can be accessed at http://localhost:4000

The `docker-compose.yml` file uses the `Dockerfile.dev` image to build the development version of the website.

