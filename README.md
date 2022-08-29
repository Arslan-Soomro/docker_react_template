## Docker + Vite + React Template
This template sets up a very basic react app with a Dockerfile,
so that you can just do `docker-compose build` to build the image
and run `docker-compose up` in order to run the container. Thats it !
No more configurations no more headaches.
Any node project can follow the same folder structure and configurations to successfully run in a docker container.

## Important Notes
- Create a new folder and then pull this template into it because node_modules folder is created into the parent directory.
- Always use yarn to install new packages
- In package.json any script that uses binaries should not be used instead prepand that with npx to avoid any unnecessary errors. \
For example \
`dev: 'vite' //Wrong` \
`dev: 'npx vite' // Right`

### Why is this template ?
Honestly, It took me days to figure out how to setup a vite react app.
Figuring out how to setup vite for docker was not that hard, the real problem was
syncing or mounting files into the container from host sytem without node_modules
folder conflicting or producing any errors.
It is a lot of hardwork and waste of time figuring out the right configurations, I went
through a few configurations, finally as everything was setup and I was ready run the app in
the container something would break or not work properly. It was so frustrating.
I didn't want to go there again, so I created this template which has all the things setup so I can just
pull and start working without wasting time. While I am at it, why not share it with everybody else.

### How is everything configured ?
yarn is used instead of npm because it allows us to easily define a custom path for
node_modules to be installed in this case it is parent directory of the current project.
The path is defined in the `.yarnrc`, this is done in order to avoid any conflicts between
the node_modules folder in host and container, which is very important.

Because the node_modules is in the parent directory, yarn or npm will not be able to find the
binaries, so you will have to use npx with such scripts, the instructions are given above.

