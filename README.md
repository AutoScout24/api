# This is DEPRECATED

This documentation refers to LCA. For new development, please refer to LCA-NG
https://listing-creation.api.autoscout24.com/docs#/


## AutoScout24 API Documentation (LCA)

This project uses `middleman` and `middleman-gh-pages` to create the API documentation.

### Development

- Run `bundle exec middleman server` to run the application on dev mode.
- Go to http://localhost:4567 to see the documentation
- Changes will trigger a "build" and static files will be automatically generated

### Additional ways of serving content

- Run `bundle exec middleman build` to create the static files
- `cd` to the `build` folder
- Open the `index.html` file or serve the entire build folder with one of the following options:
    - `python -m SimpleHTTPServer # within the build folder`
    - `docker run --rm -v $(pwd):/usr/share/nginx/html:ro nginx`
    - run `bundle exec middleman build` every time you do a change
- Changes will be automatically available without restart

### Deploy

- Run `./deploy.sh`
- Be happy

### Additional information

Documentation is "deployed" on `dappl7v001.unix.as24.local` machine
